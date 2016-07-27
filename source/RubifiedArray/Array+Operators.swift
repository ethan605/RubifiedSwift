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
public func |<T: Equatable>(lhs: [T], rhs: [T]) -> [T] {
  return lhs + lhs.filter { !rhs.contains($0) }
}

// Intersection operation: lhs & rhs
public func &<T: Equatable>(lhs: [T], rhs: [T]) -> [T] {
  return lhs.filter { rhs.contains($0) }
}

// Complement operation: lhs - rhs
public func -<T: Equatable>(lhs: [T], rhs: [T]) -> [T] {
  return lhs.filter { !rhs.contains($0) }
}

// Symmetric-difference operation: lhs ^ rhs
public func ^<T: Equatable>(lhs: [T], rhs: [T]) -> [T] {
  return lhs.filter { !rhs.contains($0) } + rhs.filter { !lhs.contains($0) }
}

// Catersian product
public func *<T>(lhs: [T], rhs: [T]) -> [[T]] {
  return lhs.map { (elm) in rhs.map { [elm, $0] } }.reduce([], combine:+)
}

// Scalar product
public func *<T>(array: [T], mult: Int) -> [T] {
  if mult < 0 { fatalError("Negative multiplication factor") }
  return [Int](0..<mult).reduce([T]()) { (r, _) in r + array }
}

// String join
public func *<T>(array: [T], separator: String) -> String {
  return array.map { String($0) }.joinWithSeparator(separator)
}