"""
///열거형_원시 값
"""
//특정타입으로 지정된 값을 가질수 있다는 뜻입니다. 특정 타입의 값을 원시값으로 가지고 싶다면 열거형 이름 오른쪽에 타입을 명시해 주면됩니다. 또, 원시값을 사용하고 싶다면 rawValue라는 프로퍼티를 통해 가져올수 있습니다.

enum School: String {
    case primary = "유치원"
    case elementary = "초등학교"
    case middle = "중학교"
    case high = "고등학교"
    case college = "대학"
    case university = "대학교"
    case graduate = "대학원"
}

let highestEducationlevel: School = School.university

print("저의 최종학력은 \(highestEducationlevel.rawValue)졸업입니다.") //저의 최종학력은 대학교 졸업입니다.

enum WeekDays: Character {
    case mon = "월" , tue = "화", wed = "수", thu = "목", fri = "금", sat = "토", sun = "일"
}
let today: WeekDays = WeekDays.fri

print("오늘은 \(today.rawValue)요일입니다.") //오늘은 금요일입니다.

//열거형의 원시값 일부 지정 및 자동처리
enum School2: String {
    case primary = "유치워"
    case elementary = "초등학교"
    case middle = "중학교"
    case high = "고등학교"
    case college
    case university
    case gaduate
}

let highestEducationLevel: School2 = School2.university
print("저의 최종학력은 \(highestEducationLevel.rawValue)졸업입니다.") //저의 최종학력은 university졸업입니다.

print(School2.elementary.rawValue) // 초등학교

enum Numbers: Int {
    case zero
    case one
    case two
    case ten = 10
}

print("\(Numbers.zero.rawValue), \(Numbers.one.rawValue), \(Numbers.ten.rawValue)") // 0, 1, 10

let primary = School(rawValue: "유치원") //primary
let graduate = School(rawValue: "석박사") //nil
let one = Numbers(rawValue: 1) //one
let three = Numbers(rawValue: 3) //nil
