"""
/// where 절 Generic Where
스위프트의 where절은 특징 패턴과 결합하여 조건을 추가하는 역할을 한다. 조건을 더 추가하고 싶을때,  특정 타입에 제한을 두고 싶을 때 등등 다양한 용도로 사용된다. 어디서든 필요할때마다 사용가능하다.
"""

"""
///26-1 where절의 확용
    * 패턴과 결합아혀 조건 추가
    * 타입에 대한 제약 추가
"""
///값 바인딩, 와일드카드 패턴과 where 절의 활용
let tuples: [(Int, Int)] = [(1,2), (1,-1), (1,0), (0, 2)]

//값 바인딩, 와일드카드 패턴
for tuple in tuples {
    switch tuple {
    case let (x, y) where x == y: print("x == y")
    case let (x, y) where x == -y: print("x == -y")
    case let (x, y) where x > y: print("x > y")
    case let (1, _): print("x == 1")
    case let (_, 2): print("x == 2")
    default: print("\(tuple.0), \(tuple.1)")
    }
}
/*
 x == 1
 x == -y
 x > y
 x == 2
 */

var repeatCount: Int = 0
//값 바인딩 패턴
for tuple in tuples {
    switch tuple {
    case let (x, y) where x == y && repeatCount > 2: print("x == y")
    case let (x, y) where repeatCount < 2: print("\(x), \(y)")
    default: print("Nothing")
    }
    
    repeatCount += 1
}
/*
 1, 2
 1, -1
 Nothing
 Nothing
 */

let firstValue: Int = 50
let secondValue: Int = 30

//값 바인딩 패턴
switch firstValue + secondValue {
case let total where total > 100: print("total > 100")
case let total where total < 0: print("wrong value")
case let total where total == 0: print("zero")
case let total: print(total)
}           //80

///옵셔널 패턴과 where절의 활용
let arrayOfOptionalInts: [Int?] = [nil, 2, 3, nil, 5]

for case let number? in arrayOfOptionalInts where number > 2 {
    print("Found a \(number)")
}
//Found a 3
//Found a 5

///타입캐스팅 패턴과 where 절의 활용
let anyValue: Any = "ABC"

switch anyValue {
case let value where value is Int: print("value is Int")
case let value where value is String: print("value is String")
case let value where value is Double: print("value is Double")
default: print("Unknown type")
}

var things: [Any] = [Any]()

things.append(0)
things.append(0.0)
things.append(42)
things.append(3.14159)
things.append("hello")
things.append((3.0, 5.0))
things.append({ (name: String) -> String in "Hello, \(name)" })

for thing in things {
    switch thing {
    case 0 as Int:
        print("zero as a Int")
    case 0 as Double:
        print("zero as a Double")
    case let someInt as Int:
        print("an Infteger value of \(someInt)")
    case let someDouble as Double where someDouble > 0:
        print("a postive double value of \(someDouble)")
    case is Double:
        print("some other double value that I don't want to print")
    case let someString as String:
        print("a string value ot \"\(someString)\"")
    case let (x, y) as (Double, Double):
        print("an (x, y) point at \(x), \(y)")
    case let stringConverter as (String) -> String:
        print(stringConverter("Michael"))
    default:
        print("something else")
    }
}
//value is String
//zero as a Int
//zero as a Double
//an Infteger value of 42
//a postive double value of 3.14159
//a string value ot "hello"
//an (x, y) point at 3.0, 5.0
//Hello, Michael

///표현 패턴과 where 절의 활용
var point: (Int, Int) = (1, 2)

switch point {
case (0, 0): print("일정")
      case (-2...2, -2...2) where point.0 != 1: print("(\(point.0), \(point.1))은 원점과 가깝습니다.")
      default: print("point (\(point.0), \(point.1))")
}           //point (1, 2)

///where 절을 활용한 프로토콜 익스텐션의 프로토콜 준수 제약 추가
protocol SelfPrintable {
    func printSelf()
}

struct Person: SelfPrintable { }

extension Int: SelfPrintable { }
extension UInt: SelfPrintable { }
extension String: SelfPrintable { }
extension Double: SelfPrintable { }

extension SelfPrintable where Self: FixedWidthInteger, Self: SignedInteger {
    func printSelf() {
        print("FixedWidthInteger와 SignedInteger을 준수하면서 SelfPrintable을 준수하는 차입 \(type(of:self))")
    }
}

extension SelfPrintable where Self: CustomStringConvertible {
    func printSelf() {
        print("CustromStringConvertalbe을 준수하면서 SlefPrintable을 준수하는 타입 \(type(of: self))")
    }
}
extension SelfPrintable {
    func printSelf() {
        print("그 외 SelfPrintable을 준수하는 타입 \(type(of: self))")
    }
}

//FixedWidthInteger와 SignedInteger을 준수하면서 SelfPrintable을 준수하는 타입 Int
Int(-8).printSelf()

//CustomStringConbertible을 준수하면서 SelfPrintable을 준수하는 타입 String
String("lucas").printSelf()

//CustomStringConvertable을 준수하면서 SelfPrintable을 준수하는 타입 Double
Double(8.0).printSelf()

//그 외 SelfPrintable을 준수하는 타입 Person
Person().printSelf()

///where 절을 활용한 타입 매개변수와 연관 차입의 차입 제약 추가
//타입 매개변수 T가 BinaryInteger 프로토콜을 준수하는 타입
func doubled<T>(integerValue: T) -> T where T: BinaryInteger {
    return integerValue * 2
}

//위 함수와 같은 표현입니다.
func doubled<T: BinaryInteger>(integerValue: T) -> T {
    return integerValue * 2
}

//타입 매개변수 T와 U가 CustomStringConvertible 프로토콜을 준수하는 타입
func prints<T, U>(first: T, second: U) where T: CustomStringConvertible, U:
CustomStringConvertible {
    print(first)
    print(second)
}

//위 함수와 같은 표현
func prints_2<T: CustomStringConvertible, U:
                    CustomStringConvertible>(first: T, second: U) {
    print(first)
    print(second)
}

//타입 매개변후 S1과 S2가 Sequence 프로토콜을 준수하며
//S1과 S2가 준수하는 프로토콜인 Sequence 프로토콜의 연관 타입인 Element가 같은 타입
func compareTwoSequences<S1, S2>(a: S1, b: S2) where S1: Sequence,
S1.Element: Equatable, S2: Sequence, S2.Element: Equatable {
    //...
}

//프로토콜의 연관 차입에도 타입 제앾을 줄 수 있다.
protocol Container {
    associatedtype ItemType where ItemType: BinaryInteger
    var count: Int { get }
}
//위 표현과 같은 표현이다.
protocol Container where ItemType: BinaryInteger {
    associatedtype ItemType
    var count: Int { get }
    
    mutating func append(_ item: ItemType)
    subscript(i: Int) -> ItemType { get }
}

///where 절을 활용한 제네릭 타입의 연관 타입 제약 추가
protocol Talkable { }
protocol CallToAll {
    func callToAll()
}

struct Person_2: Talkable { }
struct Animal { }

extension Array: CallToAll where Element: Talkable {
    func callToAll() { }
}

let people: [Person_2] = []
let cats: [Animal] = []

people.callToAll()
// cats.callToAll()
