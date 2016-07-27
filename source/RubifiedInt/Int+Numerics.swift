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
  public func abs() -> UInt { return self > 0 ? UInt(self) : UInt(-self) }
  
  public func next() -> Int { return self + 1 }
  public func pred() -> Int { return self - 1 }
  
  public func toS(base: Int = 10, upperCase: Bool = false) -> String {
    let string = String(self, radix: base)
    return upperCase ? string.uppercaseString : string
  }
  
  public func toF() -> Double { return Double(self) }
  public func isEven() -> Bool { return self % 2 == 0 }
  public func isOdd() -> Bool { return self % 2 == 1 }
  
  // Greatest common divisor
  public func gcd(other: Int) -> Int {
    var a: Int = self > other ? self : other
    var b: Int = self > other ? other : self
    var t = 0
    while a % b > 0 { t = a; a = b; b = t % b }
    return b
  }
  
  // Least common multiple
  public func lcm(other: Int) -> Int {
    return (self * other) / self.gcd(other)
  }
}