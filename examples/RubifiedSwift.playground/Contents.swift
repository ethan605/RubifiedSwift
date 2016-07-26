//: Playground - noun: a place where people can play

import Foundation

extension Array where Element: _ArrayType {
  // Transpose m*n matrix to n*m matrix
  func transpose() -> [[Element.Generator.Element]] {
    let zero = Element.Index.Distance(0)
    let elementSize = self.map { $0.count }.reduce(zero) { $0 == zero || $0 == $1 ? $1 : zero } as! Int
    
    if elementSize == 0 { fatalError("Element sizes mismatched") }
    return [Int](0..<elementSize).map { (index) in self.map { $0[index] } }
  }
}

let arr1 = [[1, 2, 3], [4, 5, 6]]
let arr2 = [[[1, 2, 3], [4, 5, 6]], [[7, 8, 9], [10, 11, 12]]]

print(arr1.transpose())
print(arr2.transpose())
print(arr2.transpose().map { $0.transpose() })