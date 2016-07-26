//
//  Array+Collections.swift
//  rubified-swift
//
//  Created by Ethan Nguyen on 7/23/16.
//  Copyright © 2016 Thanh Nguyen. All rights reserved.
//

import Foundation

// Collection extensions

// Normal elements
extension Array {
  public func at(idx: Int) -> Element? {
    if idx > self.count || idx < -self.count { return nil }
    
    var absIdx = idx
    if idx < 0 { absIdx += self.count }
    
    return self[absIdx]
  }
  
  public mutating func push(newElement: Element) -> [Element] {
    self.append(newElement)
    return self
  }
  
  public mutating func unshift(newElement: Element) -> [Element] {
    self.insert(newElement, atIndex: 0)
    return self
  }
  
  public mutating func pop() -> Element? {
    return self.popLast()
  }
  
  public mutating func shift() -> Element? {
    if self.count == 0 { return nil }
    return self.removeAtIndex(0)
  }
  
  public func join(separator: String = "") -> String {
    return self.map { String($0) }.joinWithSeparator(separator)
  }
  
  public mutating func map$(callback: Element -> Element) {
    self = self.map(callback)
  }
  
  public func select(callback: Element -> Bool) -> [Element] {
    return self.filter(callback)
  }
  
  public mutating func select$(callback: Element -> Bool) {
    self = self.filter(callback)
  }
  
  public func reject(callback: Element -> Bool) -> [Element] {
    return self.filter { !callback($0) }
  }
  
  public mutating func reject$(callback: Element -> Bool) {
    self = self.filter { !callback($0) }
  }
  
  public mutating func deleteIf(callback: Element -> Bool) {
    var indices = [Int]()
    self.withIndex { if callback($0) { indices.append($1) } }
    for index in indices.reverse() { self.removeAtIndex(index) }
  }
  
  public mutating func keepIf(callback: Element -> Bool) {
    var indices = [Int]()
    self.withIndex { if !callback($0) { indices.append($1) } }
    for index in indices.reverse() { self.removeAtIndex(index) }
  }
}

// Optional elements
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
  
  public mutating func compact$() {
    self = self.compact()
  }
  
  public func sample() -> Element? {
    return self.isEmpty ? nil : self[Int(arc4random()) % self.count]
  }
  
  public func shuffle(repeats: Int = 1) -> [Element] {
    if self.isEmpty { return [] }
    return [Int](0..<repeats).reduce([Element]()) { (_, _) in
      self.sort { (_, _) in arc4random() < arc4random() }
    }
  }
  
  public mutating func shuffle$(repeatTime: Int = 1) -> [Element] {
    self = self.shuffle()
    return self
  }
}

// Equatable elements
extension Array where Element: Equatable {
  public func uniq() -> [Element] {
    return self.reduce([Element]()) { (reduced, element) in
      reduced + (reduced.contains(element) ? [] : [element])
    }
  }
  
  public mutating func uniq$() {
    self = self.uniq()
  }
  
  public mutating func delete(element: Element) -> Element? {
    let originalLength = self.count
    self = self.filter { $0 != element }
    return (originalLength == self.count ? nil : element)
  }
}

// Array elements
extension Array where Element: _ArrayType {
  // Transpose m*n matrix to n*m matrix
  public func transpose() -> [[Element.Generator.Element]] {
    // Map and check if all elements' sizes are identical
    let size = self.map { $0.count }.reduce(0) { $0 == 0 || $0 == $1 ? $1 : 0 }
    if size == 0 { fatalError("Element sizes mismatched") }
    return [Int](0..<size).map { (idx) in self.map { $0[idx] } }
  }
}