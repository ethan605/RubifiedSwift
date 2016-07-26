//: Playground - noun: a place where people can play

import Foundation

extension Array {
  typealias CallbackWithIndex = (Element, Int) -> Void
  
  func withIndex(callback: CallbackWithIndex) {
    var index = -1
    
    self.forEach {
      index += 1
      callback($0, index)
    }
  }
}

// Collection extensions
protocol OptionalType {
  associatedtype Wrapped
  var optional: Wrapped? { get }
}

extension Optional: OptionalType {
  var optional: Wrapped? { return self }
}

extension Array {
  func at(index: Int) -> Element? {
    if index > self.count || index < -self.count {
      return nil
    }
    
    var absIndex = index
    
    if index < 0 {
      absIndex += self.count
    }
    
    return self[absIndex]
  }
  
  mutating func push(newElement: Element) -> [Element] {
    self.append(newElement)
    return self
  }
  
  mutating func unshift(newElement: Element) -> [Element] {
    self.insert(newElement, atIndex: 0)
    return self
  }
  
  mutating func pop() -> Element? {
    return self.popLast()
  }
  
  mutating func shift() -> Element? {
    if self.count == 0 {
      return nil
    }
    
    return self.removeAtIndex(0)
  }
  
  mutating func map$(callback: Element -> Element) {
    let mapped = self.map(callback) as [Element]
    self = mapped
  }
  
  func select(callback: Element -> Bool) -> [Element] {
    return self.filter(callback)
  }
  
  mutating func select$(callback: Element -> Bool) {
    self = self.filter(callback)
  }
  
  func reject(callback: Element -> Bool) -> [Element] {
    return self.filter { !callback($0) }
  }
  
  mutating func reject$(callback: Element -> Bool) {
    self = self.filter { !callback($0) }
  }
  
  mutating func deleteIf(callback: Element -> Bool) {
    var indices = [Int]()
    
    self.withIndex {
      if callback($0) { indices.append($1) }
    }
    
    for index in indices.reverse() {
      self.removeAtIndex(index)
    }
  }
  
  mutating func keepIf(callback: Element -> Bool) {
    var indices = [Int]()
    
    self.withIndex {
      if !callback($0) { indices.append($1) }
    }
    
    for index in indices.reverse() {
      self.removeAtIndex(index)
    }
  }
}

extension Array where Element: Hashable {
  func uniq() -> [Element] {
    return self.reduce([Element]()) { (reduced, element) in
      var reduced = reduced
      if !reduced.contains(element) { reduced.append(element) }
      return reduced
    }
  }
  
  mutating func uniq$() {
    self = self.uniq()
  }
}

extension Array where Element: Equatable {
  mutating func delete(element: Element) -> Element? {
    let originalLength = self.count
    self = self.filter { $0 != element }
    return (originalLength == self.count ? nil : element)
  }
}

func <<<T>(inout array: Array<T>, newElement: T) {
  array.append(newElement)
}

func -<T: Hashable>(lhs: Array<T>, rhs: Array<T>) -> Array<T> {
  return lhs.filter { !rhs.contains($0) }
}

func &<T: Hashable>(lhs: Array<T>, rhs: Array<T>) -> Array<T> {
  return lhs.filter { rhs.contains($0) }
}

func |<T: Hashable>(lhs: Array<T>, rhs: Array<T>) -> Array<T> {
  return lhs + (rhs - lhs)
}

func *<T: Hashable>(array: Array<T>, mult: Int) -> Array<T> {
  if mult < 0 {
    fatalError("Negative argument")
  }
  
  var result = Array<T>()
  
  for _ in 0..<mult { result += array }
  
  return result
}

func *<T: Hashable>(array: Array<T>, separator: String) -> String {
  return array.map { String($0) }.joinWithSeparator(separator)
}

var array = [1, 2, 3, 1, 2, 4, 3, 2, 13]
//array.pop()
//array.shift()
//array << 5
//array.unshift(-1)
//print(array)
//
//array.map$ { $0 + 1 }
//
//print(array.uniq())
//array.uniq$()
//
//array.deleteIf { $0 % 2 == 0}
//array.delete(3)
//array.delete(4)
//print(array)

var arr1 = [1, 3, 4, 5, 8]
var arr2 = [4, 6, 7, 8, 9]

arr1 << 9
arr1 - arr2
arr1 & arr2
arr1 | arr2
arr1 * 4
arr1 * 0
arr1 * ", "