//: Playground - noun: a place where people can play

import Foundation

extension Array {
  public func permutation() -> [[Element]] {
    var result = [[Element]](arrayLiteral: self)
    _permutate(self, &result)
    return result
  }
  
  private func _permutate(source: [Element], inout _ result: [[Element]]) {
    var a = [Element](source)
    let n = a.count
    var p = [Int](0...n)
    var i = 1
    
    while i < n {
      p[i] -= 1
      let j = i % 2 == 0 ? 0 : p[i]
      let tmp = a[i]; a[i] = a[j]; a[j] = tmp
      result.append(a)
      i = 1
      while p[i] == 0 { p[i] = i; i += 1 }
    }
  }
}

var arr: [AnyObject] = [1, 2, "3", 4.0, UInt(5)]

func permutate(inout a: [Int]) {
  let n = a.count
  var p = [Int](0...n)
  var i = 1
  
  while i < n {
    p[i] -= 1
    let j = i % 2 == 0 ? 0 : p[i]
    let tmp = a[i]; a[i] = a[j]; a[j] = tmp
    print(a)
    i = 1
    while p[i] == 0 {
      p[i] = i
      i += 1
    }
  }
}

//print(arr.permutation())
//var arr: [Int] = [1, 2, 3, 4]
print(arr.permutation())
//permutate(&arr)
