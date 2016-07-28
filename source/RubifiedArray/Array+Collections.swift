//
//  Array+Elements.swift
//  rubified-swift
//
//  Created by Ethan Nguyen on 7/23/16.
//  Copyright © 2016 Thanh Nguyen. All rights reserved.
//

import Foundation

/**
 Extensions for Array
 Set of extended methods for normal elements manipulation
 */
extension Array {
  /**
   Returns the element at `index`.
   A negative index counts from the end of `self`. Returns `nil` if the index is out of range.
   
   By default, class `Array` already has subscript function with an `Int` param,
   but it refuse to process negative indices.
   Function `at()` receives and processes both positive and negative indices.
   
   - parameter index: The index of element to be retrieved.
   
   - returns: Returns element at `index` position if `index` is in range, otherwise returns `nil`.
   */
  public func at(index: Int) -> Element? {
    if index > self.count || index < -self.count { return nil }
    
    var absIndex = index
    if index < 0 { absIndex += self.count }
    
    return self[absIndex]
  }
  
  /**
   Append — Pushes the given objects on to the end of this array.
   This expression returns the array itself, so several appends may be chained together.
   
   - seealso: `pop()` function for the opposite effect.
   
   - parameter newElements: Objects to be appended.
   
   - returns: This array itself after appending new elements.
   */
  public mutating func push(newElements: Element...) -> [Element] {
    self.appendContentsOf(newElements)
    return self
  }
  
  /**
   Removes the last element from `self` and returns it, or `nil` if the array is empty.
   
   - returns: Returns `nil` if this array is empty. Otherwise returns the last element.
   */
  public mutating func pop() -> Element? {
    return self.popLast()
  }
  
  /**
   Removes the first element of `self` and returns it (shifting all other elements down by one).
   Returns `nil` if the array is empty.
   
   - returns: Returns `nil` if this array is empty. Otherwise returns the first element.
   */
  public mutating func shift() -> Element? {
    return self.count == 0 ? nil : self.removeAtIndex(0)
  }
  
  /**
   Prepends objects to the front of `self`, moving other elements upwards.
   
   - seealso: `shift()` function for the opposite effect.
   
   - returns: This array itself after appending new elements.
   */
  public mutating func unshift(newElements: Element...) -> [Element] {
    self.insertContentsOf(newElements, at: 0)
    return self
  }
  
  /**
   Returns a string created by converting each element of the array to a string,
   separated by the given separator. Uses empty string as default.
   
   - parameter separator: The string used to separate elements in result string.
   
   - returns: The only string contains all elements converted as string.
   */
  public func join(separator: String = "") -> String {
    return self.map { String($0) }.joinWithSeparator(separator)
  }
  
  /**
   Invokes the given block once for each element of self,
   replacing the element with the value returned by the block.
   The array may not be changed instantly every time the block is called.
   
   - parameter callback: The block to be called for each element.
   
   - returns: This array itself after changes.
   */
  public mutating func map$(callback: Element -> Element) -> [Element] {
    self = self.map(callback)
    return self
  }
  
  /**
   Returns a new array containing all elements of `self`
   for which the given block returns a `true` value.
   
   - parameter callback: The block to be called for each element.
   
   - returns: The array which given block returns a `true` value.
   */
  public func select(callback: Element -> Bool) -> [Element] {
    return self.filter(callback)
  }
  
  /**
   Invokes the given block passing in successive elements from `self`,
   deleting elements for which the block returns a `false` value.
   The array may not be changed instantly every time the block is called.
   
   - parameter callback: The block to be called for each element.
   
   - returns: This array itself after changes.
   */
  public mutating func select$(callback: Element -> Bool) -> [Element] {
    self = self.filter(callback)
    return self
  }
  
  /**
   Returns a new array containing the items in self for which the given block is `false`.
   The ordering of non-rejected elements is maintained.
   
   - parameter callback: The block to be called for each element.
   
   - returns: The array which given block returns a `false` value.
   */
  public func reject(callback: Element -> Bool) -> [Element] {
    return self.filter { !callback($0) }
  }
  
  /**
   Deletes every element of self for which the block evaluates to `true`.
   The array may not be changed instantly every time the block is called.
   
   - parameter callback: The block to be called for each element.
   
   - returns: This array itself after changes.
   */
  public mutating func reject$(callback: Element -> Bool) -> [Element] {
    self = self.filter { !callback($0) }
    return self
  }
  
  /**
   Deletes every element of `self` for which block evaluates to `true`.
   The array may not be changed instantly every time the block is called.
   
   - parameter callback: The block to be called for each element.
   
   - returns: This array itself after changes.
   */
  public mutating func deleteIf(callback: Element -> Bool) -> [Element] {
    let indices: [Int] = self.enumerate().map { (idx, element) in callback(element) ? idx : -1 }
    indices.filter { $0 != -1 }.reverse().forEach { (idx) in self.removeAtIndex(idx) }
    return self
  }
  
  /**
   Deletes every element of self for which the given block evaluates to `false`.
   The array may not be changed instantly every time the block is called.
   
   - parameter callback: The block to be called for each element.
   
   - returns: This array itself after changes.
   */
  public mutating func keepIf(callback: Element -> Bool) {
    let indices: [Int] = self.enumerate().map { (idx, element) in callback(element) ? -1 : idx }
    indices.filter { $0 != -1 }.reverse().forEach { (idx) in self.removeAtIndex(idx) }
  }
  
  /**
   Generates all possible permutations for given number of first elements.
   If no param or `0` is given, generates for all elements.
   The implementation using [Countdown Quick Perm Algorithm](http://www.quickperm.org/)
   and makes no guarantees about the order in which the permutations are generated.
   
   - parameter count: Number of first elements to be generated.
   
   - returns: All possible permutations for the first `count` elements.
   */
  public func permutation(count: Int = 0) -> [[Element]] {
    let number = count > 0 && count < self.count ? count : self.count
    let source = [Element](self[0..<number])
    var result = [[Element]](arrayLiteral: source)  // Init result with first element
    self._permutate(source, &result)
    return result
  }
  
  private func _permutate(source: [Element], inout _ result: [[Element]]) {
    var a = source            // Duplicate source as new array
    let n = source.count      // Number of elements
    var p = [Int](0...n)      // Array of flags
    var i = 1                 // Counting variable
    
    while i < n {
      p[i] -= 1
      let j = i % 2 == 0 ? 0 : p[i]
      let tmp = a[i]; a[i] = a[j]; a[j] = tmp       // Swap elements at index i & j
      result.append(a)
      i = 1; while p[i] == 0 { p[i] = i; i += 1 }
    }
  }
}