//
//  CharacteristicSection.swift
//  StarWars
//
//  Created by Sergey Charchoghlyan on 3/25/20.
//  Copyright © 2020 Sergey Charchoghlyan. All rights reserved.
//

import RxDataSources

enum CharacteristicSection: SectionModelType {
    typealias Item = Row

    case characteristicDataSection(header: String, items: [Row])

    enum Row {
        case characteristic(title: String, description: String)
    }

    var identity: String {
        switch self {
        case .characteristicDataSection(let header, _):
            return header
        }
    }

    var items: [Row] {
        switch self {
        case .characteristicDataSection(_, let items):
            return items
        }
    }

    init(original: CharacteristicSection, items: [Row]) {
        switch original {
        case .characteristicDataSection(let header, _):
            self = .characteristicDataSection(header: header, items: items)
        }
    }

}
