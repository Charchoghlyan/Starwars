//
//  Network.swift
//  StarWars
//
//  Created by Sergey Charchoghlyan on 3/21/20.
//  Copyright © 2020 Sergey Charchoghlyan. All rights reserved.
//

import RxSwift
import Alamofire

struct Network {
    static let provider = Provider(session: session)
}
