"""
///클래스 class
"""
/*
 class 클래스 이름 {
    픠로퍼티와 메서드들
 }
 
 class 클래스 이름: 부모클래스 이름 {
    픠로퍼티와 메서드들
 }
 */

///Person 클래스 정의
class Person {
    var height: Float = 0.0
    var weight: Float = 0.0
}

"""
클래스를 정의한후, 인스턴스를 생성하고 초기화하고자 할때는 기본적인 이니셜라이저를 사용한다.
"""

///  Person 클래스의 인스턴스 생성 및 사용
var lucas: Person = Person()
lucas.height = 123.4
lucas.weight = 123.4

let neo: Person = Person()
neo.height = 123.4
neo.weight = 123.4

///Person클래스의 인스턴스 생성 및 소멸
class Person2 {
    var height: Float = 0.0
    var weight: Float = 0.0
    
    deinit {
        print("Person 클래스의 인스턴스가 소멸됩니다.")
    }
}

var lucas2: Person2? = Person2()
lucas2 = nil //Person 클래스의 인스턴스가 소멸됩니다.

