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
/**
 합수 객체 중에서 자신의 컨텍스트와 같은 컨텍스트의 형태로 맵핑할 수 있는 힘수 객체를 달한 함수 객체라고 함 . 모나드는 닫힌 함수 객체이다.
 함수객체는 포장된 값에 함수를 적용 할수 있다. 그래서 모나드도 컨텍스트에 포장된 값을 처리하여 포장된 값을 컨텍스트에 다시 반환하는 함수(맵)를 적용할 수 있다. 이 매핑의 결과가 합수 객체와 같은 컨텍스트를 반환하는 함수 객체를 모나드라고 할  수 있으며, 이런 맵핑을 수행하도록 플랫만이라는 메서드를 활용한다. 플랫맵은 맵과 같이 함수를 매개변수로 받고, 옵셔널은 모나드이므로 플랫맵을 사용할 수 있다.
 */
/// douvledEven(_:) 함수와 플랫맵의 사용
func doubledEven(_ num: Int) -> Int? {
    if num.isMultiple(of: 2) {
        return num * 2
    }
    return nil
}

Optional(3).flatMap(doubledEven) //nil( ==Oprional<Int>.none)


///맵과 컴팩트의 차이
let oprionals: [Int?] = [1, 2, nil, 5]

let mapped: [Int?] = oprionals.map { $0 }
let compacMapped: [Int] = oprionals.compactMap { $0 }

print(mapped)                       //[Optional(1), Optional(2), nil, Optional(5)]
print(compacMapped)                 //[1, 2, 5]

///중섭된 컨테이너에서 맵과 플랫맵(콤팩트맵)의 차이
let multipleContainer = [[1, 2, Optional.none], [3, Optional.none], [4, 5, Optional.none]]

let mappedMultipleContainer = multipleContainer.map{ $0.map{ $0 } }
let flatmappedMultipleContainer = multipleContainer.flatMap{ $0.flatMap{ $0 } }

print(mappedMultipleContainer)              //[[Optional(1), Optional(2), nil], [Optional(3), nil], [Optional(4), Optional(5), nil]]
print(flatmappedMultipleContainer)          //[1, 2, 3, 4, 5]

///플랫맵의 활용
func stringToInteger(_ string: String) -> Int? {
    return Int(string)
}

func integerToString(_ integer: Int) -> String? {
    return "\(integer)"
}

var optionalString: String? = "2"

let flattenResult = optionalString.flatMap(stringToInteger)
    .flatMap(integerToString)
    .flatMap(stringToInteger)

print(flattenResult)            //Optional(2)

let mappedResult = optionalString.map(stringToInteger)  // 더 이상 체인 연결 불가
print(mappedResult)         //Optional(Optional(2))

/// 옵셔널의 맵과 플랫맵의 정의
"""
func map<U>(_ trasform: (Wrapped) throws -> U) rethrows -> U?
func flatMap<U>(_ transform: (Wrapped) throws -> U?) rethrows -> U?
"""

///16. 12 옵셔널바인딩을통한연산


