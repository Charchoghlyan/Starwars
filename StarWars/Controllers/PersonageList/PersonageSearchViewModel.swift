//
//  ViewModel.swift
//  StarWars
//
//  Created by Sergey Charchoghlyan on 3/21/20.
//  Copyright © 2020 Sergey Charchoghlyan. All rights reserved.
//

import RxSwift
import RxCocoa
import RxDataSources

class PersonageSearchViewModel: ViewModelIO {
    
    private let disposeBag = DisposeBag()
    
    var didSelect: PublishSubject<Personage?> = .init()
    
    init() { }
    
    struct Input {
        let viewWillAppear: Observable<Bool>
        let searchText: Observable<String>
        let modelSelected: Driver<PersonageSection.Item>
    }
    
    struct Output {
        let personageSection: Observable<[PersonageSection]>?
        let error: Observable<String>?
        let modelSelected: Driver<PersonageSection.Item>
    }
    
    func search(by name: String) -> Single<PersonageSearchResponse> {
        Network.provider.request(PersonageEndPoint.getList(name))
    }
    
}


extension PersonageSearchViewModel {
    func transform(_ input: PersonageSearchViewModel.Input) -> PersonageSearchViewModel.Output {
        let networkMaterializing = NetworkMaterializingDataWithError(load: input.searchText.filterEmpty())
        let data = input.searchText.flatMapLatest { (text) -> Observable<[Personage]> in
            return DBManager.default.retrieveData(by: text)
        }.map({[PersonageSection(header: "", items: $0)]})
        input.modelSelected.asObservable().bind(to: self.didSelect).disposed(by: disposeBag)
        let error = networkMaterializing.error.compactMap({$0})
        return Output(personageSection: data, error: error, modelSelected: input.modelSelected)
    }
}

extension PersonageSearchViewModel {
    class NetworkMaterializingDataWithError {
        var data: Observable<[Personage]> = .just([])
        var error: Observable<String?> = .just(nil)
        init(load: Observable<String>) {
            let loader = load
                .throttle(RxTimeInterval.milliseconds(750), scheduler: MainScheduler.instance)
                .distinctUntilChanged().flatMapLatest { (query) in
                    self.search(by: query).asObservable().materialize()
            }.do(onNext: { (event) in
                Observable.from(optional: event.map({$0.personages.toArray()}).element).bind(to: DBManager.default.save(_:))
            }).share()
            error = loader.map({$0.error?.localizedDescription})
        }
        func search(by name: String) -> Single<PersonageSearchResponse> {
            Network.provider.request(PersonageEndPoint.getList(name))
        }
    }
}

extension PersonageSearchViewModel {
    func createCellViewModel(for personage: Personage) -> PersonageCellViewModel {
        return PersonageCellViewModel(personage: personage)
    }
}
