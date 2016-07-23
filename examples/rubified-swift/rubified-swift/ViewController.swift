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
    self.tryRubifiedInt()
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
  
  func tryRubifiedArray() {
    print("Times with index:")
    3.times().withIndex { print("\tPrint with index: \($0)") }
    
    print("Up to with index:")
    3.upTo(5).withIndex { print("\tPrint with index: \($0)") }
    
    print("Down to with index:")
    3.downTo(1).withIndex { print("\tPrint with index: \($0)") }
  }
}