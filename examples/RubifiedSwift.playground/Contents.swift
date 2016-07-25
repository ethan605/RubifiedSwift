//: Playground - noun: a place where people can play

import Foundation

// Collection extensions
protocol OptionalType {
  associatedtype Wrapped
  var optional: Wrapped? { get }
}

extension Optional: OptionalType {
  var optional: Wrapped? { return self }
}

extension Array where Element: OptionalType {
  func unwrap() -> [Element.Wrapped] {
    let initial = Optional<[Element.Wrapped]>([])
    
    let unwrapped = reduce(initial) { (reduced, element) in
      var reduced = reduced
      
      if let optionalElement = element.optional {
        reduced?.append(optionalElement)
      }
      
      return reduced
    }
    
    return unwrapped!
  }
  
  func compact() -> [Element] {
    let initial = [Element]()
    
    return reduce(initial) { (reduced, element) in
      var reduced = reduced
      
      if let optionalElement = element.optional {
        reduced.append(optionalElement as! Element)
      }
      
      return reduced
    }
  }
  
  mutating func compact$() {
    self = self.compact()
  }
}

let sub1 = [4, 5]
let sub2: [Any?] = [8, nil]
let sub3: [Any?] = [nil]
let sub4: [Any?] = [7, nil, [9], sub3]
var array: [Any?] = [1, 2, sub1, 6, sub4, nil]

print(array.unwrap())
print(array.compact())
array.compact$()
print(array)
