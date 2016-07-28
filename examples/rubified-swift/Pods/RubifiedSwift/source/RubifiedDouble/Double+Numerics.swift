//
//  Double+Numerics.swift
//  rubified-swift
//
//  Created by Ethan Nguyen on 7/26/16.
//  Copyright © 2016 Thanh Nguyen. All rights reserved.
//

import Foundation

/**
 Extensions for Double
 Set of extended methods for Double type numerics manipulation
 */
extension Double {
  /**
   Returns the absolute value of `self`
   
   - returns: The absolute value of this double itself.
   */
  public func abs() -> UInt { return self > 0 ? UInt(self) : UInt(-self) }
}