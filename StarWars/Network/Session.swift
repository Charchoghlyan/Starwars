//
//  Session.swift
//  StarWars
//
//  Created by Sergey Charchoghlyan on 3/23/20.
//  Copyright © 2020 Sergey Charchoghlyan. All rights reserved.
//

import Alamofire

extension Network {
    /// Configuration for session manager
    static var session: Session {
        let configuration = URLSessionConfiguration.default
        configuration.headers = .default
        configuration.timeoutIntervalForRequest = 5
        configuration.timeoutIntervalForResource = 5
        configuration.requestCachePolicy = .useProtocolCachePolicy
        return Alamofire.Session(configuration: configuration)
    }
}
