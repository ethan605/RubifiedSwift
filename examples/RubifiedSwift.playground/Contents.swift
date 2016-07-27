//: Playground - noun: a place where people can play

import Foundation

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
  
  public func reverse() -> String {
    return String(self.characters.reverse())
  }
  
  public mutating func reverse$() {
    self = String(self.characters.reverse())
  }
  
  public func split(separator: String = " ") -> [String] {
    if separator == "" { return self.characters.map { String($0) } }
    return NSString(string: self).componentsSeparatedByString(separator)
  }
  
  public func index(string: String) -> Int? {
    let range = self.rangeOfString(string)
    return range == nil ? nil : self.startIndex.distanceTo(range!.startIndex)
  }
}

public func *(string: String, mult: Int) -> String {
  return [Int](0..<mult).map { (_) in string }.reduce("", combine: +)
}

public func <<(inout string: String, otherString: String) {
  string += otherString
}

public func <<(inout string: String, char: Int) {
  string.append(Character(UnicodeScalar(char)))
}

infix operator =~ {}

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

var str = "Hello, World!"

str[-str.length-1]
str[0...str.length-1]
str.length

//str.reverse()
//str.reverse$()
//str

//str << 32
//print(str * 3)
let match: String? = str =~ "[a]"
let matches: [String] = str =~ "\\w+"

str.split()
str.split("")
str.split(", ")

str.index("h")
str.index("World!")

str.uppercaseString
str.lowercaseString
str.lowercaseString.capitalizedString