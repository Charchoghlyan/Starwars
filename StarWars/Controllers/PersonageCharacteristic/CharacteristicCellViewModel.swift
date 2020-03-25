//
//  CharacteristicCellViewModel.swift
//  StarWars
//
//  Created by Sergey Charchoghlyan on 3/25/20.
//  Copyright © 2020 Sergey Charchoghlyan. All rights reserved.
//

import Foundation

class CharacteristicCellViewModel {
    let titleText: String
    let descriptionText: String
    init(titleText: String, descriptionText: String) {
        self.titleText = titleText
        self.descriptionText = descriptionText
    }
}
