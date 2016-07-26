//
//  Array+Operators.swift
//  rubified-swift
//
//  Created by Ethan Nguyen on 7/25/16.
//  Copyright © 2016 Thanh Nguyen. All rights reserved.
//

import Foundation

func <<<T>(inout array: Array<T>, newElement: T) {
  array.append(newElement)
}

func -<T: Hashable>(lhs: Array<T>, rhs: Array<T>) -> Array<T> {
  return lhs.filter { !rhs.contains($0) }
}

func &<T: Hashable>(lhs: Array<T>, rhs: Array<T>) -> Array<T> {
  return lhs.filter { rhs.contains($0) }
}

func |<T: Hashable>(lhs: Array<T>, rhs: Array<T>) -> Array<T> {
  return lhs + (rhs - lhs)
}

func *<T: Hashable>(array: Array<T>, mult: Int) -> Array<T> {
  if mult < 0 {
    fatalError("Negative argument")
  }
  
  var result = Array<T>()
  
  for _ in 0..<mult { result += array }
  
  return result
}

func *<T: Hashable>(array: Array<T>, separator: String) -> String {
  return array.map { String($0) }.joinWithSeparator(separator)
}