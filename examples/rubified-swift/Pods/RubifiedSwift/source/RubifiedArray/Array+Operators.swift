//
//  Array+Operators.swift
//  rubified-swift
//
//  Created by Ethan Nguyen on 7/25/16.
//  Copyright © 2016 Thanh Nguyen. All rights reserved.
//

import Foundation

/**
 Perform a push operation between an array and a new element: `array` << `newElement`.
 
 - returns: The array after appending.
 */
public func <<<T>(inout array: [T], newElement: T) -> [T] {
  array.append(newElement)
  return array
}

/**
 Perform an union between 2 arrays: `lhs` | `rhs`.
 
 - returns: New array that contains elements appear in both arrays.
 */
public func |<T: Equatable>(lhs: [T], rhs: [T]) -> [T] {
  return lhs + lhs.filter { !rhs.contains($0) }
}

/**
 Perform an intersection between 2 arrays: `lhs` & `rhs`.
 
 - returns: New array that contains elements in common of 2 arrays.
 */
public func &<T: Equatable>(lhs: [T], rhs: [T]) -> [T] {
  return lhs.filter { rhs.contains($0) }
}

/**
 Perform a complement between 2 arrays: `lhs` - `rhs`.
 
 - returns: New array that contains elements appear in `lhs` but not appear in `rhs`.
 */
public func -<T: Equatable>(lhs: [T], rhs: [T]) -> [T] {
  return lhs.filter { !rhs.contains($0) }
}

/**
 Perform a symmetric-difference between 2 arrays: `lhs` ^ `rhs`.
 
 - returns: New array that contains elements not in common of 2 arrays.
 */
public func ^<T: Equatable>(lhs: [T], rhs: [T]) -> [T] {
  return lhs.filter { !rhs.contains($0) } + rhs.filter { !lhs.contains($0) }
}

/**
 Perform a catersian product of 2 arrays: `lhs` * `rhs`.
 
 - returns: New array of pairs picked from each array in original order.
 */
public func *<T>(lhs: [T], rhs: [T]) -> [[T]] {
  return lhs.map { (elm) in rhs.map { [elm, $0] } }.reduce([], combine:+)
}

/**
 Perform a scalar product between an array and a non-negative integer `mult`.
 Raise a "Negative multiplication factor" errof if `mult` is negative
 
 - returns: New array that duplicates the original array. Returns empty array if `mult` is `0`.
 */
public func *<T>(array: [T], mult: Int) -> [T] {
  if mult < 0 { fatalError("Negative multiplication factor") }
  return [Int](0..<mult).reduce([T]()) { (r, _) in r + array }
}

/**
 Join elements of array using a string separator.
 
 - returns: The string contains all elements converted as string.
 */
public func *<T>(array: [T], separator: String) -> String {
  return array.map { String($0) }.joinWithSeparator(separator)
}