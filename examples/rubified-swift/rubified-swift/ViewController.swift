//
//  ViewController.swift
//  rubified-swift
//
//  Created by Ethan Nguyen on 7/22/16.
//  Copyright © 2016 Thanh Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    self.tryRubified()
  }
  
  func tryRubified() {
//    self.tryRubifiedInt()
//    self.tryRubifiedDouble()
    self.tryRubifiedArray()
  }
  
  func tryRubifiedInt() {
    print("Times:")
    print("\t3.times() = \(3.times())")
    3.times { print("\tPrint without index") }
    
    print("Up to:")
    print("\t3.upTo(5) = \(3.upTo(5))")
    3.upTo(5) { print("\tPrint without index") }
    
    print("Down to:")
    print("\t3.downTo(1) = \(3.downTo(1))")
    3.downTo(1) { print("\tPrint without index") }
  }
  
  func tryRubifiedDouble() {
    print("Time:")
    print("\t7 seconds = \(7.seconds()) seconds")
    print("\t6 minutes = \(6.minutes()) seconds")
    print("\t5 hours = \(5.hours()) seconds")
    print("\t4 days = \(4.days()) seconds")
    print("\t3 weeks = \(3.weeks()) seconds")
    print("\t2 months = \(2.months()) seconds")
    print("\t1 years = \(1.years()) seconds")
    
    let time = 3.hours().ago()
    
    print("\t3 hours ago: \(3.hours().ago())")
    print("\t3 hours since now: \(3.hours().sinceNow())")
    print("\t3 hours until \(time): \(3.hours().until(time))")
    print("\t3 hours since \(time): \(3.hours().since(time))")
  }
  
  func tryRubifiedArray() {
    print("Times with index:")
    3.times().withIndex { print("\tPrint with index: \($0)") }
    
    print("Up to with index:")
    3.upTo(5).withIndex { print("\tPrint with index: \($0)") }
    
    print("Down to with index:")
    3.downTo(1).withIndex { print("\tPrint with index: \($0)") }
    
    print("Compact:")
    let sub1 = [4, 5]
    let sub2: [Any?] = [8, nil]
    let sub3: [Any?] = [nil]
    let sub4: [Any?] = [7, sub2, [9], sub3]
    var array1: [Any?] = [1, 2, sub1, 6, sub4, nil]
    
    print("\tUnwrapped array: \(array1.unwrapped() ?? [])")
    print("\tCompacted array: \(array1.compact())")
    print("\tCompacted & Unwrapped array: \(array1.compact().unwrapped() ?? [])")
    array1.compact$()
    print("\tCompacted array (mutate): \(array1)")
    
    print("Pop, shift, push, unshift:")
    var array2 = [1, 2, 3, 1, 2, 4, 3, 2, 13]
    array2.pop()
    array2.shift()
    array2.push(10)
    array2 << 5
    array2.unshift(-1)
    print(array2)
    
    print("Map$:")
    array2.map$ { $0 + 1 }
    print(array2)
    
    print("Uniq:")
    print(array2.uniq())
    array2.uniq$()
    
    print("Delete:")
    array2.deleteIf { $0 % 2 == 0}
    array2.delete(3)
    array2.delete(4)
    print(array2)
    
    var arr1 = [1, 3, 4, 5, 8]
    let arr2 = [4, 6, 7, 8, 9]
    
    print("Operators:")
    print("\tPush (arr1 << 9): \(arr1 << 9)")
    print("\tUnion (arr1 | arr2): \(arr1 | arr2)")
    print("\tIntersect (arr1 & arr2): \(arr1 & arr2)")
    print("\tComplement (arr1 - arr2): \(arr1 - arr2)")
    print("\tSymmetric difference (arr1 ^ arr2): \(arr1 ^ arr2)")
    print("\tCartesian product (arr1 * arr2): \(arr1 * arr2)")
    print("\tScala product (*4): \(arr1 * 4)")
    print("\tScala product (*0): \(arr1 * 0)")
    print("\tString join (*', '): \(arr1 * ", ")")
    
    let transpose1 = [[1, 2, 3], [4, 5, 6]]
    let transpose2 = [[[1, 2, 3], [4, 5, 6]], [[7, 8, 9], [10, 11, 12]]]
    
    print("Transpose:")
    print("\t\(transpose1) -> \(transpose1.transpose())")
    print("\t\(transpose2) -> \(transpose2.transpose())")
    print("\t\(transpose2).transpose.map(transpose) -> \(transpose2.transpose().map { $0.transpose() })")
    
    print("Permutation:")
    let startTime = NSDate()
    var count = 0
    NSObject.performInBackground({
      count = 10.times().permutation().count
    }) {
      let endTime = NSDate()
      print("\t\(count) generated in \(startTime.timeIntervalSinceDate(endTime))s")
    }
  }
}