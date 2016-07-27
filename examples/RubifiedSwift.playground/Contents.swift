//: Playground - noun: a place where people can play

import Foundation

extension Array where Element: Comparable {
  public func max() -> Element? {
    return self.dropFirst().reduce(self.first) { (r, e) in r > e ? r : e }
  }
  
  public func min() -> Element? {
    return self.dropFirst().reduce(self.first) { (r, e) in r < e ? r : e }
  }
}

let arr: [Int] = []

[1, 2, 3, 4].min()
[1].min()
[Int]().min()

[1, 2, 3, 4].max()
[1].max()
[Int]().max()