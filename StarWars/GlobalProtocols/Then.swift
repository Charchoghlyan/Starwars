//
//  Then.swift
//  StarWars
//
//  Created by Sergey Charchoghlyan on 3/22/20.
//  Copyright © 2020 Sergey Charchoghlyan. All rights reserved.
//

import Foundation
import UIKit

public protocol Then {}

extension Then where Self: Any {
  /// Makes it available to set properties with closures just after initializing and copying the value types.
  public func with(_ block: (inout Self) throws -> Void) rethrows -> Self {
    var copy = self
    try block(&copy)
    return copy
  }
  /// Makes it available to execute something with closures.
  public func `do`(_ block: (Self) throws -> Void) rethrows {
    try block(self)
  }
}

extension Then where Self: AnyObject {
  /// Makes it available to set properties with closures just after initializing.
  public func then(_ block: (Self) throws -> Void) rethrows -> Self {
    try block(self)
    return self
  }
}

extension NSObject: Then {}
extension CGPoint: Then {}
extension CGRect: Then {}
extension CGSize: Then {}
extension CGVector: Then {}
extension Array: Then {}
extension Dictionary: Then {}
extension Set: Then {}
extension UIEdgeInsets: Then {}
extension UIOffset: Then {}
extension UIRectEdge: Then {}
