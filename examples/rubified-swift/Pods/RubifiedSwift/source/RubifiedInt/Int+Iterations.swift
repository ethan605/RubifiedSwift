//
//  Int+Iterations.swift
//  rubified-swift
//
//  Created by Ethan Nguyen on 7/22/16.
//  Copyright © 2016 Thanh Nguyen. All rights reserved.
//

import Foundation

/**
 Extensions for Int
 Set of extended methods for iterations
 */
extension Int {
  /**
   Construct and returns an array of integers from 0 up to `self-1`
   and call a block (without index) for each element.
   
   - parameter callback: The callback to be called for each element. This param can be omitted.
   
   - returns: Array of integers from 0 to `self-1`
   */
  public func times(callback: (() -> Void)? = nil) -> [Int] {
    return self <= 0 ? [] : _buildArray(0, self, callback)
  }

  /**
   Construct and returns an array of integers from `self` up to a given `limit`
   and call a block (without index) for each element.
   
   - parameter limit: The upper limit.
   - parameter callback: The callback to be called for each element. This param can be omitted.
   
   - returns: Array of integers from `self` up to `limit`
   */
  public func upTo(limit: Int, _ callback: (() -> Void)? = nil) -> [Int] {
    return limit < self ? [] : _buildArray(self, limit+1, callback)
  }
  
  /**
   Construct and returns an array of integers from `self` down to a given `limit`
   and call a block (without index) for each element.
   
   - parameter limit: The lower limit.
   - parameter callback: The callback to be called for each element. This param can be omitted.
   
   - returns: Array of integers from `self` down to `limit`
   */
  public func downTo(limit: Int, _ callback: (() -> Void)? = nil) -> [Int] {
    return limit >= self ? [] : _buildArray(self+1, limit, callback)
  }
  
  // Private methods
  
  private func _buildArray(from: Int, _ to: Int, _ callback: (() -> Void)!) -> [Int] {
    let range = from.stride(to: to, by: from <= to ? 1 : -1)
    if callback != nil { for _ in range { callback() } }
    return [Int](range)
  }
}