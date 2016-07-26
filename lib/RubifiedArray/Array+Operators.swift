//
//  Array+Operators.swift
//  rubified-swift
//
//  Created by Ethan Nguyen on 7/25/16.
//  Copyright © 2016 Thanh Nguyen. All rights reserved.
//

import Foundation

// Push operation: array << newElement
public func <<<T>(inout array: Array<T>, newElement: T) {
  array.append(newElement)
}

// Union operation: lhs | rhs
public func |<T: Hashable>(lhs: Array<T>, rhs: Array<T>) -> Array<T> {
  return lhs + (rhs - lhs)
}

// Intersection operation: lhs & rhs
public func &<T: Hashable>(lhs: Array<T>, rhs: Array<T>) -> Array<T> {
  return lhs.filter { rhs.contains($0) }
}

// Complement operation: lhs - rhs
public func -<T: Hashable>(lhs: Array<T>, rhs: Array<T>) -> Array<T> {
  return lhs.filter { !rhs.contains($0) }
}

// Symmetric-difference operation: lhs ^ rhs
public func ^<T: Hashable>(lhs: Array<T>, rhs: Array<T>) -> Array<T> {
  return (lhs - rhs) + (rhs - lhs)
}

// Catersian product
public func *<T>(lhs: Array<T>, rhs: Array<T>) -> Array<Array<T>> {
  return lhs.map { (lhe) in rhs.map { [lhe, $0] } }.reduce([], combine:+)
}

// Scala product
public func *<T: Hashable>(array: Array<T>, mult: Int) -> Array<T> {
  if mult < 0 {
    fatalError("Negative multiplication factor")
  }
  
  var result = Array<T>()
  
  for _ in 0..<mult { result += array }
  
  return result
}

// String join
public func *<T: Hashable>(array: Array<T>, separator: String) -> String {
  return array.map { String($0) }.joinWithSeparator(separator)
}