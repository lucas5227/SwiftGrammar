"""
///빠른 종료 Early Exit
"""
/*
 핵심 키워드는 guard
 guard 구문은 if구문과 유사하게 Bool 타입의 값으로 동작하는 기능이다. guard 뒤에 따라붙는 코드의 실행결과가 true 일때 코드가 계속 실행된다. 1f 구문과는 다르게 guard 구문은 항상 else구문이 뒤에 따라와야 한다. 만약 guard뒤에 따라오는 Boal 값이 false라면 else의 블록 내부코드를 실행하게되는데, 이때 else구문의 블록 내부에는 꼭 자신보다 상위의 코드 블록을 종료하는 코드가 들어가게 된다. 그래서 특정 조건에 부합하지 않다는 관단이 되면 재빠르게 코드 블록의 실행을 종료
할수 있다. 이렇게 현재의 코드 블록을 종료할때는 return , break , continue , throw등의 제어문 전환 명령을 사용한다.또는 fatalError()와 같은 비반한함수나 메서드를 호출할수도 있다.
 */
"""
guard Bool 다입 값 else {
    예외사항 실행문
    제어문 전환 명령어
}
"""
/*
 guard 구문을 사용하면 코드를 훨씬 간결하고 읽기좋게 구성할수 있다 if구문을 사용하면 예외사항을 else 블록으로 처리해야 하지만 예외사항만을 처리하고 싶다면 guard 구문을 사용하는것이 훨씬 간편하다.
 */

///if 구문과 guard구문의 비교
///if
for i in 0...3 {
    if i == 2 {
        print(i)
    } else {
        continue
    }
}
///guard
for i in 0...3 {
    guard i == 2 else {
        continue
    }
    print(i)
}

///guard 구문의 옵셔널 바인딩 활용
func great(_ person: [String: String]) {
    guard let name: String = person["name"] else {
        return
    }
    
    print("Hello \(name)!")
    
    guard let location: String = person["location"] else {
        print("I hope the weather is nice near you")
        return
    }
    
    print("I hope the weather is nice in \(location)")
}

var personInfo: [String: String] = [String: String]()
personInfo["name"] = "Lucas"

great(personInfo)
//Hello Lucas!
//I hope the weather is nice near you

personInfo["location"] = "Korea"

great(personInfo)
//Hello Lucas!
//I hope the weather is nice in Korea

/// guard구문이 사용될 수 없는 경우
/*
 guard구문의 한계는 자신을 감싸는 코드블록, 즉return, break, continue, throw등의 제어문 전환명령어를 쓸 수 없는 상황이라면 사용이 불가능하다. 함수나 메서드, 반복문등 특정 블록 내부에 위치하지 않는다면 사용이 제한된다.
 
let first: Int = 3
let second: Int = 5

guard first > second else {
    // 여기에 들어올 제어문 전환 명령은 딱히 없다. err!
}
 */


