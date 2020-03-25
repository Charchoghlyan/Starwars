//
//  ErrorHandling.swift
//  StarWars
//
//  Created by Sergey Charchoghlyan on 3/22/20.
//  Copyright © 2020 Sergey Charchoghlyan. All rights reserved.
//

import Foundation

enum APIErrorHandling: Error {
    case emptyData
    case unauthorized
    case forbidden
    case notFound
    case conflict
    case internalServerError
    case unknown
    
    init(code: Int) {
        switch code {
        case 402: self  = .unauthorized
        case 403: self  = .forbidden
        case 404: self  = .notFound
        case 409: self  = .conflict
        case 500: self  = .internalServerError
        default: self   = .unknown
        }
    }
}

extension APIErrorHandling: LocalizedError {
    // Override failure reason to response message
    var failureReason: String? {
        switch self {
        case .emptyData: return "Data is empty"
        case .unauthorized: return "Unauthorized request"
        case .forbidden: return "Forbidden request"
        case .notFound: return "404: Not found"
        case .conflict: return "Request conflict"
        case .internalServerError: return "Internal server error"
        case .unknown: return APIErrorHandling.unknown.errorDescription
        }
    }
}
