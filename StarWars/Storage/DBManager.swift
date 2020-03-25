//
//  DBManager.swift
//  StarWars
//
//  Created by Sergey Charchoghlyan on 3/24/20.
//  Copyright © 2020 Sergey Charchoghlyan. All rights reserved.
//

import RxRealm
import Realm
import RealmSwift
import RxSwift
import RxRelay

class DBManager {
    
    lazy var configuration: Realm.Configuration = {
        var config = Realm.Configuration.defaultConfiguration
        return config
    }()

    private lazy var realm: Realm = {
        let realm: Realm
        do {
            realm = try Realm(configuration: self.configuration)
            return realm
        } catch {
            print(error)
            fatalError()
        }
    }()
    
    private let disposeBag = DisposeBag()
    static let `default` = DBManager()
    
    private init() {}
    
    func save(_ data: Observable<[Personage]>) {
        data.subscribe(onNext: {[weak self] (personage) in
            try! self?.realm.write({
                self?.realm.add(personage, update: .modified)
            })
        }).disposed(by: disposeBag)
    }
    
    func retrieveData(by name: String) -> Observable<[Personage]> {
        print(realm.objects(Personage.self))
        return name.isEmpty ? Observable.array(from: realm.objects(Personage.self)) : Observable.array(from: realm.objects(Personage.self).filter("name contains[c] %@", name))
    }
    
}
