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
  typealias CallbackWithoutIndex = Void -> Void
  
  func times(callback: CallbackWithoutIndex? = nil) -> [Int] {
    if self <= 0 {
      return []
    }
    
    return self._arrayFrom(0, to: self, callback: callback)
  }

  func upTo(index: Int, nonIndexCallback callback: CallbackWithoutIndex? = nil) -> [Int] {
    if index < self {
      return []
    }
    
    return self._arrayFrom(self, to: index+1, callback: callback)
  }
  
  func downTo(index: Int, nonIndexCallback callback: CallbackWithoutIndex? = nil) -> [Int] {
    if index >= self {
      return []
    }
    
    return self._arrayFrom(self, to: index-1, callback: callback)
  }
  
  // Private methods
  
  private func _arrayFrom(from: Int, to: Int, callback: CallbackWithoutIndex!) -> [Int] {
    let step = from <= to ? 1 : -1
    let range = from.stride(to: to, by: step)
    
    if callback != nil { for _ in range { callback() } }
    
    return [Int](range)
  }
}