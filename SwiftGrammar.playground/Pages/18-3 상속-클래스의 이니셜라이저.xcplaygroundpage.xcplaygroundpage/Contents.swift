"""
///클래스의 이니셜라이저 - 상속과재정의 initializor
"""
/**
 * 지정 이니셜라이저
 * init(매개변수들) {
 * 초기화 구문
 * }
 *
 * 편의 이니셜라이저
 * convenience init(매개변수들) {
 * 초기화 구문
 * }
 */

/**
 * 12-2 클래스의 초기화 위임
 * 1 . 자식클라스의지점이니살라이저는부모클래스의지정이니살라이저를반드시호출해야합니다.
 * 2 . 편의이니살라이저는자산을정의한물래스의다른이니셜라이저를반드시호촘해야합니다.
 * 3 . 편의이니셜라이저는궁극적으로는지정이니셜라이저를반드시호출해야합니다.
 * 누군가는 지정 아니셜라이저에게 초기화를 반드시 위임한다..
 * 편의 이니셜라이저는 초기화를 반드시 누군가에 위임한다..
 */
/**
 * 2단계 초기화
 * 1. 자식클래스의지정이니셜라이저가부모클래스의이니셜라이저를호출하기전에자신의프로퍼티를모두초 기화했는지확인합니다.
 * 2 .자식클래스의지정이니셜라이저는상속받은프로퍼티에값을할당하기전에반드시부모클래스의이니셜 라이저는호출해야합니다.
 * 3 .편의이니셜라이저는자신의클래스에정의한프로퍼티를포함하여그어떤프로퍼티라도값을할당하기전 에다른이니설라이저를호출해야합니다.
 * 4 .초기화1단계를마치기전까지는이니셜라이저는인스턴스메서드를호출할수없습니다. 또,인스턴스프로 퍼티의값을읽어들일수도없습니다. self프로퍼티를 자신의 인스턴스를 나타내는 값으로 활용할 수도 없습니다.
 *
 * [1단계]
 *   1. 클래스가 지정 또는 편의 이니셜라이저를 호출한다.
 *   2 .그 클래스의새로운인스턴스음위한메모리가할당됩니다. 메모리는아직초기화되지않은상태입니다.
 *   3 . 지정이니셜라이저는클래스에정의된모든저장프로퍼티에값이있는지확인합니다.현재클래스부분까지 의 저장프로퍼티를위한메모리는이제초기화되었습니다.
 *   4. 지정이니셜라이저는부모클래스의이니셜라이저가같은동작을행할수있도록초기화를양도합니다.
 *   5 . 부모클래스는상속체인을따라최상위클래스에도달할때끼지이직업을반복합니다.
 * [2단계]
 *  1. 최상위클래스로부터최하위클래스끼지상속체인을따라내려오면서지정이니셜라이저들이인스턴스를제 각각 사용자정의하게됩니다.이단계에서는 self를 통해 프로퍼티값을 수정할 수 있고, 인스턴스 메서드를 호출하는 등의 작업을 진행할수 있다.
 *  2 .마지막으로 각각의 편의이니셜라이저를 통해 self를 통한 사용자정의 작업을 진행할 수 있다.
 */

class Person {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

class Student: Person {
    var major: String
    
    init(name: String, age: Int, major: String) {
        self.major = "Swift"
        super.init(name: name, age: age)
    }
    
    convenience init(name: String) {
        self.init(name: name, age: 7, major: "")
    }
}

/**
 * 18- 3- 4 이니설 라이저 상속 및 재정의
 * 기본적으로스위프트의이니셜라이저는부모클래스의이니셜라이저를상속받지않습니다.부
 모콜래스로부터물려받은이니셜라이저는자식클래스에최적화되어있지않아서, 부모클래스 의 이니셜라이저를사용했을때자식클레스의새로운인스던스가완전하고정확하게초기화
 되지않는상황을방지하고자함입니다. 안전하고적절하다고만단되는특정한상황에서는부 모 클래스의이니셜라이저가상속되기도합 니다. 이는이니셜라이저자동상속( 18. 3. 5절) 에서 다루겠습니다. 보통부모클래스의이니셜라이저와똑같은이니셜라이저를자식클래스에서사용하고싶다면
 자 식클래스에서부모의이니셜라이저와똑같은이니셜라이저를구현해주면됩니다.
 부모클래스와등일한지정이니셜라이저를자식클래스에서구현해주려면재정의하면됩니다. 그러려면override수식어를붙여야합니다. 클래스에주어지는기본이니셜라이저를재정의 할때도마찬가지입니다. 자식클래스의편의이니셜라이저가부모클래스의지정이니셜라이저 들 재 정 의 하 는 경 우 에 도 o v e r r i d e 수 식 어 를 붙 여 줍 니 다.
 반 대로부모클래스의편의이니셜라이저와동일한이니셜라이저를자식클래스에구현할때는 o v e r r i d e 수 식 어 를 붙 이 지 않 습 니 다. 자 식 클 래 스 에 서 부 모 클 래 스 의 편 의 이 니 셜 라 이 저 는 절 대로호출할수없기때문입니다. 즉, 재정의할필요가없습니다.
 */
///글래스이니셜라이저의자정의
class Person_4 {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    convenience init(name: String) {
        self.init(name: name, age: 0)
    }
}

class Student_4: Person_4 {
    var major: String
    
    override init(name: String, age: Int) {
        self.major = "Swift"
        super.init(name: name, age: age)
    }
    
    convenience init(name: String) {
        self.init(name: name, age: 7)
    }
}

///실 패가능한이나셜라이저의재 정의
class Person_4_2 {
    var name: String
    var age: Int
    
    init() {
        self.name = "Unknown"
        self.age = 0
    }
    
    init?(name: String, age: Int) {
        return nil
    }
    self.name = name
    self.age = age
    
    init?(age: Int) {
        
        if age < 0 {
            return nil
        }
        self.name = "Unknown"
        self.age = age
    }
}

class Student_4_2: Person_4_2 {
    var major: String
    
    override init?(namle: String, age: Int) {
        self.major = "Swift"
        super.init(name: name, age: age)
    }
    
    override init(age: Int) {
        self.major = "Swift"
        super.init()
    }
}
