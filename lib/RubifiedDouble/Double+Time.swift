//
//  TimeInterval+Time.swift
//  rubified-swift
//
//  Created by Ethan Nguyen on 7/23/16.
//  Copyright © 2016 Thanh Nguyen. All rights reserved.
//

import Foundation

extension Double {
  func seconds() -> NSTimeInterval {
    return NSTimeInterval(self)
  }
  
  func minutes() -> NSTimeInterval {
    return (60 * self).seconds()
  }
  
  func hours() -> NSTimeInterval {
    return (60 * self).minutes()
  }
  
  func days() -> NSTimeInterval {
    return (24 * self).hours()
  }
  
  func weeks() -> NSTimeInterval {
    return (7 * self).days()
  }
  
  func months() -> NSTimeInterval {
    return (30 * self).days()
  }
  
  func years() -> NSTimeInterval {
    return (365 * self).days()
  }
  
  func until(date: NSDate = NSDate()) -> NSDate {
    return NSDate(timeInterval: -self.seconds(), sinceDate: date)
  }
  
  func ago() -> NSDate {
    return NSDate(timeIntervalSinceNow: -self.seconds())
  }
  
  func since(date: NSDate = NSDate()) -> NSDate {
    return NSDate(timeInterval: self.seconds(), sinceDate: date)
  }
  
  func sinceNow() -> NSDate {
    return NSDate(timeIntervalSinceNow: self.seconds())
  }
  
  // Aliases
  
  func second() -> NSTimeInterval {
    return self.seconds()
  }
  
  func minute() -> NSTimeInterval {
    return self.minutes()
  }
  
  func hour() -> NSTimeInterval {
    return self.hours()
  }
  
  func week() -> NSTimeInterval {
    return self.weeks()
  }
  
  func month() -> NSTimeInterval {
    return self.months()
  }
  
  func year() -> NSTimeInterval {
    return self.years()
  }
}