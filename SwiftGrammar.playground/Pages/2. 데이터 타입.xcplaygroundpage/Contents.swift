/// Int8, Int16, Int32, Int64 +-정수
/// UInt8, UInt16, UInt32, UInt64 +정수
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

///Bool
var boolean: Bool = true
boolean.toggle()    // true - false 변경
let iLoveYou: Bool = true
let isTimeUnlimited: Bool = false
print("시간은 무한합니까?: \(isTimeUnlimited)")

/// Float & Double
var floatValue: Float = 1234567899.1
//자신이 담을 수 있는 값만 남김
let doubleValue: Double = 123456789.1

print("floatVValue: \(floatValue) doubleValue: \(doubleValue)")

floatValue = 123456.1

print(floatValue)

//임의의 수
Int.random(in: -100...100)
UInt.random(in: 1...30)
Double.random(in: 1.5...4.3)
Float.random(in: -0.5...1.5)

///Character
let alphabetA: Character = "A"
print(alphabetA)

let 한글변수이름: Character = "ㄱ"
print("한글의 첫 자음: \(한글변수이름)")

///String


