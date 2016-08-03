![RubifiedSwift logo][Logo Url] ![RubifiedSwift title][Title Url]

# RubifiedSwift
### Bunch of Swift extensions for Number, String, Array, Dictionary... written in Ruby-styled implementations.

Inspired by [ObjectiveSugar](https://github.com/supermarin/ObjectiveSugar) & [RubySugar](https://github.com/michalkonturek/RubySugar)

## Installation

### [Cocoapods][]

Add the following line to your [Podfile][]:

````ruby
pod 'RubifiedSwift', '~> 0.9'
````

Make sure to add the line `use_frameworks!` to your Podfile or target to opt into frameworks instead of static libraries.

Then run `pod install` to install the latest version of the framework.

## Usage

Most of **Ruby** functions are written in 2 common styles: **immutable** functions in normal way and **mutable** functions ending with exclaimation mark (`!`). Unfortunately, in **Swift**, `!` is reserved keyword for **unwrapped** values. So **RubifiedSwift** uses `$` at the end of **mutable** functions to preserve **Ruby** style at its best.

### Array extensions

```swift
var array = [1, 2, 3, 4]

array.at(2)          // 3
array.at(-3)         // 2

array.push(5)               // [1, 2, 3, 4, 5]
array.push(6, 7)            // [1, 2, 3, 4, 5, 6, 7]
array.unshift(0)            // [0, 1, 2, 3, 4, 5, 6, 7]
array.unshift(-2, -1)       // [-2, -1, 0, 1, 2, 3, 4, 5, 6, 7]

array.pop()           // 7
array                 // [-2, -1, 0, 1, 2, 3, 4, 5, 6]
array.shift()         // -2
array                 // [-1, 0, 1, 2, 3, 4, 5, 6]

array.join()          // "-10123456"
array.join(" ")       // "-1 0 1 2 3 4 5 6"

array.map$ { $0 * 2 }
array                 // [-2, 0, 2, 4, 6, 8, 10, 12]

array.select { $0 % 3 == 0 }      // [6, 12]
var arr = array
arr.select$ { $0 % 3 == 0 }
arr                               // [6, 12]

array.reject { $0 % 4 == 0 }      // [-2, 2, 6, 10]
arr = array
arr.reject$ { $0 % 4 == 0 }
arr                               // [-2, 2, 6, 10]

arr = array
arr.deleteIf { $0 % 5 == 0 }
arr                               // [-2, 2, 4, 6, 8, 12]

arr = array
arr.keepIf { $0 % 5 == 0 }
arr                               // [0, 10]

[1, 2, 3].permutation()           // [[1, 2, 3], [1, 3, 2], [2, 1, 3], [2, 3, 1], [3, 1, 2], [3, 2, 1]]

array.max()                       // 12
array.min()                       // -2

arr = array
arr.delete(5)                     // nil
arr.delete(2)                     // Optional(2)

arr = [1, 1, 2, 3, 4, 4]
arr.uniq()                       // [1, 2, 3, 4]
arr.uniq$()
arr                              // [1, 2, 3, 4]

[1, 2, 3, 4].eachWithIndex { (element, index) in
  print("\(index). \(element)")
}

[1, 2, 3, 4].mapWithIndex { (element, index) in
  index * element
}                                 // [0, 2, 6, 12]

arr = [1, 2, 3, 4]
arr << 5                          // [1, 2, 3, 4, 5]

[1, 2, 3, 4] | [3, 4, 5, 6]       // [1, 2, 3, 4, 5, 6]
[1, 2, 3, 4] & [3, 4, 5, 6]       // [3, 4]
[1, 2, 3, 4] - [3, 4, 5, 6]       // [1, 2]
[1, 2, 3, 4] ^ [3, 4, 5, 6]       // [1, 2, 5, 6]
[1, 2] * [3, 4]                   // [[1, 3], [1, 4], [2, 3], [2, 4]]
[1, 2] * 3                        // [1, 2, 1, 2, 1, 2]
[1, 2, 3, 4] * ", "               // "1, 2, 3, 4"

[[1, 2, 3], [4, 5, 6]].transpose()  // [[1, 4], [2, 5], [3, 6]]

let sub1 = [4, 5]
let sub2: [Any?] = [8, nil]
let sub3: [Any?] = [nil]
let sub4: [Any?] = [7, sub2, [9], sub3]
var arr: [Any?] = [1, 2, sub1, 6, sub4]

array.unwrapped()                // [1, 2, [4, 5], 6, [Optional(7), Optional([Optional(8), nil]), Optional([9]), Optional([nil])]]
array.deepUnwrapped()            // [1, 2, [4, 5], 6, 7, [9]]

array.compact()                  // [Optional(1), Optional(2), Optional([4, 5]), Optional(6), Optional([Optional(7), Optional([Optional(8), nil]), Optional([9]), Optional([nil])])]
array.deepCompact()              // [Optional(1), Optional(2), Optional([4, 5]), Optional(6), Optional(7), Optional(8), Optional([9])]

["a", "b", "c", "d"].rotate()    // ["b", "c", "d", "a"]
["a", "b", "c", "d"].rotate(-2)  // ["c", "d", "a", "b"]

["a", "b", "c", "d"].sample()    // "c"
["a", "b", "c", "d"].shuffle()   // ["b", "c", "d", "a"]
```

### Number extensions

```swift
1.0.abs()         // 1.0
-1.0.abs()        // 1.0

7.seconds()       // 7.0
6.minutes()       // 360.0
5.hours()         // 18000.0
4.days()          // 345600.0
3.weeks()         // 1814400.0
2.months()        // 5184000.0
1.years()         // 31536000.0

3.hours().ago()
3.hours().sinceNow()

let time = 3.hours().ago()
3.hours().until(time)
3.hours().since(time)

5.times()         // [0, 1, 2, 3, 4, 5]
5.times {
  print("Invoke callback")
}

3.upTo(5)         // [3, 4, 5]
3.upTo(5) {
  print("Invoke callback")
}

3.downTo(1)       // [3, 2, 1]
3.downTo(1) {
  print("Invoke callback")
}

1.next()          // 2
1.pred()          // 0

1.abs()           // 1
-1.abs()          // 1

15.toF()           // 15.0
15.toS()           // "15"
75.toS(2)          // "1001011"
75.toS(8)          // "113"
75.toS(16)                        // "4B"
75.toS(16, uppercase: false)      // "4b"

3.isEven()         // false
3.isOdd()          // true

21.gcd(6)          // 3
21.lcm(6)          // 42
```

### String extensions

```swift
var str = "Hello, World!"

str.length          // 13
str[1]              // "e"
str[-1]             // "!"
str[1...4]          // "ello"

str.reverse()       // "!dlroW ,olleH"

str.split()         // ["H", "e", "l", "l", "o", ",", " ", "W", "o", "r", "l", "d", "!"]
str.split(", ")     // ["Hello", "World!"]

str.index("l")      // 2

str * 2                   // "Hello, World!Hello, World!"
str << " You're good"     // "Hello, World! You're good"
str << 33                 // "Hello, World! You're good!"

let match: String? = str =~ "\\w+"          // "Hello"
let matches: [String] = str =~ "\\w+"       // ["Hello", "World"]
```

### NSObject extensions

```swift
NSObject.performAfter(3) {
  print("Perform after 3 seconds")
}

NSObject.performInBackground({
  print("Perform in background")
}) {
  print("Perform in foreground")
}
```

[Logo Url]: https://dl.dropboxusercontent.com/u/44988373/Work/FnFr/RubifiedSwift/RubifiedSwift-logo.png
[Title Url]: https://dl.dropboxusercontent.com/u/44988373/Work/FnFr/RubifiedSwift/RubifiedSwift-title.png
[CocoaPods]: https://cocoapods.org
[Podfile]: https://guides.cocoapods.org/using/the-podfile.html
