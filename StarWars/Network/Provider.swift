//
//  Provider.swift
//  StarWars
//
//  Created by Sergey Charchoghlyan on 3/22/20.
//  Copyright © 2020 Sergey Charchoghlyan. All rights reserved.
//

import Alamofire
import RxSwift

class Provider {
    let session: Session
    init(session: Session) {
        self.session = session
    }
}

extension Provider {
    func request<T: Decodable> (_ urlConvertible: URLRequestConvertible) -> Single<T> {
        print(try? urlConvertible.asURLRequest())
        return Single<T>.create { single in
            let request = self.session.request(urlConvertible).validate(statusCode: 200..<300).responseJSON { (response) in
                print(response)
                switch response.result {
                case .success:
                    guard let data = response.data else {
                        single(.error(response.error!))
                        return
                    }
                    do {
                        single(.success(try JSONDecoder().decode(T.self, from: data)))
                    } catch {
                        print(error)
                        single(.error(error))
                    }
                case .failure(let error):
                    if let statusCode = response.response?.statusCode {
                        let reason = APIErrorHandling(code: statusCode)
                        single(.error(reason))
                    } else {
                        print(error)
                        single(.error(error))
                    }
                }
            }
            return Disposables.create {
                request.cancel()
            }
        }
    }
}
