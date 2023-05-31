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

"""
///Character
"""
let alphabetA: Character = "A"
print(alphabetA)

let 한글변수이름: Character = "ㄱ"
print("한글의 첫 자음: \(한글변수이름)")
"""
///String
"""
// 상수로선언된문자열은변경이불가능합니다.
let name: String = "lucas"
// 이니셜라이저를사용하여빈문자열을생성할수있습니다.
// var 키워드를사용하여 변수를생성했으므로 문자열의 수정및 변경이가능합니다.
var introduce: String = String()
//append() 메서드를사용하여문자열을이어붙일수있습니다.
introduce.append("제 이름은")
// +연산자를통해서도문자열을이어붙일수있습니다.1
introduce = introduce+" "+name+"입니다."
print(introduce)

// name에해당하는문자의수를셀수있습니다.
print("name의 글자수: \(name.count)")
// 빈문자열인지확인해볼수있습니다.
print( "introduce가비어있습니까?: \(introduce .isEmpty)")
// 유니코드의스칼라값을사용하면값에해당하는표현이출력됩니다- 어떤모양이출력되나요?
let unicodescalarValue: String = "\u{2665}" //--> ♥


// 연산자를 통한 문자열 결합
let hello: String = "Hello"
let lucas: String = "lucas"
var greeting: String = hello + " " + lucas + "!"
print(greeting)

// 연산자를통한문자열비교
var isSameString: Bool = false

isSameString = hello == "Hello"
print(isSameString) //true

isSameString = hello == "hello"
print(isSameString) //false

// 메서드를 통한 접두어, 저미어 확인
var hasPrefix: Bool = false
hasPrefix = hello.hasPrefix("He")
print(hasPrefix) //true

hasPrefix = lucas.hasPrefix("cas")
print(hasPrefix) //false

hasPrefix = hello.hasPrefix("Hello")
print(hasPrefix) //true

var hasSuffix: Bool = false
hasSuffix = hello.hasSuffix("He")
print(hasSuffix) //false

hasSuffix = hello.hasSuffix("llo")
print(hasSuffix) //true

hasPrefix = greeting.hasSuffix("lucas")
print(hasSuffix) //false

hasPrefix = greeting.hasSuffix("lucas!")
print(hasSuffix) //true

// 메소드를 통한 대소문자 변환
var covertedString: String = ""
covertedString = hello.uppercased()
print(covertedString) //HELLO

covertedString = greeting.uppercased()
print(covertedString) //HELLO LUCAS!

covertedString = greeting.lowercased()
print(covertedString) //hello lucas!

//프로퍼티를 통한 빈 문자열 확인
var isEmptyString: Bool = false
isEmptyString = greeting.isEmpty
print(isEmptyString) //false

greeting = "안녕"
isEmptyString = greeting.isEmpty
print(isEmptyString) //false

greeting = ""
isEmptyString = greeting.isEmpty
print(isEmptyString) //true

// 프로퍼티를 이용한 문자열길이확인
greeting = "안녕하세요"
print(greeting.count) //5

// 코드상에서여러줄의문자열을직접쓰고싶다면큰따옴표세개를사용하면됩니다.
// 큰따옴표세개를써주고한줄을내려써야합니다.
// 마지막줄도큰따옴표세개는한줄내려써야합니다.
greeting = """
안녕하세요 저는 \(lucas)입니다. Swift 잘 하고 싶어요!
잘 부탁합니다!
"""
