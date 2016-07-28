//
//  Int+Numerics.swift
//  rubified-swift
//
//  Created by Ethan Nguyen on 7/23/16.
//  Copyright © 2016 Thanh Nguyen. All rights reserved.
//

import Foundation

/**
 Extensions for Int
 Set of extended methods for Int type numerics manipulation
 */
extension Int {
  /**
   Returns the absolute value of `self`
   
   - returns: The absolute value of this double itself.
   */
  public func abs() -> UInt { return self > 0 ? UInt(self) : UInt(-self) }
  
  /**
   Returns the integer after `self`.
   
   - returns: The integer equal to `self` + 1.
   */
  public func next() -> Int { return self + 1 }
  
  /**
   Returns the integer before `self`.
   
   - returns: The integer equal to `self` - 1.
   */
  public func pred() -> Int { return self - 1 }
  
  /**
   Returns a string containing the representation of `self` in a specific base.
   
   - parameter base: An integer to determine what radix `self` should be represented in. Default to `10`.
   - parameter uppercase: A bool value to determine if result string is represented in uppercase string.
   
   - returns: A string containing the representation of `self` in a specific base.
   */
  public func toS(base: Int = 10, uppercase: Bool = false) -> String {
    let string = String(self, radix: base)
    return uppercase ? string.uppercaseString : string
  }
  
  /**
   Convert `self` to floating point number.
   
   - returns: Converted floating point number of `self`.
   */
  public func toF() -> Double { return Double(self) }
  
  /**
   Check if `self` is even or not.
   
   - returns: Returns `true` if `self` is an even number.
   */
  public func isEven() -> Bool { return self % 2 == 0 }
  
  /**
   Check if `self` is odd or not.
   
   - returns: Returns `true` if `self` is an odd number.
   */
  public func isOdd() -> Bool { return self % 2 == 1 }
  
  /**
   Returns the greatest common divisor of 2 numbers (always positive).
   `0.gcd(x)` and `x.gcd(0)` return `abs(x)`.
   
   - Returns: The greatest common divisor of 2 numbers.
   */
  public func gcd(other: Int) -> Int {
    if self == 0 { return other } else if other == 0 { return self }
    var a: Int = self > other ? self : other
    var b: Int = self > other ? other : self
    var t = 0
    while a % b > 0 { t = a; a = b; b = t % b }
    return b > 0 ? b : -b
  }
  
  /**
   Returns the least common multiple of 2 numbers (always positive).
   `0.lcm(x)` and `x.lcm(0)` return zero.
   
   - returns: The least common multiple of 2 numbers.
   */
  public func lcm(other: Int) -> Int {
    return self == 0 || other == 0 ? 0 : (self * other) / self.gcd(other)
  }
}