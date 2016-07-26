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
  associatedtype Wrapped
  var optional: Wrapped? { get }
}

extension Optional: OptionalType {
  var optional: Wrapped? { return self }
}

extension Array where Element: OptionalType {
  func unwrap() -> [Element.Wrapped] {
    let initial = Optional<[Element.Wrapped]>([])
    
    let unwrapped = reduce(initial) { (reduced, element) in
      var reduced = reduced
      
      if let optionalElement = element.optional {
        reduced?.append(optionalElement)
      }
      
      return reduced
    }
    
    return unwrapped!
  }
  
  func compact() -> [Element] {
    let initial = [Element]()
    
    return reduce(initial) { (reduced, element) in
      var reduced = reduced
      
      if let optionalElement = element.optional {
        reduced.append(optionalElement as! Element)
      }
      
      return reduced
    }
  }
  
  mutating func compact$() {
    self = self.compact()
  }
}

extension Array where Element: Hashable {
  func uniq() -> [Element] {
    return self.reduce([Element]()) { (reduced, element) in
      var reduced = reduced
      if !reduced.contains(element) { reduced.append(element) }
      return reduced
    }
  }
  
  mutating func uniq$() {
    self = self.uniq()
  }
}

extension Array where Element: Equatable {
  mutating func delete(element: Element) -> Element? {
    let originalLength = self.count
    self = self.filter { $0 != element }
    return (originalLength == self.count ? nil : element)
  }
}