//
//  NetworkEnvironment.swift
//  StarWars
//
//  Created by Sergey Charchoghlyan on 3/21/20.
//  Copyright © 2020 Sergey Charchoghlyan. All rights reserved.
//

import Foundation

extension Network {
    /// Helper enum for network environment state
    enum Environment {
        case production
        case development
        
        var baseURL: String {
            switch self {
            case .production: return "https://swapi.co/api/"
            case .development: return "https://swapi.co/api/"
            }
        }
    }
}

