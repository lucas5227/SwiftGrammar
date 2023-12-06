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
/// 25-1 식별자 패턴 Identifier Pattern
식별자패턴은 변수 또는 상수의 이름에 알맞는 값을 어떤 값과 매치시키는 패턴을 말한다.
"""
///식별자 채턴의 사용
let someValue: Int = 52;
