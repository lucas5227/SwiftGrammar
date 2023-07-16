"""
///클로저 Closure
"""
/*
 클로저(Closure) 제네릭(Generics), 프로토콜(Protocol), 모나드(Monad) 등의 결합이 스위프트의 강점이다.
 함수는 클로저의 한 형태이며 변수나 상수가 선언된 위치에서 참조를 획득하고 저장할수 있다.
 클로저의 형태
 * 이름이 있으면서 어떤 값도 획득하지 않는 전역함수의 형태
 * 이름이 있으면서 다른 함수 내부의 값을 획득할 수 있는 중첩된 함수의 형태
 * 이름이 없고 주변 문맥에 따라 겂을 획들할 수 있는 축약 문법으로 작성한 형태
 
 클로저의 다양한 표현
 * 클로저는 매개변수와 반환 값의 타입을 문맥을 통해 유추할 수 있기 때문에 매개벼ㅑㄴ수와 반환 값의 타입을 생략할 수 있다.
 * 클로저에 단 한 룰의 표현만 들어있다면 암시적으로 이를 반환 겂으로 취금한다.
 * 축약된 전달인자 이름을 사용할 수 있다.
 * 후행 클로저 문법을 사용할 수 있다.
 */

"""
13-1 기본 클로저
"""
///스위프트 라이브러리의 sorted(by:) 메서드 정의
///전달인자를 함수로 보냄
/*
public func sorted(by areInIncreasingOrder: (Element, Element) -> Bool) -> [Element]
*/
///정렬에 사용됨 이름배열
let names: [String] = ["lucas", "neo", "trinity", "oracle", "morpheaus"]

///정렬을 위한 함수 전달
func backwards(first: String, second: String) -> Bool {
    print("\(first) \(second) 비교중")
    return first > second
}

let reversed: [String] = names.sorted(by: backwards)
print(reversed) //["trinity", "oracle", "neo", "morpheaus", "lucas"]

"""
{ (매개변수들) -> 반환타입 in
    실행코드
}
"""

/// sorted(by:) 매서드에 클로저 전달
// backwards(first:secone:) 함수 대신에 sorted(by:) 메서드와 전달인자로 클로저를 직접 전달한다.
let reversed2: [String] = names.sorted (by: { (first: String, second: String) -> Bool in
    return first > second
})
print(reversed2) //["trinity", "oracle", "neo", "morpheaus", "lucas"]
