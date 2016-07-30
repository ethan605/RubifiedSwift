//: Playground - noun: a place where people can play

import Foundation

public protocol OptionalType {
  associatedtype Wrapped
  var optional: Wrapped? { get }
}

extension Optional: OptionalType {
  public var optional: Wrapped? { return self }
}

extension Array where Element: OptionalType {
  public func unwrapped() -> [Element.Wrapped]? {
    let initial = Optional<[Element.Wrapped]>([])
    
    return self.reduce(initial) { (reduced, element) in
      reduced.flatMap { (arr) in element.optional.map { arr + [$0] } }
    }
  }
  
  public func compact() -> [Element] {
    return self.filter { $0.optional != nil }
  }
}

var array: [AnyObject?] = [1, 2, "3", 4.0, nil, 5]
print(array.unwrapped() ?? [])

array = [1, 2, "3", 4.0, 5]
print(array.unwrapped())

//print(array.compact())
//
////let arr: [AnyObject?] = [1]
//print(array.flatMap { (e) -> AnyObject? in
//  print(e)
//  return e
//  })

let arr = ([AnyObject]?)([])
print(arr.map { $0 })