//
//  PersonageSection.swift
//  StarWars
//
//  Created by Sergey Charchoghlyan on 3/25/20.
//  Copyright © 2020 Sergey Charchoghlyan. All rights reserved.
//

import RxDataSources

struct PersonageSection {
    var header: String
    var items: [Item]
}

extension PersonageSection: AnimatableSectionModelType {
    typealias Item = Personage

    var identity: String {
        header
    }

    init(original: PersonageSection, items: [Item]) {
        self = original
        self.items = items
    }
}
