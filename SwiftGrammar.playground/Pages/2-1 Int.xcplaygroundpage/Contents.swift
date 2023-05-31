"""
/// Int8, Int16, Int32, Int64 +-정수
/// UInt8, UInt16, UInt32, UInt64 +정수
"""
var integer: Int = -100
let unsignedInteger: UInt = 50
print("intenger value: \(integer), unsignedInger: \(unsignedInteger)")
print("Int 최대값: \(Int.max) Int 최소갑: \(Int.min)")
print("UInt 최대값: \(UInt.max)  UInt최소갑: \(UInt.min)")
let largerInteger: Int64 = Int64.max
let smallUnsinedInteger: UInt8 = UInt8.max
print("Int64 최대값: \(largerInteger).  UInt8 최대갑: \(smallUnsinedInteger)")
/*
let tooLarge: Int = Int.max+1
let cannotBeNegetive: UInt = -5

intger = unsignedInteger //스위프트에서 Int 와 UInt는 다른 타입
intger = Int(unsignedInteger)
*/

let decimalInteger: Int = 28
let binaryInteger: Int = 0b11100
let octalInteger: Int = 0o34
let hexadecimalIntger: Int = 0x1c
