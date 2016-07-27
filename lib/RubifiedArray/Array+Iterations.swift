//
//  RubifiedArray.swift
//  rubified-swift
//
//  Created by Ethan Nguyen on 7/23/16.
//  Copyright © 2016 Thanh Nguyen. All rights reserved.
//

import Foundation

extension Array {
  public func eachWithIndex(callback: (Element, Int) -> Void) {
    self.enumerate().forEach { callback($1, $0) }
  }
  
  public func mapWithIndex<T>(callback: (Element, Int) -> T) -> [T] {
    return self.enumerate().map { callback($1, $0) }
  }
}