//
//  PersonCoordinator.swift
//  StarWars
//
//  Created by Sergey Charchoghlyan on 3/21/20.
//  Copyright © 2020 Sergey Charchoghlyan. All rights reserved.
//

import RxSwift

class PersonageSearchCoordinator: BaseCoordinator {

    let router: Router
    let disposeBag = DisposeBag()

    init(router: Router) {
        self.router = router
    }

    override func start() -> Single<Void> {
        let viewModel = PersonageSearchViewModel()
        let viewController = PersonageSearchViewController()
        viewController.viewModel = viewModel
        viewModel.didSelect.compactMap({$0}).subscribe(onNext: {[unowned self] (personage) in
            self.showPersonageCharacteristic(personage: personage).subscribe().disposed(by: self.disposeBag)
        }).disposed(by: disposeBag)
        return router.rx.push(viewController, isAnimated: true)
    }
    
    func showPersonageCharacteristic(personage: Personage) -> Single<Void> {
        let personageCharacteristicCoordinator = PersonageCharacteristicCoordinator(router: router, personage: personage)
        return coordinate(personageCharacteristicCoordinator)
    }
    
}
