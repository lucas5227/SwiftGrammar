"""
///Bool
"""
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
