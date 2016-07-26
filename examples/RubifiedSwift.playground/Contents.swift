//: Playground - noun: a place where people can play

import Foundation

protocol OptionalType {
  associatedtype Wrapped
  var optional: Wrapped? { get }
}

extension Optional: OptionalType {
  var optional: Wrapped? { return self }
}

extension Array where Element: OptionalType {
  func unwrapped() -> [Element.Wrapped]? {
    let initial = Optional<[Element.Wrapped]>([])
    
    return self.reduce(initial) { (reduced, element) in
      element.optional.map { (unwrappedElement) in
        if let subArray = unwrappedElement as? Array {
          return reduced! + (subArray.unwrapped() ?? [])
        } else {
          return reduced! + [unwrappedElement]
        }
      }
    }
  }
  
  func compact() -> [Element] {
    let initial = [Element]()
    
    return self.reduce(initial) { (reduced, element) in
      if let unwrappedElement = element.optional {
        if let subArray = unwrappedElement as? Array {
          return reduced + subArray.compact()
        }
      }
      
      return reduced + (element.optional == nil ? [] : [element])
    }
  }
}

let sub1 = [4, 5]
let sub2: [Any?] = [8, nil]
let sub3: [Any?] = [nil]
let sub4: [Any?] = [7, sub2, [9], sub3]
var array: [Any?] = [1, 2, sub1, 6, sub4]

print(array.unwrapped() ?? [])
print(array.compact())
print(array.compact().unwrapped() ?? [])

// Catersian product
public func *<T>(lhs: Array<T>, rhs: Array<T>) -> Array<Array<T>> {
  return lhs.map { (lhe) in rhs.map { [lhe, $0] } }.reduce([], combine:+)
}

print([1, 2, 3] * [4, 5, 6])