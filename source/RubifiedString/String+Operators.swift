//
//  String+Operators.swift
//  rubified-swift
//
//  Created by Ethan Nguyen on 7/27/16.
//  Copyright © 2016 Thanh Nguyen. All rights reserved.
//

import Foundation

infix operator =~ {}

/**
 Returns a new string containing integer copies of the receiver.
 `mult` must be greater than or equal to `0`.
 
 - parameter string: The string to be copied.
 - parameter mult: The factor to copy `string`.
 
 - returns: New string containing copies of original `string`.
 */
public func *(string: String, mult: Int) -> String {
  return [Int](0..<mult).map { (_) in string }.reduce("", combine: +)
}

/**
 Concatenates other string to `string`.
 
 - parameter string: The string to be changed.
 - parameter otherString: The string to be concated to `string`.
 
 - returns: `string` itself after changed.
 */
public func <<(inout string: String, otherString: String) -> String {
  string += otherString
  return string
}

/**
 Convert a codepoint to character and concatenates it to `string`.
 
 - parameter string: The string to be changed.
 - parameter char: The character codepoint to be concated to `string`.
 
 - returns: `string` itself after changed.
 */
public func <<(inout string: String, char: Int) {
  string.append(Character(UnicodeScalar(char)))
}

/**
 Scan regular expression pattern against `string` and returns first match.
 Returns `nil` if not found.
 
 - parameter string: The string to be scanned.
 - parameter pattern: The string that represent a regular expression pattern.
 
 - returns: Returns `nil` if not found. Otherwise returns the first match.
 */
public func =~(string: String, pattern: String) -> String? {
  let range = string.rangeOfString(pattern, options: .RegularExpressionSearch)
  if range == nil { return nil }
  return string[range!]
}

/**
 Scan regular expression pattern against `string` and returns all matches.
 Returns empty array if not found.
 
 - parameter string: The string to be scanned.
 - parameter pattern: The string that represent a regular expression pattern.
 
 - returns: Returns empty array if not found. Otherwise returns all matches.
 */
public func =~(string: String, pattern: String) -> [String] {
  do {
    let regex = try NSRegularExpression(pattern: pattern, options: [])
    let nsString = NSString(string: string)
    let matches = regex.matchesInString(string, options: [], range: NSMakeRange(0, nsString.length))
    return matches.map { nsString.substringWithRange($0.range)}
  } catch {
    return []
  }
}