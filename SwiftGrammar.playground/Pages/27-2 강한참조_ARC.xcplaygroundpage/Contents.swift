"""
/// 27-2 강한참조 Strong Reference
인스턴스가 계속 해서 메모리에 남아 있어야 하는 명분을 만들어 주는 것이 바로 강한침조이다. 인스턴스는 참조 횟수가 0이 되는 순간 메모리에서 해지되는데, 인스턴스를 다른 인스턴스의 프로퍼티나 변수, 상수등에 할당할 때 강한 참조를 사용하면 참조횟수가 1증가한다. 또, 강한참조를 사용하는 프로퍼티, 변수, 상수등에 nil을 할당해 주면 원래 자신에게 할당되어 있던 인스턴스의 참조 횟수가 1감소한다. 참조의 기본은 강한 참조이므로 클래스 타입의 프로퍼티, 변수, 상수 등을 선언할 때 별도의 식별자를 명시하지 않으면 강한참조를 한다.지금끼자 선언한 식별자가 없는 프로퍼티, 변수, 상수는 강한 참조 였다.
"""
///강한탐조의 참조 횠수 확인
class Person {
    let name: String
    
    init (name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}

var regerence1: Person?
var regerence2: Person?
var regerence3: Person?

regerence1 = Person(name: "lucas")
//lucas is being initialized
//인스턴스의 참조 횟수: 1

regerence2 = regerence1         //인스턴스의 참조 횟수: 2
regerence3 = regerence1         //인스턴스의 참조 횟수: 3

regerence1 = nil         //인스턴스의 참조 횟수: 2
regerence2 = nil         //인스턴스의 참조 횟수: 1
regerence3 = nil         //인스턴스의 참조 횟수: 0
//lucas is being deinitialized

///강한참조 지여변수(상수)의 참조 횟수 확인
func foo() {
    let lucas: Person = Person(name: "lucas")            //lucas is being initialized
    //인스턴스 참조 횟수 : 1
    
    //함수 종료 시점
    //인스턴스의 탐조 횟수 : 0
    //lucas is being deinitialized
}
foo()

var globalReference: Person?

func foo_2() {
    let lucas: Person = Person(name: "lucas")            //lucas is being initialized
    //인스턴스 참조 횟수 : 1
    
    globalReference = lucas //인스턴스 참조 횟수 : 2
    
    //함수 종료 시점
    //인스턴스의 참조 횟수 : 1
}

"""
/// 27-2-1 강한참조 순황 문제
"""
