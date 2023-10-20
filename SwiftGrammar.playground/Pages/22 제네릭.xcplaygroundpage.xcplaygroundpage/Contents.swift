"""
/// 제네릭
제네릭은 스위프트의 강력한 기능중 하나다. 제네릭을 이용해 코드를 구현하면 어떤 타입에도 유연하게 대응 할 수 있다. 또한 제네력으로 구현한 기능과 타입은 재사용하기도 쉽고, 코드의 중복을 줄일 수 있기에 깔끔하고 추상적인 표현이 가능하다.
스위프트 표준 라이브러리 또한 수많은 제네릭 코드로 구성되어 있다. 사실 우리는 지금까지 제네릭 기능을 수없이 사용하고 있었다. 예를 들어 Array , Dictionary, Set등의 타입은 모두 제네릭 컬렉션이다. Int나 String타입을 요소로 갖는 배열을 만들거나 그 외의 어떤 타입도 배열을 요소로 가질수 있었던 것은 모두 제네릭 덕분이다. 딕셔너리도, 세트도 마찬가지이다.
"""

"""
///제네릭을 사용하고자 할 때는제네릭이 필요한 타임 또는 메서드의 이름 뒤의 홀화살괄호 기호 ( <>) 사이에 제네릭을 위한 타임 매개변수를 씨주어 제네력을 사용할 것임을 표시한다.
제네릭을_사용하고자_하는_타입_이름 <타입_매개변수>
제네릭을_사용하고자_하는_함수_이름 <타입_매개변수> (함수의_매개변수...)
"""
///제네릭, 프로토콜, 서브 스크립트등 다양한 기능으로 구현된 Array타입 선언부
/*
public struct Array<Element> : RandomAccessCollection, MutableCollection {
    public typealias Index = Int
    public typealias Iterator = IndexingIterator<Element>
    //중략...
    public var startIndex: Int { get }
    public var endIndex: Int { get }
    //중략...
    public subsript(index: Int) -> Element
    public subscript(bounds: Range<Int>) -> ArraySlice<Element>
    //중략...
    public mutating func popLast() -> Element?
    //중략...
    public func map<T>( _ transform: (Element) throws -> T) rethrows -> [T]
    //중략...
    public var last: Element? { get }
    //중략...
    public func reduce<Result>(_ initialResult: Result, _ nextPartialResult: (Result, Element) throws -> Result) rethrows -> Result
}
*/

///전위 연산자 구현과 사용
prefix operator **

prefix func ** (value: Int) -> Int {
    return value * value
}

let minusFive: Int = -5
let sqrtMinusFive: Int = **minusFive

print(sqrtMinusFive)            //25

///프로토콜과 제네릭을 이용한 전위 연산자 구천과 사용
prefix operator ***

prefix func *** <T: BinaryInteger> (value: T) -> T {
    return value * value
}

let minusFive_2: Int = -5
let five_2: UInt = 5

let sqrtMinusFive_2: Int = ***minusFive_2
let sqrtFive_2: UInt = ***five_2

print(sqrtMinusFive_2)          //25
print(sqrtFive_2)               //25

///제네릭을 사용하지 않은 swapTwoints(_:_: )함수
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA: Int = a
    a = b
    b = temporaryA
}

var numberOne: Int = 5
var numberTwo: Int = 10

swapTwoInts(&numberOne, &numberTwo)
print("\(numberOne), \(numberTwo)")         //10, 5

///제네락을 사용하지 않은 SwapTwaStrings(_:_:) 함수
func swapTwoStrings(_ a: inout String, _ b: inout String) {
    let temporaryA: String = a
    a = b
    b = temporaryA
}

var stringOne: String = "A"
var stringTwo: String = "B"

swapTwoStrings(&stringOne, &stringTwo)

print("\(stringOne), \(stringTwo)")         //"B, A"


///제네릭을 사용하지 않은 swapTwoValues(_:_:) 합수
func swapTwoValues(_ a: inout Any, _ b: inout Any) {
    let tempraryA: Any = a
    a = b
    b = tempraryA
}

var anyOne: Any = 1
var anyTwo: Any = "Two"

swapTwoValues(&anyOne, &anyTwo)
print("\(anyOne), \(anyTwo)")           //Two, 1

anyOne = stringOne
anyTwo = stringTwo

swapTwoValues(&anyOne, &anyTwo)
print("\(anyOne), \(anyTwo)")                 //"A, B"
print("\(stringOne), \(stringTwo)")           //"B, A"

//swapTwoValues(&stringOne, &stringTwo)         //err Any 외 다른 타입의 전달인자 전달 불가
