//
//  ViewModelOI.swift
//  StarWars
//
//  Created by Sergey Charchoghlyan on 3/22/20.
//  Copyright © 2020 Sergey Charchoghlyan. All rights reserved.
//

import Foundation

protocol ViewModelIO {
    associatedtype Input
    associatedtype Output
    func transform(_ input: Input) -> Output
}
