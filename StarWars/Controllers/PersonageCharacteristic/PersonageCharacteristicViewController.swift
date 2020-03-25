//
//  PersonageCharacteristicViewController.swift
//  StarWars
//
//  Created by Sergey Charchoghlyan on 3/21/20.
//  Copyright © 2020 Sergey Charchoghlyan. All rights reserved.
//

import UIKit
import RxDataSources
import RxSwift

class PersonageCharacteristicViewController: UIViewController {

    let viewModel: PersonageCharacteristicViewModel
    private var dataSource: RxTableViewSectionedReloadDataSource<CharacteristicSection>!
    private(set) lazy var disposeBag = DisposeBag()
    
    let tableView = UITableView().then {
        $0.register(CharacteristicTableViewCell.self, forCellReuseIdentifier: CharacteristicTableViewCell.id)
        $0.rowHeight = 80
        $0.estimatedRowHeight = 80
        $0.keyboardDismissMode = .interactive
        $0.separatorStyle = .none
        $0.backgroundColor = .white
    }
    
    init(viewModel: PersonageCharacteristicViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        bindViews()
    }

    private func configureUI() {
        view.backgroundColor = .white
        setupTableView()
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    private func bindViews() {
        let input = PersonageCharacteristicViewModel.Input()
        let output = viewModel.transform(input)
        dataSource = RxTableViewSectionedReloadDataSource<CharacteristicSection>(configureCell: { (dataSource, tableView, indexPath, item) -> UITableViewCell in
            switch dataSource[indexPath] {
            case .characteristic(title: let title, description: let description):
                let cell = tableView.dequeueReusableCell(withIdentifier: CharacteristicTableViewCell.id, for: indexPath) as! CharacteristicTableViewCell
                cell.viewModel = self.viewModel.createCellViewModel(title: title, decription: description)
                cell.configure()
                return cell
            }
        })
        output.characteristicSection.bind(to: tableView.rx.items(dataSource: dataSource)).disposed(by: disposeBag)
    }
}
