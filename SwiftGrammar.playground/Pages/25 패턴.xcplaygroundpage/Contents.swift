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
    case let (let name, _, let gender) : print("Name: \(name), Age: \(age), Gender: \(gender)")
} //Name: lucas, Age:99, Gender: Male
