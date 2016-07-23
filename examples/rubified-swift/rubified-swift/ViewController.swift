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
    self.tryRubifiedString()
  }
  
  func tryRubifiedInt() {
    print("Times:")
    print("\t3.times() = \(3.times())")
    3.times { print("\tPrint single line") }
    
    print("Up to:")
    print("\t3.upTo(5) = \(3.upTo(5))")
    3.upTo(5) { print("\tPrint single line") }
    
    print("Down to:")
    print("\t3.downTo(1) = \(3.downTo(1))")
    3.downTo(1) { print("\tPrint single line") }
  }
  
  func tryRubifiedString() {
  }
}