//
//  Array+ArrayType.swift
//  rubified-swift
//
//  Created by Ethan Nguyen on 7/28/16.
//  Copyright © 2016 Thanh Nguyen. All rights reserved.
//

import Foundation

/**
 Set of extended methods for Array manipulations deal with
 ArrayType, Optional, Comparable & Equatable elements.
 */
extension Array where Element: _ArrayType {
  /**
   Transposes the rows and columns to change an `m*n`-sized matrix to an `n*m`-sized matrix.
   Raise an "Element sizes mismatched" error if element arrays is not at the same size.
   
   - returns: The transposed array.
   */
  public func transpose() -> [[Element.Generator.Element]] {
    // Map and check if all elements' sizes are identical
    let size = self.map { $0.count }.reduce(0) { $0 == 0 || $0 == $1 ? $1 : 0 }
    if size == 0 { fatalError("Element sizes mismatched") }
    return [Int](0..<size).map { (idx) in self.map { $0[idx] } }
  }
}