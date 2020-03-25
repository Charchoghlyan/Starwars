//
//  ViewController.swift
//  StarWars
//
//  Created by Sergey Charchoghlyan on 3/21/20.
//  Copyright © 2020 Sergey Charchoghlyan. All rights reserved.
//

import UIKit
import RxSwift
import SnapKit
import RxDataSources
import RxOptional

class PersonageSearchViewController: UIViewController {

    let searchBar = SearchBar().then {
        $0.placeholder = "Search..."
        $0.backgroundImage = UIImage()
        $0.barTintColor = .white
        $0.tintColor = .black
        $0.textColor = .black
        $0.setImageColor(.black)
        $0.setBackgroundColor(.clear)
    }
    
    let tableView = UITableView().then {
        $0.register(PersonageTableViewCell.self, forCellReuseIdentifier: PersonageTableViewCell.id)
        $0.rowHeight = 140
        $0.backgroundColor = .white
        $0.estimatedRowHeight = 140
        $0.keyboardDismissMode = .interactive
        $0.separatorStyle = .none
    }
    
    var viewModel: PersonageSearchViewModel!
    private var dataSource: RxTableViewSectionedReloadDataSource<PersonageSection>!
    private(set) lazy var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        bindViews()
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        setupNavigationBar()
        setupSearchBar()
        setupTableView()
    }

    private func setupSearchBar() {
        navigationItem.titleView = searchBar
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.barTintColor = .white
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    private func bindViews() {
        let searchText = searchBar.rx.text.filterNil().asObservable()
        let viewWillAppear = self.rx.methodInvoked(#selector(self.viewWillAppear(_:))).map({$0.first as? Bool ?? false}).asObservable()
        let input = PersonageSearchViewModel.Input(viewWillAppear: viewWillAppear, searchText: searchText, modelSelected: tableView.rx.modelSelected(PersonageSection.Item.self).asDriver())
        let output = viewModel.transform(input)
        dataSource = RxTableViewSectionedReloadDataSource<PersonageSection>(configureCell: { (dataSource, tableView, indexPath, item) -> UITableViewCell in
            let cell = tableView.dequeueReusableCell(withIdentifier: PersonageTableViewCell.id, for: indexPath) as! PersonageTableViewCell
            cell.viewModel = self.viewModel.createCellViewModel(for: item)
            cell.configure()
            return cell
        })
        output.personageSection?.compactMap({$0}).bind(to: tableView.rx.items(dataSource: dataSource)).disposed(by: disposeBag)
        output.error?.bind(onNext: {[weak self] (error) in
            guard let self = self else {return}
            self.showAlert(title: nil, message: error, style: .alert, actions: [AlertAction(title: "OK", style: .cancel)]).subscribe().disposed(by: self.disposeBag)
        }).disposed(by: self.disposeBag)
    }
}
