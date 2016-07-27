//
//  Double+Numerics.swift
//  rubified-swift
//
//  Created by Ethan Nguyen on 7/26/16.
//  Copyright © 2016 Thanh Nguyen. All rights reserved.
//

import Foundation

extension Double {
  public func abs() -> UInt { return self > 0 ? UInt(self) : UInt(-self) }
}