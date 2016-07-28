//
//  RubifiedArray.swift
//  rubified-swift
//
//  Created by Ethan Nguyen on 7/23/16.
//  Copyright © 2016 Thanh Nguyen. All rights reserved.
//

import Foundation

/**
 Set of extended methods for Array manipulations deal with
 ArrayType, Optional, Comparable & Equatable elements.
 */
extension Array {
  /**
   Calls block with two arguments, the item and its index, for each item in array.
   
   - parameter callback: The block to be called for each element & index.
   */
  public func eachWithIndex(callback: (Element, Int) -> Void) {
    self.enumerate().forEach { callback($1, $0) }
  }
  
  /**
   Calls block with two arguments, the item and its index, for each item in array.
   
   - parameter callback: The block to be called for each element & index.
   */
  public func mapWithIndex<T>(callback: (Element, Int) -> T) -> [T] {
    return self.enumerate().map { callback($1, $0) }
  }
}