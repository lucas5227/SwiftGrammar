"""
///프로토콜

프로토콜이란
프로토콜Potocal은 특정 역할을 하기 위한 메서드, 프로퍼티, 기타요구사항등의 청사진을 정의한다. 구조 체, 클래스, 열거형은 프로토콜을 채택해서 특정 기능을 실행하기 위한 프로토콜의 요구사항을 실제로 구현할 수 있다. 어떤 프로토콜의 요구사항을 모두 따르는 타입은 '해당 프로토콜을 준수한다'고 표현한다. 타입에서 프로토콜의 요구사항을 충족시키려면 프로토콜이 제시하는 청사진의 기능을 모두 구현해야한다. 즉, 프로토콜은 정의문하고 제시를 할 뿐이지 스스로 기능을 구현하지는 않는다.
"""

/**
 * 프 로 토콜 채 택
 * 프로토콜은 구조체, 클래스, 열거형의 모양과  비슷하게 정의할 수 있으며 protocol키워드를 사용한다
 *
 *  protocol 프로토콜 이름 {
 *      프로토콜 정의
 *      }
 *
 * 구조체, 클래스, 열거형등에서 프로토콜을 채택하려면 타입이름뒤에 콜론( : )을 붙여준후 채택할 프로토콜 이름을 쉼표(, )로 구분하여  명시 해준다.
 */
/*
/// 타입의 프로토콜 채택
struct SomeStruct: AProtocol , AnotherProtocol {
    // 구조체 정의
}

class SomeClass: AProtocol , AnotherProtocol {
    // 클래스 정의
}

enum SomeEnum: AProtocol , AnotherProtocol {
    // 열거형 정의
}

/// SuperClass를 상속받는 클래스의 프로토콜 채택
class SomeClass: SuperClass, AProtocol, AnotherProtocol {
    //클래스 정의
}
*/
