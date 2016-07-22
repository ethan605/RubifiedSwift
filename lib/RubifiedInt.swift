//
//  RubifiedInt.swift
//  rubified-swift
//
//  Created by Ethan Nguyen on 7/22/16.
//  Copyright © 2016 Thanh Nguyen. All rights reserved.
//

import Foundation

extension Int {
  typealias CallbackWithIndex = Int -> Void
  typealias CallbackWithoutIndex = Void -> Void
  
  func times(callback: CallbackWithIndex? = nil) -> [Int] {
    if self <= 0 {
      return []
    }
    
    return self._arrayFrom(0, to: self-1, indexCallback: callback)
  }
  
  func times(callback: CallbackWithoutIndex?) -> [Int] {
    if self <= 0 {
      return []
    }
    
    return self._arrayFrom(0, to: self-1, nonIndexCallback: callback)
  }
  
  func upTo(index: Int, callback: CallbackWithIndex? = nil) -> [Int] {
    if index < self {
      return []
    }
    
    return self._arrayFrom(self, to: index, indexCallback: callback)
  }
  
  func upTo(index: Int, callback: CallbackWithoutIndex? = nil) -> [Int] {
    if index < self {
      return []
    }
    
    return self._arrayFrom(self, to: index, nonIndexCallback: callback)
  }
  
  func downTo(index: Int, callback: CallbackWithIndex? = nil) -> [Int] {
    if index >= self {
      return []
    }
    
    return self._arrayFrom(self, to: index, indexCallback: callback)
  }
  
  func downTo(index: Int, callback: CallbackWithoutIndex? = nil) -> [Int] {
    if index < self {
      return []
    }
    
    return self._arrayFrom(self, to: index, nonIndexCallback: callback)
  }
  
  private func _arrayFrom(from: Int,
                          to: Int,
                          indexCallback: CallbackWithIndex? = nil,
                          nonIndexCallback: CallbackWithoutIndex? = nil) -> [Int] {
    let range = from...to
    
    for index in range {
      if indexCallback != nil { indexCallback!(index) }
      if nonIndexCallback != nil { nonIndexCallback!() }
    }
    
    return [Int](range)
  }
}