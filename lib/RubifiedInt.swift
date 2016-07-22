//
//  RubifiedInt.swift
//  rubified-swift
//
//  Created by Ethan Nguyen on 7/22/16.
//  Copyright © 2016 Thanh Nguyen. All rights reserved.
//

import Foundation

extension Int {
  func times(callback: (Int -> Void)? = nil) -> [Int] {
    if self <= 0 {
      return []
    }
    
    let range = 0..<self
    
    if callback != nil {
      for index in range { callback!(index) }
    }
    
    return [Int](range)
  }
  
  func times(callback: (Void -> Void)?) -> [Int] {
    if self <= 0 {
      return []
    }
    
    let range = 0..<self
    
    if callback != nil {
      for _ in range { callback!() }
    }
    
    return [Int](range)
  }
}