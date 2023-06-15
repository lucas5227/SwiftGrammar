"""
///흐름제어_조건문_switch
"""
//switch 구문도 소괄호 (())를 생략할수 있습니다. 단, break 키워드 사용은 선택사항입니다. 즉, case 내부의 코드를 모 두 실 행 하 면 b r e a k 없 이 도 s w i t c h 구 문 이 종 료 된 다 는 뜻입니다. 이방식은예상치못한실수를줄이는데도큰도움이됩니다. 따라서 break를 쓰지 않고 Case를 연속실행하던 트릭을 더이상사용하지 못합니다. 스위프트에서swi tch 구문의 case를 연속실행하려면 fallthrough 키워드를 사용합니다.

/// switch구문기본구현
let integerValue: Int = 5

switch integerValue {
case 0:
    print("Value == zero")
case 1...10:
    print("Value == 1~10")
    fallthrough
case Int.min..<0, 101..<Int.max:
    print("Value < 0 or Value > 100")
    break
default:
    print("10 < Value <= 100")
}

// result
// Value == 1~10
// Value < 0 or Value > 100

///부동소수타입의 범위연산을 통한 switch case구성
let doubleValue: Double = 3.0

switch doubleValue {
case 0:
    print("Value == zero")
case 1.5...10.5:
    print("Value == 1.5~10.5")
default:
    print("Value == \(doubleValue)")
}

//Value == 1.5~10.5

///문자열 switch case구성
let stringvalue: String = "LiamNeeson"

switch stringvalue {
case "lucas":
    print("He is lucas")
case "oracle":
    print("She is oracle")
case "neo","trinity","morpheus":
    print("He or She is \(stringvalue)")
default:
    print("\(stringvalue)said' I don't knoww who you are")
}

//LiamNeesonsaid' I don't knoww who you are
