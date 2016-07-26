//
//  RubifiedArray.swift
//  rubified-swift
//
//  Created by Ethan Nguyen on 7/23/16.
//  Copyright © 2016 Thanh Nguyen. All rights reserved.
//

import Foundation

extension Array {
  public typealias CallbackWithIndex = (Element, Int) -> Void
  
  public func withIndex(callback: CallbackWithIndex) {
    var index = -1
    self.forEach { index += 1; callback($0, index) }
  }
}