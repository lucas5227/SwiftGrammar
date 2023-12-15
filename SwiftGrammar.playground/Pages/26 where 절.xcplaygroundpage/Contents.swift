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



