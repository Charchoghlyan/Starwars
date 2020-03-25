//
//  NetworkConfiguration.swift
//  StarWars
//
//  Created by Sergey Charchoghlyan on 3/21/20.
//  Copyright © 2020 Sergey Charchoghlyan. All rights reserved.
//

import Foundation


/// Configuration network
extension Network {
    struct Configuration {
        /// Environment state
        /// - Default: development
        static let environment: Environment = .development
        /// Logger for network
        /// - Default: Enabled
        static let networkLogger: Bool = true
    }
}
