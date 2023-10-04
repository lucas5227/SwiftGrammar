"""
///프로토콜 - 프로토콜 변수와 상수
프로토콜은 프로토콜 이름만으로 자기 스스로 인스턴스를 생성하고 초기화 할 수는 없다.
"""
///프로토콜 타입 변수
var someNamed: Named = Animal(name: "Animal")
someNamed = Pet(name: "Pet")
someNamed = Person(name: "Person")
someNamed = School(name: "School")

//-------------------------------------------------//
protocol Named {
    var name: String { get }
    
    init?(name: String)
}

struct Animal: Named {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

struct Pet: Named {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

class Person: Named {
    var name: String
    
    required init(name: String) {
        self.name = name
    }
}

class School: Named {
    var name: String
    
    required init?(name: String) {
        self.name = name
    }
}
//-------------------------------------------------//
