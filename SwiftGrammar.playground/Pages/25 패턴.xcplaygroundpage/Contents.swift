"""
///패턴 Pattern
"""
"""
/// 25-1 와일드카드 패턴
와일드카드패턴은 와일드카드 식별자(_)를 사용 한다는 것은 이 자리에 올것이 무엇이든간에 상관하지 마라는 뜻입니다. 즉, 와일드카드 식별자가 위치한 곳의 값은 무시한다. switch 구문에서 사용될 수도 있고, for-in구문에서도 사용할 수 있다.
"""
/// 와일드카드 패턴의 사용
let string: String = "ABC"

switch string {
    //ABC -> 어떤 값이 와도 상관없기에 항상 실행됩니다.
case _: print(string)
}

let optionalString: String? = "ABC"

switch optionalString {
    //optionalString이 Optional("ABC")일 때만 실행됩니다.
case "ABC"?: print(optionalString)
    
    //optionalString이 Optional("ABC") 외의 값이 있을 때만 실행된다.
case _?: print("Has value, but not ABC")
    
    //값이 없을 떄 실앻된다.
case nil: print("nil")
}
//OPtional("ABC")

let lucas = ("lucas", 99, "Male")

switch lucas {
    //첫번째 요소가 "lucas"일 때만 실행한다.
case ("lucas", _, _): print("Hello lucas!!!")
    
    //그 외 언제든지 실행된다.
case (_, _, _): print("Who cares~")
}
//Hello lucas!!!

for _ in 0..<2 {
    print("Hello")
}
//Hello
//Hello


"""
/// 25-2 식별자 패턴 Identifier Pattern
식별자패턴은 변수 또는 상수의 이름에 알맞는 값을 어떤 값과 매치시키는 패턴을 말한다.
"""
///식별자 채턴의 사용
let someValue: Int = 52;


"""
/// 25-3 바인딩 패턴 Value-Binding Pattern
값 바인딩 패턴은 변수 또는 상수의 이름에 매치된 값을 바인딩 하는 것이다. 값 바인딩 패틴의 일종인 식별자 패턴은 매칭되는 값을 새로운 이름의 변수또는 상수에 바인당한다. 예를 들어 튜플의 요소를 해체하여 그에 대응하는 식별자 패턴에 각각의 요소값을 바인딩하는 것이며 주고 switch 구문에서 많이 사용한다.
"""
///값 바인딩 패턴의 사용
let lucas2 = ("lucas", 99, "Male")

switch lucas2 {
    //name, age, gende를 lucas의 가각의 요소와 바인딩 한다.
    case let (name, age, gender) : print("Name: \(name), Age: \(age), Gender: \(gender)")
} //Name: lucas, Age:99, Gender: Male

switch lucas2 {
    case (let name, let age, let gender) : print("Name: \(name), Age: \(age), Gender: \(gender)")
} //Name: lucas, Age:99, Gender: Male

switch lucas2 {
    //값 바인딩 채턴은 와일드카드 채턴과 결합하여 우용하게 사용될 수도 있다.
    case (let name, _, let gender) : print("Name: \(name), Age: \(age), Gender: \(gender)")
} //Name: lucas, Age:99, Gender: Male

"""
///25.4 튜플 패턴 Tuple Pattern
튜플 패턴은 소괄호(()) 내에 쉼표로 분리하는 리스트이다. 튜플 패턴은 그에 사ㅇ응하는 튜플 타입과 값을 배치합니다. 예를 들어 let (x,t): (Int, Int) = (1, 2)와 같이 상수를 선언한다면 (x, y): (Int: Int) = (1, 2)와 같이 상수를 선언한다면 (x, y): (Int, Int)라고 사용된 튜플 패턴은 요소가 모두 Int 타입인 튜플하고만 매치된다는 뜻입니다. 튜플 패턴을 for-in 구문 또는 변수나 상수 선언에서 사용한다면 와일ㄷ카드 패턴, 식별자 채턴, 옵셔널 채턴, 또다른 튜플 패턴 등을 함께 사용할 수 있다.
"""
///튜플 패턴의 사용
let (a): Int = 2
print(a)            //2

let (x, y): (Int, Int) = (1, 2)
print(x)            //1
print(y)            //2

let name: String = "Jung"
let age: Int = 99
let gender: String? = "Male"

switch (name, age, gender) {
case ("Jung", _, _): print("Hello Jung!!!")
case (_, _, "Male"?): print("Who are tou man?")
default: print("I don't know who you are")
}   //Hello Jung!!!

let points: [(Int, Int)] = [ (0, 0), (1, 0), (1, 1), (2, 0), (2, 1)]

for (x, _) in points {
    print(x)
}
//0
//1
//1
//2
//2

"""
/// 열거형 케이스 패턴 Enumeration Case Pattern
열거형 케이스 패턴은 값을 열거형 타입의 Case와 매치시킨다. 열거형 케이스 패턴은 switch구문의 case레이블과 while, guard, for-in 구문의 case조건 에서 볼 수. 있다. 만약 연관값이 있는 열겨형 케이스와 매치하려고 한다면 열거형 케이스 패턴에는 반드시 튜플 패턴이 함께 해야한다.
"""

///열거형 케이스 패턴의 사용
let someValue_2: Int = 30

if case 0...100 = someValue_2 {
    print("0 <= \(someValue_2) <= 100")
}           //0 <= 30 <= 100

let anotherValue: String = "ABC"

if case "ABC" = anotherValue {
    print(anotherValue)
}           //ABC

enum MainDish {
    case pasta(taste: String)
    case pizza(dough: String, topping: String)
    case chicken(withSause: Bool)
    case rice
}

var dishes: [MainDish] = []

var dinner: MainDish = .pasta(taste: "크림")  //크림 파스타
dishes.append(dinner)

if case .pasta(let taste) = dinner {
    print("\(taste) 파스타")
}           //크림 파스타

dinner = .pizza(dough: "치즈크러스트", topping: "불고기")            //치즈크러스트 불고기 피자 만들기
dishes.append(dinner)

func whatIsThis(dish: MainDish) {
    guard case .pizza(let dough, let topping) = dinner else {
        print("Its not a Pizza")
        return
    }
    
    print("\(dough) \(topping) 피자")
}
whatIsThis(dish: dinner)            //치즈크러스트 불고기 피자

dinner = .chicken(withSause: true)          //양념 통닭 만들기
dishes.append(dinner)

while case .chicken(let sauced) = dinner {
    print("\(sauced ? "양념" : "후라이드)") 통닭")
    break
}           //양념 통닭

dinner = .rice          //밥
dishes.append(dinner)

if case .rice = dinner {
    print("오늘 저녁은 밥입니다.")
}           //오늘 저녁은 밥입니다.

for dish in dishes {
    switch dish {
    case let .pasta(taste): print(taste)
    case let .pizza(dough, topping): print(dough, topping)
    case let .chicken(sauced): print(sauced ? "양념" : "후라이드")
    case let .rice: print("Just 쌀")
    }
}
/*
 크림
 치즈크러스트 불고기
 양념
 Just 쌀
 */
