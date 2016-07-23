//
//  Array+Collections.swift
//  rubified-swift
//
//  Created by Ethan Nguyen on 7/23/16.
//  Copyright © 2016 Thanh Nguyen. All rights reserved.
//

import Foundation

// Collection extensions
extension Array {
  func compact() -> [Element] {
    return self.filter { $0 != nil && !($0 is NSNull) }
  }
  
  mutating func compact$() {
    self = self.compact()
  }
}