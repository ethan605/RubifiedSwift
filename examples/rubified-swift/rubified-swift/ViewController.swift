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
    print("3.times = \(3.times())")
    3.times { print("Print index: \($0)") }
    3.times { print("Print single line") }
  }
  
  func tryRubifiedString() {
  }
}