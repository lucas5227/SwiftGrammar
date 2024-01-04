"""
/// 27-3 약한참조_ARC Week Referance
약한찰조는 강한참조와 달리 자신이 참조하는 인스턴스의 참조횟수를 증가시키지 않는다. 참조타입의 프로퍼티나 번수의 선언 앞에 weak 키워드를 써주면 그 프로퍼티나 변수는 자신이 참조하는 인스턴스를 약한 참조한다.
약한참조를 사용한다면 자신이 참조하는 인스턴스가 메모리에서 해제 될 수도 있다는 것을 예상해블 수 있어야 한다.자신이 참조 횟수를 증가 시키지 않았기 때문에 그 인스턴스를 강한참조 하던 프로퍼티나 변수에서 참조 횟수를 감소시켜 0으로 만들면 자신이 참조하던 인스턴스가 메모리에서 해제되기 때문이다.

+ 약한참조와 상수, 옵셔널
약간참조는 상수에서 쓰일 수 없다. 만약 자신이 참조하던 인스턴스가 메모리에서 해제된다면 nil이 할당될 수 있어야 히기 때문이다. 그래서 약한 참조를 할때는 자신의 깊을 변경할 수 있는 변수로 선언해야 한다. 더불어 nil이 할당될 수 있어야 히므로 약인질소는 항상 을서널이어야 한다. 죽, 흡서널 변수인 약한참조를 할 수 있다
"""
/// 강한참조 수환 문제를 약한참조로 해결
class Room {
    let number: String
    
    init(number: String) {
        self.number = number
    }
    
    week var host: Person?
    
    deinit {
        print("Room \(number) is being deinitialized")
    }
}

var lucas: Person? = Person(name: "lucas") // Person 인스턴스의 참조 회수 : 1
var room: Room? = Room(number: "638")       // Room 인스턴스의 참조 횟수 : 1

room?.host = lucas          //Person 인스턴스의 참조 횟수 : 1
lucas?,room = room          //Room 인스턴스의 참조 횟수 : 2
// lucas is being deinitialized
print(room?.host)           //nil

room = nil          //Room 인스턴스의 참조 횟수 : 0
//Room 638 is being deinitialized
/***/
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

