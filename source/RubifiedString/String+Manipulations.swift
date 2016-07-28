//
//  String+Manipulations.swift
//  rubified-swift
//
//  Created by Ethan Nguyen on 7/27/16.
//  Copyright © 2016 Thanh Nguyen. All rights reserved.
//

import Foundation

/**
 Set of extended methods for String type manipulations.
 */
extension String {
  /**
   Returns the characters length of `self`.
   
   - returns: The characters length of `self`.
   */
  public var length: Int { get { return self.characters.count } }
  
  /**
   Returns a substring of one character at `index`.
   
   - returns: A substring of character at `index`.
   */
  public subscript (index: Int) -> String? {
    if index < -length || index >= length { return nil }
    let stringIdx = index < 0 ? self.startIndex.advancedBy(index+length) : self.startIndex.advancedBy(index)
    return String(self.characters[stringIdx])
  }
  
  /**
   Returns a substring of multiple characters at `range`.
   
   - returns: A substring of characters at `range`.
   */
  public subscript (range: Range<Int>) -> String? {
    var start = range.startIndex
    if start < 0 { start += length }
    var end = range.endIndex
    if end < 0 { end += length }
    if end < start { let tmp = start; start = end; end = tmp }
    if start >= length || end > length { return nil }
    let startIndex = self.startIndex.advancedBy(start)
    let endIndex = self.startIndex.advancedBy(end)
    return String(self.characters[startIndex..<endIndex])
  }
  
  /**
   Returns a new string with the characters from `self` in reverse order.
   
   - returns: New string in reversed order.
   */
  public func reverse() -> String { return String(self.characters.reverse()) }
  
  /**
   Reverse `self` in place.
   
   - returns: This string itself after reversed.
   */
  public mutating func reverse$() -> String { self = String(self.characters.reverse()); return self }
  
  /**
   Divides `self` into substrings based on a `separator`, returning an array of these substrings.
   
   - returns: Array of substrings divided by a string `separator`.
   */
  public func split(separator: String = " ") -> [String] {
    if separator == "" { return self.characters.map { String($0) } }
    return NSString(string: self).componentsSeparatedByString(separator)
  }
  
  /**
   Returns the index of the first occurrence of the given substring in `self`.
   Returns `nil` if not found.
   
   - returns: Returns `nil` if not found `string`. Otherwise return index of first occurrence.
   */
  public func index(string: String) -> Int? {
    let range = self.rangeOfString(string)
    return range == nil ? nil : self.startIndex.distanceTo(range!.startIndex)
  }
}