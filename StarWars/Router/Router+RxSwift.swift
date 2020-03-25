//
//  Router+RXSwift.swift
//  StarWars
//
//  Created by Sergey Charchoghlyan on 3/21/20.
//  Copyright © 2020 Sergey Charchoghlyan. All rights reserved.
//

import RxSwift

extension Reactive where Base: Router {

    func push(_ drawable: Drawable, isAnimated: Bool) -> Single<Void> {
        return Single.create {[weak base] (single) -> Disposable in
            guard let base = base else {
                single(.success(()))
                return Disposables.create()
            }
            base.push(drawable, isAnimated: isAnimated) {
                single(.success(()))
            }
            return Disposables.create()
        }
    }
}
