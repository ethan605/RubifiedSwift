//
//  String+Manipulations.swift
//  rubified-swift
//
//  Created by Ethan Nguyen on 7/27/16.
//  Copyright © 2016 Thanh Nguyen. All rights reserved.
//

import Foundation

// Manipulation extensions
extension String {
  public var length: Int { get { return self.characters.count } }
  
  public subscript (idx: Int) -> String? {
    if idx < -length || idx >= length { return nil }
    let index = idx < 0 ? self.startIndex.advancedBy(idx+length) : self.startIndex.advancedBy(idx)
    return String(self.characters[index])
  }
  
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
  
  public func reverse() -> String { return String(self.characters.reverse()) }
  
  public mutating func reverse$() { self = String(self.characters.reverse()) }
  
  public func split(separator: String = " ") -> [String] {
    if separator == "" { return self.characters.map { String($0) } }
    return NSString(string: self).componentsSeparatedByString(separator)
  }
  
  public func index(string: String) -> Int? {
    let range = self.rangeOfString(string)
    return range == nil ? nil : self.startIndex.distanceTo(range!.startIndex)
  }
}