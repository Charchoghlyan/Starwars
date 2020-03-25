//
//  AppCoordinator.swift
//  StarWars
//
//  Created by Sergey Charchoghlyan on 3/21/20.
//  Copyright © 2020 Sergey Charchoghlyan. All rights reserved.
//

import Foundation
import RxSwift

class AppCoordinator: BaseCoordinator {
    
    let window : UIWindow
    
    init(window: UIWindow) {
        self.window = window
        super.init()
    }
    
    override func start() -> Single<Void> {
        let navigationController = UINavigationController()
        let router = Router(navigationController: navigationController)
        let personageSearchCoordinator = PersonageSearchCoordinator(router: router)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        return coordinate(personageSearchCoordinator)
    }
}
