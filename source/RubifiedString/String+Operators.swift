//
//  String+Operators.swift
//  rubified-swift
//
//  Created by Ethan Nguyen on 7/27/16.
//  Copyright © 2016 Thanh Nguyen. All rights reserved.
//

import Foundation

infix operator =~ {}

public func *(string: String, mult: Int) -> String {
  return [Int](0..<mult).map { (_) in string }.reduce("", combine: +)
}

public func <<(inout string: String, otherString: String) {
  string += otherString
}

public func <<(inout string: String, char: Int) {
  string.append(Character(UnicodeScalar(char)))
}

public func =~(string: String, pattern: String) -> String? {
  let range = string.rangeOfString(pattern, options: .RegularExpressionSearch)
  if range == nil { return nil }
  return string[range!]
}

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