//
//  Array+Equatable.swift
//  rubified-swift
//
//  Created by Ethan Nguyen on 7/28/16.
//  Copyright © 2016 Thanh Nguyen. All rights reserved.
//

import Foundation

/**
 Extensions for Array
 Set of extended methods for Equatable elements manipulation
 */
extension Array where Element: Equatable {
  /**
   Deletes all items from `self` that are equal to given element.
   
   - returns: Returns the last deleted item, or `nil` if no matching item is found.
   */
  public mutating func delete(element: Element) -> Element? {
    var indices = [Int]()
    self.enumerate().forEach { if $1 != element { indices.append($0) } }
    indices.reverse().forEach { self.removeAtIndex($0) }
    return (indices.isEmpty ? nil : element)
  }
  
  /**
   Returns a new array by removing duplicate values in `self`.
   `self` is traversed in order, and the first occurrence is kept.
   
   - returns: New array with unique elements.
   */
  public func uniq() -> [Element] {
    return self.reduce([Element]()) { (reduced, element) in
      reduced + (reduced.contains(element) ? [] : [element])
    }
  }
  
  /**
   Removes duplicate elements from `self`.
   `self` is traversed in order, and the first occurrence is kept.
   Returns `nil` if no changes are made (that is, no duplicates are found).
   
   - returns: Returns `nil` if no changes are made. Otherwise returns this array after changes.
   */
  public mutating func uniq$() -> [Element]? {
    let originalLength = self.count
    self = self.uniq()
    return (self.count == originalLength ? nil : self)
  }
}