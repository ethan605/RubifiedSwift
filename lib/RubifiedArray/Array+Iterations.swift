//
//  RubifiedArray.swift
//  rubified-swift
//
//  Created by Ethan Nguyen on 7/23/16.
//  Copyright © 2016 Thanh Nguyen. All rights reserved.
//

import Foundation

extension Array {
  typealias CallbackWithIndex = Element -> Void
  
  func withIndex(callback: CallbackWithIndex) {
    self.forEach(callback)
  }
}