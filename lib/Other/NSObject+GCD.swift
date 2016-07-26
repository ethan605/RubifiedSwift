//
//  NSObject+GCD.swift
//  rubified-swift
//
//  Created by Ethan Nguyen on 7/26/16.
//  Copyright © 2016 Thanh Nguyen. All rights reserved.
//

import Foundation

// Grand Central Dispatch extensions
extension NSObject {
  public class func performAfter(delay: NSTimeInterval, _ callback: () -> Void) {
    dispatch_after(
      dispatch_time(DISPATCH_TIME_NOW, Int64(delay * NSTimeInterval(NSEC_PER_SEC))),
      dispatch_get_main_queue(),
      callback
    )
  }
  
  public class func performInBackground(callback: () -> Void, _ completion: () -> Void) {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) { 
      callback()
      dispatch_sync(dispatch_get_main_queue(), completion)
    }
  }
}