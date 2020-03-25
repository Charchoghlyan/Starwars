//
//  CharacteristicTableViewCell.swift
//  StarWars
//
//  Created by Sergey Charchoghlyan on 3/25/20.
//  Copyright © 2020 Sergey Charchoghlyan. All rights reserved.
//

import UIKit

class CharacteristicTableViewCell: UITableViewCell {

    static let id = "CharacteristicTableViewCell"
    
    let titleLabel = UILabel().then {
        $0.textColor = .black
        $0.textAlignment = .left
        $0.font = UIFont.boldSystemFont(ofSize: 12)
    }
    
    let descriptionLabel = UILabel().then {
        $0.textColor = .black
        $0.textAlignment = .left
        $0.font = UIFont.boldSystemFont(ofSize: 18)
    }
    
    let containerView = ContainerView().then {
        $0.backgroundColor = .white
    }
    
    var viewModel: CharacteristicCellViewModel!

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
        selectionStyle = .none
        backgroundColor = .white
        addSubview(containerView)
        containerView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(12)
        }
        containerView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(12)
            make.leading.equalToSuperview().offset(12)
        }
        containerView.addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.titleLabel.snp.bottom)
            make.leading.equalTo(self.titleLabel.snp.leading)
        }
    }

    func configure() {
        titleLabel.text = viewModel.titleText
        descriptionLabel.text = viewModel.descriptionText
    }
}
