//
//  PersonageCharacteristicCoordinator.swift
//  StarWars
//
//  Created by Sergey Charchoghlyan on 3/21/20.
//  Copyright © 2020 Sergey Charchoghlyan. All rights reserved.
//

import RxSwift

class PersonageCharacteristicCoordinator: BaseCoordinator {

    let router: Router
    let personage: Personage
    let disposeBag = DisposeBag()

    init(router: Router, personage: Personage) {
        self.router = router
        self.personage = personage
    }

    override func start() -> Single<Void> {
        let viewModel = PersonageCharacteristicViewModel(personage: personage)
        let viewController = PersonageCharacteristicViewController(viewModel: viewModel)
        return router.rx.push(viewController, isAnimated: true)
    }
}
