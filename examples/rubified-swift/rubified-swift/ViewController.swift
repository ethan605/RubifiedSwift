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
    var array: [Any?] = [1, 2, sub1, 6, sub4, nil]
    
    print("\tUnwrapped array: \(array.unwrap())")
    print("\tCompacted array: \(array.compact())")
    array.compact$()
    print("\tCompacted array (mutate): \(array)")
  }
}