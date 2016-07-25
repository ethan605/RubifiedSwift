//: Playground - noun: a place where people can play

import Foundation

protocol OptionalType {
  associatedtype W
  var optional: W? { get }
}

extension Optional: OptionalType {
  typealias W = Wrapped
  var optional: W? { return self }
}

extension Array where Element: OptionalType {
  func unwrap() -> [Element.W] {
    let initial = Optional<[Element.W]>([])
    
    let unwrapped = reduce(initial) { reduced, element in
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
    
    return reduce(initial) { reduced, element in
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
let sub2: [AnyObject?] = [8, nil]
let sub4: [AnyObject?] = [nil]
let sub3: [Any?] = [7, sub2, [9], sub4]
var arr: [Any?] = [1, 2, sub1, "6", sub3, nil]

print(arr.unwrap())
print(arr.compact())
//arr.compact$()
//print(arr)

//var pureArray: [[Double]] = [[1], [2, 3], [4]]
//print([Double](pureArray.flatten()))
