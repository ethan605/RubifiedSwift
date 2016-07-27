//
//  TimeInterval+Time.swift
//  rubified-swift
//
//  Created by Ethan Nguyen on 7/23/16.
//  Copyright © 2016 Thanh Nguyen. All rights reserved.
//

import Foundation

extension Double {
  // Unit conversions
  public func seconds() -> NSTimeInterval { return NSTimeInterval(self) }
  public func minutes() -> NSTimeInterval { return (60 * self).seconds() }
  public func hours() -> NSTimeInterval { return (60 * self).minutes() }
  public func days() -> NSTimeInterval { return (24 * self).hours() }
  public func weeks() -> NSTimeInterval { return (7 * self).days() }
  public func months() -> NSTimeInterval { return (30 * self).days() }
  public func years() -> NSTimeInterval { return (365 * self).days() }
  
  // Aliases
  public func second() -> NSTimeInterval { return self.seconds() }
  public func minute() -> NSTimeInterval { return self.minutes() }
  public func hour() -> NSTimeInterval { return self.hours() }
  public func day() -> NSTimeInterval { return self.days() }
  public func week() -> NSTimeInterval { return self.weeks() }
  public func month() -> NSTimeInterval { return self.months() }
  public func year() -> NSTimeInterval { return self.years() }
  
  // Date conversions
  public func until(date: NSDate = NSDate()) -> NSDate {
    return NSDate(timeInterval: -self.seconds(), sinceDate: date)
  }
  
  public func ago() -> NSDate {
    return NSDate(timeIntervalSinceNow: -self.seconds())
  }
  
  public func since(date: NSDate = NSDate()) -> NSDate {
    return NSDate(timeInterval: self.seconds(), sinceDate: date)
  }
  
  public func sinceNow() -> NSDate {
    return NSDate(timeIntervalSinceNow: self.seconds())
  }
}