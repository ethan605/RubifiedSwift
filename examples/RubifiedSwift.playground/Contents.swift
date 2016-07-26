//: Playground - noun: a place where people can play

import Foundation

extension Array {
  public func join(separator: String = "") -> String {
    return self.map { String($0) }.joinWithSeparator(separator)
  }
}

var arr: [AnyObject] = [1, 2, "3", 4.0, UInt(5), [6]]

arr.join(",")