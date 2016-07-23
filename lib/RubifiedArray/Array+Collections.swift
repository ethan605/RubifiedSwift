//
//  Array+Collections.swift
//  rubified-swift
//
//  Created by Ethan Nguyen on 7/23/16.
//  Copyright © 2016 Thanh Nguyen. All rights reserved.
//

import Foundation

// Collection extensions
protocol OptionalType {
  associatedtype W
  var optional: W? { get }
}

extension Optional: OptionalType {
  typealias W = Wrapped
  var optional: W? { return self }
}

extension Array where Element: OptionalType {
  func unwrap() -> [Element.W]? {
    let initial = Optional<[Element.W]>([])
    
    return reduce(initial) { reduced, element in
      reduced.flatMap { arr in
        element.optional.map { arr + [$0] }
      }
    }
  }
  
  func compact() -> [Element.W] {
    let compacted = self.filter { $0.optional != nil }
    return compacted.unwrap()!
  }
  
  mutating func compact$() {
    self = self.compact().map { $0 as! Element }
  }
}