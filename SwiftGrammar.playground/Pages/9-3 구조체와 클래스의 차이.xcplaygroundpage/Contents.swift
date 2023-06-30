"""
///구조체와 클래스의 차이
///값타임과 참조타입
"""
/*
 동일점:
    1. 값을 저장하기 위해 프로퍼티를 정의 할수 있다.
    2. 기능 실행을 위해 매서드를 정의할수 있다.
    3. 서브스크립트 문법으로 구조체 또는 클래스가 갖는 값(프로퍼티)에 접근하도록 서브스크립트를 정의할수 있다.
    4. 초기화됭 떄의 상태를 지정하기 위해 이니셜라이저를 정의할 수 있다.
    5. 초기구현과 더불어 새로운 기능 추가를 위해 익스탠션을 통해 확장할 수 있다.
    6. 특정 기능을 실행하기 위해 특정 프로토콜을 준수할 수 있다.
 차이점:
    1. 구조체는 상속할수 없다.
    2. 타입캐스팅은 클래스의 인스턴스에만 허용된다.
    3. 디이니셜라이저는 클래스의 인스턴스에만 활용할수 있다.
    4. 참조 횟수 계산(referance counting)은 클래스인스텉스에만 적용된다.
 */
"""
구조체는값타입이고클래스는참조타일이다.
"""
///값타입과참조타입의차이
struct BasicInformation {
    let nama: String
    var age: Int
}

var lucasInfo: BasicInformation = BasicInformation(nama: "lucas", age: 99)
lucasInfo.age = 100

// lucasInfo의 값을 복사하여 할당합니다!
var friendInfo: BasicInformation = lucasInfo

print("lucas's age: \(lucasInfo.age)")      //100
print("friend's age: \(friendInfo.age)")      //100

friendInfo.age = 999

print("lucas's age: \(lucasInfo.age)")      //100 = lucas의 값은 변동 없습니다.
print("friend's age: \(friendInfo.age)")
//999 = friendInfo는 yagomInfo의 값을 복사해왔기 때문에 별개의 ㅏㅂㅅ을 갖습니다.

class Person {
    var height: Float = 0.0
    var weight: Float = 0.0
}

var lucas: Person = Person()
var friend: Person = lucas // lucas의 참조를 할당한다!


print("lucas's height: \(lucas.height)")    //0.0
print("friend's height: \(friend.weight)")    //0.0

friend.height = 185.5
print("lucas's height: \(lucas.height)")
//185.5 = friend는 lucas을 참조하기 때문에 값이 변동된다.

print("friend'sheight:( friend.height)")
// 185.5 = 이를 통해 yagom이 참조하는 곳과 friend가 참조하는곳이 같음을 알수 있습니다.
func changeBasicInfo(_ info: BasicInformation) {
    var copiedInfo: BasicInformation = info
    copiedInfo.age = 1
}
func changePersonInfo(_ info: Person) {
    info.height = 175.3
}
    
// changeBasicInfo(_:)로 전달되는 전달인자는 값이 복사되어 전달된다 따라서
// lucasInfo의 값만 전달된다.
changeBasicInfo(lucasInfo)
print("lucas's age: \(lucasInfo.age)")  //100

// changePersonInfo(_:)의 전달인자로 lucas의 참조가 전달되었기 때무에
// lucas의 참조하는 값들에 변화가 생깁니다.
changePersonInfo(lucas2)
print("lucas's height : \(lucas2.height)") //175.3


///식별 연산자의 사용
var lucas2: Person = Person()
let friend2: Person = lucas                  // lucas의 탐조를 할당합니다.
let anotherFriend: Person = Person()        // 새로운 인스턴스를 할당

print(lucas2 === friend2)         //true
print(lucas2 === anotherFriend)         //false
print(lucas2 !== anotherFriend)         //true
