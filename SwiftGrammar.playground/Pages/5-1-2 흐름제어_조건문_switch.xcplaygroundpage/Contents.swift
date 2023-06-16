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

///잠못된 switch case구성
/*
let stringvalue: String = "LiamNeeson"

switch stringvalue {
case "lucas":
    print("He is lucas")
case "oracle":
    print("She is oracle")
case "neo":
     // 비어있으면 오류 -> fallthrought 구현
case "trinity",  "morpheus":
     print("She is oracle")
default:
    print("\(stringvalue)said' I don't knoww who you are")
}
 */

///fallthrough의사용
let stringvalue2: String = "lucas"

switch stringvalue2 {
case "lucas":
    print("He is lucas")
case "oracle":
    print("She is oracle")
case "neo":
    fallthrough
case "trinity",  "morpheus":
     print("She is oracle")
default:
    print("\(stringvalue)said' I don't knoww who you are")
}
//He is lucas

///튜플 switchcase 구성
typealias NameAge = (name: String, age: Int)

let tupleValue: NameAge = ("lucas", 99)

switch tupleValue {
case ("lucas", 99):
    print( " 정확히 맞췄습니다! " )
default:
    print("누굴 찾나요?")
}
// 정확히맞췄습니다!

///와일드카드식별자를사용한튜플switch case 구성
//typealias NameAge = (name: String, age: Int) //상단 선언

let tupleValue2: NameAge = ("lucas", 99)

switch tupleValue2 {
case ("lucas", 99):
    print( " 정확히 맞췄습니다! " )
case ("lucas", let age):
    print( "이름만 맞췄습니다. 나이는 \(age)입니다." )
case (let name, 99):
    print( "나이만 맞췄습니다. 이름는 \(name)입니다." )
default:
    print("누굴 찾나요?")
}

///where를 사용하여 switch case확장
let 직급: String = "사원"
let 연차: Int = 1
let 인턴인가: Bool = false
switch 직급 {
case "사원" where 인턴인가 == true:
    print("인턴입니다.")
case "사원" where 연차 < 2 && 인턴인가 == false:
    print("신입사원입니다.")
case "사원" where 연차 > 5:
    print( "연식 좀된 사원입니다.")
case "사원":
    print( "사원입니다.")
case "사원":
    print("대리입니다.")
default:
    print("사장입니까?" )
}
// 신입사원입니다.

///6-12 열거형을입력값으로받는switch 구문
enum School {
    case primary, elementary, middle, high, college, university, graduate
}
let 최종학력: School = School.university

switch 최종학력 {
case .primary:
    print("최종학력은유치원입니다. ")
case .elementary:
    print( " 최종학력은 초등학교입니다.")
case .middle:
    print(" 최종학력은 중학교입니다.")
case .high:
    print("최종학력은 고등학교입니다.")
case .college, .university:
    print("최종학력은 대학(교)입니다.")
case .graduate:
    print("최종학력은 대학원입니다.")
}
// 최중학력은대학(교)입니다.

///Menu 열거형의 모든 case를 처리하는 switch구문의 상태
enum Menu {
    case chicken
    case pizza
}

let lunchMenu: Menu = .chicken
switch lunchMenu {
case .chicken:
    print( " 반반 무많이")
case .pizza:
    print("핫소스 많이 주세요")
case _: // case default: 와같은표현입니다
    print("오늘메뉴가뭐죠?")
}


switch lunchMenu {
case .chicken:
    print("반반 무많이")
case .pizza:
    print("핫소스많이주세요")
case _:
    print("오늘 메뉴가 뭐죠?")
}

/// 차후에 Menu열거형에 추가한 case를 처리하지 않으면 경고를 내어줄 unknown 속성
enum Menu2 {
case chicken
case pizza
case hamburger
}

let lunchMenu2: Menu = .chicken
switch lunchMenu2 {
case .chicken:
    print( " 반반 무많이")
case .pizza:
    print( "핫소스 많이 주세요")
@unknown case _:
    print( "오늘메뉴가 뭐죠?")
}

///모든 switch구문이 모든 case에 대응하지 않는다는 컴파일러 경고
switch lunchMenu2 { //switch   muste be xhaustive
case .chicken:
    print("반반 무많이")
case .pizza:
    print( "핫소스 많이 주세요")
@unknown case _:
    print("오늘 메뉴가뭐죠?")
}
