//
//  Array+Operators.swift
//  rubified-swift
//
//  Created by Ethan Nguyen on 7/25/16.
//  Copyright © 2016 Thanh Nguyen. All rights reserved.
//

import Foundation

// Push operation: array << newElement
public func <<<T>(inout array: [T], newElement: T) -> [T] {
  array.append(newElement)
  return array
}

// Union operation: lhs | rhs
public func |<T: Hashable>(lhs: [T], rhs: [T]) -> [T] {
  return lhs + (rhs - lhs)
}

// Intersection operation: lhs & rhs
public func &<T: Hashable>(lhs: [T], rhs: [T]) -> [T] {
  return lhs.filter { rhs.contains($0) }
}

// Complement operation: lhs - rhs
public func -<T: Hashable>(lhs: [T], rhs: [T]) -> [T] {
  return lhs.filter { !rhs.contains($0) }
}

// Symmetric-difference operation: lhs ^ rhs
public func ^<T: Hashable>(lhs: [T], rhs: [T]) -> [T] {
  return (lhs - rhs) + (rhs - lhs)
}

// Catersian product
public func *<T>(lhs: [T], rhs: [T]) -> [[T]] {
  return lhs.map { (lhe) in rhs.map { [lhe, $0] } }.reduce([], combine:+)
}

// Scala product
public func *<T: Hashable>(array: [T], mult: Int) -> [T] {
  if mult < 0 {
    fatalError("Negative multiplication factor")
  }
  
  var result = [T]()
  
  for _ in 0..<mult { result += array }
  
  return result
}

// String join
public func *<T: Hashable>(array: [T], separator: String) -> String {
  return array.map { String($0) }.joinWithSeparator(separator)
}