//
//  ContainerView.swift
//  StarWars
//
//  Created by Sergey Charchoghlyan on 3/25/20.
//  Copyright © 2020 Sergey Charchoghlyan. All rights reserved.
//

import UIKit

class ContainerView: UIView {
    
    init() {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 10
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 2, height: 2)
        layer.shadowRadius = 5
        layer.shadowOpacity = 0.2
    }
}
