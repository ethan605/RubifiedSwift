//
//  Int+Iterations.swift
//  rubified-swift
//
//  Created by Ethan Nguyen on 7/22/16.
//  Copyright © 2016 Thanh Nguyen. All rights reserved.
//

import Foundation

// Iteration extensions
extension Int {
  public func times(callback: (() -> Void)? = nil) -> [Int] {
    return self <= 0 ? [] : _buildArray(0, self, callback)
  }

  public func upTo(index: Int, _ callback: (() -> Void)? = nil) -> [Int] {
    return index < self ? [] : _buildArray(self, index+1, callback)
  }
  
  public func downTo(index: Int, _ callback: (() -> Void)? = nil) -> [Int] {
    return index >= self ? [] : _buildArray(self, index-1, callback)
  }
  
  // Private methods
  
  private func _buildArray(from: Int, _ to: Int, _ callback: (() -> Void)!) -> [Int] {
    let range = from.stride(to: to, by: from <= to ? 1 : -1)
    if callback != nil { for _ in range { callback() } }
    return [Int](range)
  }
}