"""
///모나드 Monad 
"""
/**
 * 모나드 는 순서가있는연산을처리할때자주활용하는디자인패턴
 *
 * 모나드 조건
    * 타입을인자로받는타입( 특정타입의값을포장)
    * 특정타입의값을포장한것을반환하는함수(메서드)가존재
    * 포징된값을변환하여같은형태로포장하는한수(메서드)가존재
 * 제네력이 라는기능을 통해 구현할수 있다

    *
 */

"""
///16-1 컨텍스트
열거형 case의 연관값을 통해 인스턴스안에 연관 값을 갖는 형태입니다. 읍셔널에 값이 없다면 열거형의 .none case로, 값이 있다면 열거형의 .some(value) case로 값을 지니게 된다. 옵셔널의 값을 추출한다는 것은 열거형 인스턴스 내부의 .some(value) case의 연관값을 꺼내오는 것과 같다.
"""
///addThree 함수
func addThree(_ num: Int) -> Int {
    return num + 3
}

///옵셔널을 연산할 수 없는 addThree 함수
//addThree(Optional(2)) //오류발생!

"""
///16.2함수객체
"""
///맵 메서드를 사용하여 옵셔널을 연산할 수 있는 addThree() 함수
Optional(2).map(addThree) // Optional(5)

///옵셔널에 맵 메서드와 클로저의 사용
var value: Int? = 2
value.map { $0 + 3 } // Optional(5)
value = nil
value.map{ $0 + 3 } // nil(= Optional<int>.none)

///옵셔널의 map 메서드 구현
extension Optional {
    func map<U>(f: (Wrapped) -> U) -> U? {
        switch self {
            case .some(let x): return f(x)
        case .none: return .none
        }
    }
}
/*
 옵셔널의 map(_:) 메서드를 호출하면 옵셔널 스스로 값이 있는지 없는지 switch구문으로 판단한다. 값이있다면 전달받은 함수에 자신의 값을 적용 한결값을 다시 컨텍스트에 넣어 반환하고, 그렇지 않다면 함수를 실행하지 않고 빈 컨텍스트를 반환한다.
 */


"""
///16-3 모나드
"""
