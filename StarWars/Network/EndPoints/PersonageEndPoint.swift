//
//  Personage.swift
//  StarWars
//
//  Created by Sergey Charchoghlyan on 3/21/20.
//  Copyright © 2020 Sergey Charchoghlyan. All rights reserved.
//

import Alamofire

enum PersonageEndPoint {
    case getList(String)
}

extension PersonageEndPoint: URLRequestConvertible, TargetType {
    func asURLRequest() throws -> URLRequest {
        var urlRequest = URLRequest(url: baseURL.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        urlRequest = try encoding.encode(urlRequest, with: parameters)
        return urlRequest
    }
    
    var path: String {
        return "people/"
    }
    
    var parameters: Parameters {
        switch self {
        case .getList(let name):
            return ["search": name]
        }
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var encoding: ParameterEncoding {
        return URLEncoding.default
    }
}
