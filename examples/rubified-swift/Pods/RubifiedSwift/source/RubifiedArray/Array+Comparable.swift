//
//  Array+Comparable.swift
//  rubified-swift
//
//  Created by Ethan Nguyen on 7/28/16.
//  Copyright © 2016 Thanh Nguyen. All rights reserved.
//

import Foundation

/**
 Extensions for Array
 Set of extended methods for Comparable elements manipulation
 */
extension Array where Element: Comparable {
  /**
   Returns the object in this array with the maximum value.
   
   - returns: Returns `nil` if array is empty. Otherwise returns the element with maximum value.
   */
  public func max() -> Element? {
    return self.dropFirst().reduce(self.first) { (r, e) in r > e ? r : e }
  }
  
  /**
   Returns the object in this array with the minimum value.
   
   - returns: Returns `nil` if array is empty. Otherwise returns the element with minimum value.
   */
  public func min() -> Element? {
    return self.dropFirst().reduce(self.first) { (r, e) in r < e ? r : e }
  }
}