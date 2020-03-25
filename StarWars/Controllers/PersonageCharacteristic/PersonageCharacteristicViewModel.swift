//
//  PersonageCharacteristicViewModel.swift
//  StarWars
//
//  Created by Sergey Charchoghlyan on 3/21/20.
//  Copyright © 2020 Sergey Charchoghlyan. All rights reserved.
//

import RxSwift

class PersonageCharacteristicViewModel: ViewModelIO {
    
    let section: Observable<[CharacteristicSection]>
    
    init(personage: Personage) {
        let items: [CharacteristicSection.Row] = [.characteristic(title: "Eye color", description: personage.eyeColor.capitalizingFirstLetter()),        .characteristic(title: "Gender", description: personage.gender.capitalizingFirstLetter()), .characteristic(title: "Hair color", description: personage.hairColor.capitalizingFirstLetter())]
        section = Observable.of([CharacteristicSection.characteristicDataSection(header: UUID().uuidString, items: items)])
    }
    
    struct Input {
        
    }
    
    struct Output {
        let characteristicSection: Observable<[CharacteristicSection]>
    }
}

extension PersonageCharacteristicViewModel {
    func transform(_ input: PersonageCharacteristicViewModel.Input) -> PersonageCharacteristicViewModel.Output {
        return Output(characteristicSection: self.section)
    }
}

extension PersonageCharacteristicViewModel {
    func createCellViewModel(title: String, decription: String) -> CharacteristicCellViewModel {
        return CharacteristicCellViewModel(titleText: title, descriptionText: decription) 
    }
}
