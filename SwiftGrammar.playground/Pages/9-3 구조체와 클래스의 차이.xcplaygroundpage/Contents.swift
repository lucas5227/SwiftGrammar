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

/*
 스위프트의 기본 데이터 타입은 모두 구조체
 스위프트 표준 라이브러리에 포함되어 있는 스위프트의 string타입의 기본정의이다
public struct String {
    ///An empty 'String
    public init()
}
 스위프트의 다른 기본 타입(Bo ol, Int. Array, Dictionary. set 통동)도 String타입과 마찬가지로 모두 구조채로 구현되어 있습니다. 이는 기본 데이터 타입은 모두 갔타입이라는 뜻입니다. 전달인자를 통해 데이터를 전달하면 모두 감이 복사되어 전달될뿐, 함수 내부에서 아무리 전달된 값을 변경해도 기존의 변수나 상수에는 전혀 영향을 미치지 못합니다. 이런점을 더욱 확실히하기 위해 스위프트의 전달인자는 모두 상수로 취급되어 전달되는 것일지도 모름니다.
*/


/*
 구조체와 클래스의 선택
 구조체와 클래스는 새로운 데이터타입을 정의하고 기능을 추가한다는 점이 같습니다. 하지만 구조체 인스턴스는 항상 값타입이고, 클래스 인스턴스는 참조타입입니다. 생긴것은 비슷하지만 용도는 다르다는 의미입니다. 프로젝트의 성격에 따라, 데이터의 활용도에 따라. 특징 타입을 구현할떠 구조체와 클래스둘중 하나를 선택해서 사용해야 합니다.
 
 애플은 가이드라인에서 다음조건중 하나 이상에 해당한다면 구조체를 사용하는 것을 권장한다 - Swift Programming Language Guide: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/
    • 연관된 간단한 값의 집합을 캡슐화하는 것만이 목적일 때
    • 캡슐화한 값을 참조하는 것보다 복사하는것이 합당할 때
    • 구조체에 저장된 프로퍼티가 값타입이며 참조하는 것보다 복사하는 것이 합당할때
    • 다른타입으로부터 상속받거나 자신을 상속한 필요가 없을때
    • 구조체로 사용하기에 가장 적합한 예로는 좌표계가 있습니다. x,y좌표등을 표현하고 싶을 때 Int타입으로 x,y프로퍼티를 생성할수 있으며, 물건의 크기를 표현하고자 할때는 부동 소수표현인 Double 또는 Float타입을 사용하여 width, height, depth등으로 묶어표현 해줄수 있다
 이런 몇가지 상황을 제외하면 클래스로 정의하여 사용합니다. 대다수 사용자 정의 데이터타입은 클레스로 구현한다.
 */
