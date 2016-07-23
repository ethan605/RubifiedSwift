//
//  Time.swift
//  rubified-swift
//
//  Created by Ethan Nguyen on 7/23/16.
//  Copyright © 2016 Thanh Nguyen. All rights reserved.
//

import Foundation

// Time extensions
extension Int {
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