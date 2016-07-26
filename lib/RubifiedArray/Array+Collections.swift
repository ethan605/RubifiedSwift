//
//  Array+Collections.swift
//  rubified-swift
//
//  Created by Ethan Nguyen on 7/23/16.
//  Copyright © 2016 Thanh Nguyen. All rights reserved.
//

import Foundation

// Collection extensions
public protocol OptionalType {
  associatedtype Wrapped
  var optional: Wrapped? { get }
}

extension Optional: OptionalType {
  public var optional: Wrapped? { return self }
}

extension Array where Element: OptionalType {
  public func unwrapped() -> [Element.Wrapped]? {
    let initial = Optional<[Element.Wrapped]>([])
    
    return self.reduce(initial) { (reduced, element) in
      element.optional.map { (unwrappedElement) in
        if let subArray = unwrappedElement as? Array {
          return reduced! + (subArray.unwrapped() ?? [])
        } else {
          return reduced! + [unwrappedElement]
        }
      }
    }
  }
  
  public func compact() -> [Element] {
    let initial = [Element]()
    
    return self.reduce(initial) { (reduced, element) in
      if let unwrappedElement = element.optional {
        if let subArray = unwrappedElement as? Array {
          return reduced + subArray.compact()
        }
      }
      
      return reduced + (element.optional == nil ? [] : [element])
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

extension Array where Element: _ArrayType {
  // Transpose m*n matrix to n*m matrix
  func transpose() -> [[Element.Generator.Element]] {
    let zero = Element.Index.Distance(0)
    let elementSize = self.map { $0.count }.reduce(zero) { $0 == zero || $0 == $1 ? $1 : zero } as! Int
    
    if elementSize == 0 { fatalError("Element sizes mismatched") }
    return [Int](0..<elementSize).map { (index) in self.map { $0[index] } }
  }
}