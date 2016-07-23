//
//  Int+Numerics.swift
//  rubified-swift
//
//  Created by Ethan Nguyen on 7/23/16.
//  Copyright © 2016 Thanh Nguyen. All rights reserved.
//

import Foundation

// Numeric extensions
extension Int {
  func next() -> Int {
    return self + 1
  }
  
  func pred() -> Int {
    return self - 1
  }
  
  func toS(base: Int = 10, upperCase: Bool = false) -> String {
    let string = String(self, radix: base)
    
    if upperCase { return string.uppercaseString }
    else { return string }
  }
  
  func toF() -> Double {
    return Double(self)
  }
  
  func isZero() -> Bool {
    return self == 0
  }
  
  func isEven() -> Bool {
    return self % 2 == 0
  }
  
  func isOdd() -> Bool {
    return self % 2 == 1
  }
  
  func abs() -> UInt {
    if self > 0 { return UInt(self) }
    return UInt(-self)
  }
}