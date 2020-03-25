//
//  BaseCoordinator.swift
//  StarWars
//
//  Created by Sergey Charchoghlyan on 3/21/20.
//  Copyright © 2020 Sergey Charchoghlyan. All rights reserved.
//

import RxSwift

class BaseCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []

    func start() -> Single<Void> {
        fatalError("ABSTRACT")
    }

    func coordinate(_ coordinator: Coordinator) -> Single<Void> {
        store(coordinator: coordinator)
        return coordinator.start().do(onSuccess: {[weak self, weak coordinator] (_) in
            guard let self = self, let coordinator = coordinator else {return}
            self.free(coordinator: coordinator)
        })
    }
}
