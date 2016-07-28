//
//  NSObject+GCD.swift
//  rubified-swift
//
//  Created by Ethan Nguyen on 7/26/16.
//  Copyright © 2016 Thanh Nguyen. All rights reserved.
//

import Foundation

/**
 Extensions for NSObject
 Set of extended methods deal with Objective-C's Grand Central Dispatch mechanism
 */
extension NSObject {
  /**
   Delay and perform a given block of action.
   
   - parameter delay: Time in seconds to be delayed.
   - parameter callback: The callback to be performed after `delay` seconds.
   */
  public class func performAfter(delay: NSTimeInterval, _ callback: () -> Void) {
    dispatch_after(
      dispatch_time(DISPATCH_TIME_NOW, Int64(delay * NSTimeInterval(NSEC_PER_SEC))),
      dispatch_get_main_queue(),
      callback
    )
  }
  
  /**
   Perform a given block of action in background, callback after completion.
   
   - parameter action: The block to be performed in background.
   - parameter callback: The block to be performed (in foreground) after `action` finished.
   */
  public class func performInBackground(action: () -> Void, _ callback: () -> Void) {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) { 
      action()
      dispatch_sync(dispatch_get_main_queue(), callback)
    }
  }
}