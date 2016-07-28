//
//  Int+Time.swift
//  rubified-swift
//
//  Created by Ethan Nguyen on 7/23/16.
//  Copyright © 2016 Thanh Nguyen. All rights reserved.
//

import Foundation

/**
 Set of extended methods for Int type numerics manipulations & time conversions.
 */
extension Int {
  /**
   Return number of seconds in `NSTimeInterval`.
   
   - returns: Number of seconds in `NSTimeInterval`.
   */
  public func seconds() -> NSTimeInterval { return NSTimeInterval(self) }
  
  /**
   Convert and return number of seconds for `self` minute(s).
   
   - returns: Number of seconds for `self` minute(s).
   */
  public func minutes() -> NSTimeInterval { return (60 * self).seconds() }
  
  /**
   Convert and return number of seconds for `self` hour(s).
   
   - returns: Number of seconds for `self` hour(s).
   */
  public func hours() -> NSTimeInterval { return (60 * self).minutes() }
  
  /**
   Convert and return number of seconds for `self` day(s).
   
   - returns: Number of seconds for `self` day(s).
   */
  public func days() -> NSTimeInterval { return (24 * self).hours() }
  
  /**
   Convert and return number of seconds for `self` week(s).
   
   - returns: Number of seconds for `self` week(s).
   */
  public func weeks() -> NSTimeInterval { return (7 * self).days() }
  
  /**
   Convert and return number of seconds for `self` month(s).
   Each month should have 30 days.
   
   - returns: Number of seconds for `self` month(s).
   */
  public func months() -> NSTimeInterval { return (30 * self).days() }
  
  /**
   Convert and return number of seconds for `self` year(s).
   Each year should have 365 days.
   
   - returns: Number of seconds for `self` year(s).
   */
  public func years() -> NSTimeInterval { return (365 * self).days() }
  
  /**
   Alias for `seconds()`
   
   - returns: Number of seconds in `NSTimeInterval`.
   */
  public func second() -> NSTimeInterval { return self.seconds() }
  
  /**
   Alias for `minutes()`
   
   - returns: Number of seconds for `self` minute(s).
   */
  public func minute() -> NSTimeInterval { return self.minutes() }
  
  /**
   Alias for `hours()`
   
   - returns: Number of seconds for `self` hour(s).
   */
  public func hour() -> NSTimeInterval { return self.hours() }
  
  /**
   Alias for `days()`
   
   - returns: Number of seconds for `self` day(s).
   */
  public func day() -> NSTimeInterval { return self.days() }
  
  /**
   Alias for `weeks()`
   
   - returns: Number of seconds for `self` week(s).
   */
  public func week() -> NSTimeInterval { return self.weeks() }
  
  /**
   Alias for `months()`
   
   - returns: Number of seconds for `self` month(s).
   */
  public func month() -> NSTimeInterval { return self.months() }
  
  /**
   Alias for `years()`
   
   - returns: Number of seconds for `self` year(s).
   */
  public func year() -> NSTimeInterval { return self.years() }
  
  /**
   Returns a date that is `self` seconds before a specific `date`.
   If no `date` given, returns a date that is `self` seconds before now.
   
   - parameter date: The date to calculate.
   
   - returns: Another date that is `self` seconds before a specific `date`.
   */
  public func until(date: NSDate = NSDate()) -> NSDate {
    return NSDate(timeInterval: -self.seconds(), sinceDate: date)
  }
  
  /**
   Returns a date that is `self` seconds before a specific `date`.
   
   - returns: Another date that is `self` seconds before a specific `date`.
   */
  public func ago() -> NSDate {
    return NSDate(timeIntervalSinceNow: -self.seconds())
  }
  
  /**
   Returns a date that is `self` seconds since a specific `date`.
   If no `date` given, returns a date that is `self` seconds since now.
   
   - parameter date: The date to calculate.
   
   - returns: Another date that is `self` seconds since a specific `date`.
   */
  public func since(date: NSDate = NSDate()) -> NSDate {
    return NSDate(timeInterval: self.seconds(), sinceDate: date)
  }
  
  /**
   Returns a date that is `self` seconds since a specific `date`.
   
   - returns: Another date that is `self` seconds since a specific `date`.
   */
  public func sinceNow() -> NSDate {
    return NSDate(timeIntervalSinceNow: self.seconds())
  }
}