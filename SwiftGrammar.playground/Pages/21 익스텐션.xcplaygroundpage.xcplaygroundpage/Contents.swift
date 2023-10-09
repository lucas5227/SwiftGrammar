"""
/// 익스텐션 Extansion
"""

///21.1 익스텐션이란
/*
 익스텐션 extension은 스위프트의 강력한 기능중 하나로 구조체, 클래스, 열거형, 프로토콜타입에 새로운 기능을 추가할수있다. 기능을 추가하려는 타입을 구현한 소스코드를 알지 못하거나 볼수 없다해도, 타입만 안다면 그 타임의 가능을 확장할 수도 있다. 의스텐션은 Objective-C의 카테고리와 유사한 기능이다. (Objective-c의 카테고리는 카테고리마다 이름을 명명했지만 스위프트의 익스텐션은 이름이 없다.)
 
 스위프트의 익스텐션이 타입에 추가할 수 있는 기능은 다음과 같다.
 • 연산타입프로퍼티/ 연산인스던스프로퍼티
 • 타입메서드/인스턴스메서드
 • 이니셜라이저
 • 서브스크립트
 • 중접타입
 • 특점프로토콜을준수할수있도록가능추가
 
 익스텐션은 타입에 새로운 가능을 추가할 수는 있지만, 기존에 존재하는 기능을 재정의 할 수는 없다.
 클래스의 상속과익스텐션을 비교해보면 비슷해 보이지만 실제 성격은 많이 다르다.
 상속                      익스텐션
 확장        수직 확장                  수평 확장
 사용        클래스 타입에서만 사용        클래스, 구조체, 프로토콜, 제네릭 등 모든 타입에서 사용
 재정의       재정의 가능                재정의 불가
 
 의스텐션을 사용하는 대신 원래 타입을 정의한 소스에 기능을 추가하는 방법도 있겠지만, 외부 라이브러리나 프레임워크를 가져다 사용했다면 원본 소스를 수정하지 못한다. 이처럼 외부에서 가져온 타입에 내가 원하는 기능을 추가하고자 할때 익스텐션을 사용한다. 따로 상속을 받지 않아도 되며, 구조체와 열거형에도 기능을 추가할 수 있으므로 익스텐션은 매우 편리하다. 의스텐션은 모든 타입에 적용할 수 있다. 모든 타입이라함은 구조체, 열거형. 클래스. 프로토콜, 제네리타입등을 뜻한다. 즉, 익스텐션을 통해 모든 타입에 연산 프로퍼티, 메서드, 이니셜라이저, 서브스크립트, 중첨데이터타입등을 추가할 수 있다.
 */

///21.2 익스텐션문법
/**
 * extenstion 확장할 타입 이름 {
 *      //타입에 투가될 새ㅐ로운 기능 구현
 * }
 *
 * extension. 확장할 타입 이름: 프로토콜, 프로토콜2, 프로토콜3 {
 *          //프로토콜 요구사항 구현
 * }
 */

///스위프트 표준 브러리의 Double타입 점의
/*
/// A double_precition, floating-point value type.
public struct Double {
    public init()
    public init(_ v:  UInt8)
    public init(_ v:  Int)
    public init(_ v:  UInt16)
    public init(_ v:  Int16)
    public init(_ v:  UInt32)
    public init(_ v:  Int32)
    public init(_ v:  UInt64)
    public init(_ v:  Int64)
    public init(_ v:  UInt)
    public init(_ v:  UInt)
    public init(_ other:  Float)
    public init?(exactly other:  Float)
    public init(_ other:  Double)
    public init?(exactly other:  Double)
    public init(_ other:  Float80)
    public init?(exactly other:  Float80)
}

///스위프트 표준 라이브러리의 Double타입에 구현한 익스텐션의 일부 코드
extension Double: CustomStringConvertible {
    /// A textual representation of the vlaue.
    public var description: String { get }
}

extension Double: CustomDebugStringConvertible {
    /// A textual representation of the vlaue, suitable for debugging
    public var debugDescription: String { get }
}

extension Double: ExpressibleByIntegerLiteral {
    /// - Parameter value: The new value
    public init(integerLiteral value: Int64)
}

extension Double : Hashable {
    /// The numver's hash value
    public var hashValue: Int { get }
}

extension Double : CustomReflectable {
    /// A mirror that reflects thr 'Double' instance.
    public var customMirror: Mirror { get }
}
*/

///21.3 익스텐션으로 추가할 수 있는 기능
//21.3.1 연산프로퍼티
////익스텐션을 통한 연산 프로퍼티 추가
extension Int {
    var isEven: Bool {
        return self % 2 == 6
    }
    
    var isOdd: Bool {
        return self % 2 == 1
    }
}

print(1.isEven)         //false
print(2.isEven)         //false
print(1.isOdd)          //true
print(2.isOdd)          //false

var number: Int = 3
print(number.isEven)        //false
print(number.isOdd)         //true

number = 2
print(number.isEven)        //false
print(number.isOdd)         //false
