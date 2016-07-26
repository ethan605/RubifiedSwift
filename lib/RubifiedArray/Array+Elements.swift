//
//  Array+Elements.swift
//  rubified-swift
//
//  Created by Ethan Nguyen on 7/25/16.
//  Copyright © 2016 Thanh Nguyen. All rights reserved.
//

import Foundation

// Element extensions
extension Array {
  func at(index: Int) -> Element? {
    if index > self.count || index < -self.count {
      return nil
    }
    
    var absIndex = index
    
    if index < 0 {
      absIndex += self.count
    }
    
    return self[absIndex]
  }
  
  mutating func push(newElement: Element) -> [Element] {
    self.append(newElement)
    return self
  }
  
  mutating func unshift(newElement: Element) -> [Element] {
    self.insert(newElement, atIndex: 0)
    return self
  }
  
  mutating func pop() -> Element? {
    return self.popLast()
  }
  
  mutating func shift() -> Element? {
    if self.count == 0 {
      return nil
    }
    
    return self.removeAtIndex(0)
  }
  
  mutating func map$(callback: Element -> Element) {
    let mapped = self.map(callback) as [Element]
    self = mapped
  }
  
  func select(callback: Element -> Bool) -> [Element] {
    return self.filter(callback)
  }
  
  mutating func select$(callback: Element -> Bool) {
    self = self.filter(callback)
  }
  
  func reject(callback: Element -> Bool) -> [Element] {
    return self.filter { !callback($0) }
  }
  
  mutating func reject$(callback: Element -> Bool) {
    self = self.filter { !callback($0) }
  }
  
  mutating func deleteIf(callback: Element -> Bool) {
    var indices = [Int]()
    
    self.withIndex {
      if callback($0) { indices.append($1) }
    }
    
    for index in indices.reverse() {
      self.removeAtIndex(index)
    }
  }
  
  mutating func keepIf(callback: Element -> Bool) {
    var indices = [Int]()
    
    self.withIndex {
      if !callback($0) { indices.append($1) }
    }
    
    for index in indices.reverse() {
      self.removeAtIndex(index)
    }
  }
}