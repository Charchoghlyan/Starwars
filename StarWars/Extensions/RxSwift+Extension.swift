//
//  RxSwift+Extension.swift
//  StarWars
//
//  Created by Sergey Charchoghlyan on 3/22/20.
//  Copyright © 2020 Sergey Charchoghlyan. All rights reserved.
//

import RxSwift
import RxCocoa

extension ObservableType {
    func catchErrorJustComplete() -> Observable<Element> {
        return catchError { _ in
            return Observable.empty()
        }
    }
    
    func asDriverOnErrorJustComplete() -> Driver<Element> {
        return asDriver { error in
            return Driver.empty()
        }
    }
    
    func mapToVoid() -> Observable<Void> {
        return map { _ in }
    }
}
