//
//  TargetType.swift
//  StarWars
//
//  Created by Sergey Charchoghlyan on 3/21/20.
//  Copyright © 2020 Sergey Charchoghlyan. All rights reserved.
//

import Alamofire

protocol TargetType {
    var baseURL: URL { get }
    var path: String { get }
    var parameters: Parameters { get }
    var method: HTTPMethod { get }
    var encoding: ParameterEncoding { get }
}

extension TargetType {
    var baseURL: URL {
        guard let url = URL(string: Network.Configuration.environment.baseURL) else { fatalError("baseURL could not be configured.")}
        return url
    }
}
