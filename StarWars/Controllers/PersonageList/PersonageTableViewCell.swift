//
//  PersonageTableViewCell.swift
//  StarWars
//
//  Created by Sergey Charchoghlyan on 3/22/20.
//  Copyright © 2020 Sergey Charchoghlyan. All rights reserved.
//

import UIKit

class PersonageTableViewCell: UITableViewCell {
    
    static let id = "PersonageTableViewCell"
    
    let nameLabel = UILabel().then {
        $0.textColor = .black
        $0.textAlignment = .left
        $0.font = UIFont.boldSystemFont(ofSize: 18)
    }
    
    let containerView = ContainerView().then {
        $0.backgroundColor = .white
    }
    
    var viewModel: PersonageCellViewModel!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureUI() {
        backgroundColor = .white
        selectionStyle = .none
        addSubview(containerView)
        containerView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(12)
        }
        containerView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(12)
            make.trailing.equalToSuperview().offset(-12)
        }
    }

    func configure() {
        nameLabel.text = viewModel.personage.name
    }
}
