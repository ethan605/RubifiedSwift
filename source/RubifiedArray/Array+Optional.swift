//
//  Array+Optional.swift
//  rubified-swift
//
//  Created by Ethan Nguyen on 7/28/16.
//  Copyright © 2016 Thanh Nguyen. All rights reserved.
//

import Foundation

/**
 Custom protocol to represent Optional types
 */
public protocol OptionalType {
  associatedtype Wrapped
  var optional: Wrapped? { get }
}

extension Optional: OptionalType {
  public var optional: Wrapped? { return self }
}

/**
 Set of extended methods for Array manipulations deal with
 ArrayType, Optional, Comparable & Equatable elements.
 */
extension Array where Element: OptionalType {
  /**
   Try to unwrap all elements. Returns `nil` if any `nil` element appears in this array.
   
   - returns: Returns `nil` if any `nil` element appears in this array.
      Otherwise returns array of unwrapped elements
   */
  public func unwrapped() -> [Element.Wrapped]? {
    return self.reduce(Optional<[Element.Wrapped]>([])) { (reduced, element) in
      element.optional.flatMap { reduced! + [$0] }
    }
  }
  
  /**
   Try to unwrap all elements. Returns `nil` if any `nil` element appears in this array.
   If an element is array, then try to unwrap all elements in this sub-array.
   
   - returns: Returns `nil` if any `nil` element appears in this array.
      Otherwise returns array of unwrapped elements
   */
  public func deepUnwrapped() -> [Element.Wrapped]? {
    let initial = Optional<[Element.Wrapped]>([])
    
    return self.reduce(initial) { (reduced, element) in
      element.optional.map { (unwrappedElement) in
        if let subArray = unwrappedElement as? Array {
          return reduced! + (subArray.deepUnwrapped() ?? [])
        } else {
          return reduced! + [unwrappedElement]
        }
      }
    }
  }
  
  /**
   Returns a copy of `self` with all `nil` elements removed.
   
   - returns: This array itself with all `nil` elements removed.
   */
  public func compact() -> [Element] {
    return self.reduce([Element]()) { (reduced, element) in
      reduced + (element.optional == nil ? [] : [element])
    }
  }
  
  /**
   Returns a copy of `self` with all `nil` elements removed.
   If an element is array, then try to compact this sub-array too.
   
   - returns: This array itself with all `nil` elements removed and compacted sub-arrays.
   */
  public func deepCompact() -> [Element] {
    let initial = [Element]()
    
    return self.reduce(initial) { (reduced, element) in
      if let unwrappedElement = element.optional {
        if let subArray = unwrappedElement as? Array {
          return reduced + subArray.deepCompact()
        }
      }
      
      return reduced + (element.optional == nil ? [] : [element])
    }
  }
  
  /**
   Removes nil elements from the array.
   
   - returns: This array itself with all `nil` elements removed.
   */
  public mutating func compact$() -> [Element] {
    self = self.compact()
    return self
  }
  
  /**
   Removes nil elements from the array.
   If an element is array, then try to compact this sub-array too.
   
   - returns: This array itself with all `nil` elements removed and compacted sub-arrays.
   */
  public mutating func deepCompact$() -> [Element] {
    self = self.deepCompact()
    return self
  }
  
  /**
   Returns a new array by rotating `self` so that the element at `count`
   is the first element of the new array.
   If `count` is negative then it rotates in the opposite direction,
   starting from the end of `self` where `-1` is the last element.
   
   - parameter count: Indicates the element index to be the first element of new array.
   
   - return: New array that is rotated from original array.
   */
  public func rotate(count: Int = 1) -> [Element] {
    var index = count % self.count
    if index < 0 { index += self.count }
    return [Element](self[index..<self.count] + self[0..<index])
  }
  
  /**
   Rotates `self` in place so that the element at `count` comes first, and returns `self`.
   If `count` is negative then it rotates in the opposite direction,
   starting from the end of the array where `-1` is the last element.
   
   - parameter count: Indicates the element index to be the first element of new array.
   
   - return: This array itself after rotated.
   */
  public mutating func rotate$(count: Int = 1) -> [Element] {
    self = self.rotate()
    return self
  }
  
  /**
   Choose a random element from the array.
   The element is chosen by using Objective-C's `arc4random()` method for efficiency.
   Returns `nil` if the array is empty.
   
   - returns: Returns `nil` if the array is empty. Otherwise return random element.
   */
  public func sample() -> Element? {
    return self.isEmpty ? nil : self[Int(arc4random()) % self.count]
  }
  
  /**
   Returns a new array with elements of self shuffled.
   Try to shuffle `repeats` times before returning results.
   
   - parameter repeats: Number of repeated shuffles.
   
   - returns: New array with elements from this array but in new random order.
   */
  public func shuffle(repeats: Int = 1) -> [Element] {
    if self.isEmpty { return [] }
    return [Int](0..<repeats).reduce([Element]()) { (_, _) in
      self.sort { (_, _) in arc4random() < arc4random() }
    }
  }
  
  /**
   Shuffles elements in self in place.
   Try to shuffle `repeats` times before returning results.
   
   - parameter repeats: Number of repeated shuffles.
   
   - returns: This array itself after shuffled.
   */
  public mutating func shuffle$(repeatTime: Int = 1) -> [Element] {
    self = self.shuffle()
    return self
  }
}