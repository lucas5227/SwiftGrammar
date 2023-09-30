"""
///프로토콜 - 프로토콜조합과 프로토콜 준수 확인 SomeProtocol & AnotherProtocol
"""
///프로토콜 조합 및 프로토콩, 클래스 조합
protocol Named {
    var name: String { get }
}

protocol Aged {
    var age: Int { get }
}

struct Person: Named, Aged {
    var name: String
    var age: Int
}

class Car: Named {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

class Truck: Car, Aged {
    var age: Int
    
    init(name: String, age: Int) {
        self.age = age
        super.init(name: name)
    }
}

func celebrateBirthday(to celebrator: Named & Aged) {
    print("Happy birthday \(celebrator.name)! Now you are \(celebrator.age)")
}

let lucas: Person = Person(name: "lucas", age: 99)
celebrateBirthday(to: lucas)        //

let myCar: Car = Car(name: "Boong Boong")
//celebrateBirthday(to: myCar)        //err! Aged를 충족하지 못한다.

//err! 클래스 & 프로토콜 조합에서 클래스 타입은 한 타입만 조합할 수 있다.
//var someVariable: Car & Truck & Aged

//Car 클라스의 인스턴스 역할도 수행할 수 있고,
//Aged 프로토콜을 준수하는 인스턴스만 할당할 수 있다.
var someVariable: Car & Aged

//Truck 인스턴스는 Car 클래스 역할도 할 수 있고 Aged 프로토콜도 준수하므로 할당할 수 있다.
someVariable = Truck(name: "Truck", age: 5)

//Car의 인스턴스인 myCar는 Aged 프로토콜을 준수하지 않으므로 할당할 수 없다.
//err!
//someVariable = myCar

/**
 타입캐스팅에 사용하던 is와 as연산자를 통해 대상이 프로토콜을 준수하는지 확인할 수도 있고,  특정프로토콜로 캐스팅 할 수 있다
 */
print(lucas is Named)           //true
print(lucas is Aged)            //true

print(myCar is Named)           //true
print(myCar is Aged)           //false

if let castedInstance: Named = lucas as? Named {
    print("\(castedInstance) is Named")
}           //Person is Named

if let castedInstance: Aged = lucas as? Aged {
    print("\(castedInstance) is Aged")
}           //Person is Aged

if let castedInstance: Named = myCar as? Named {
    print("\(castedInstance) is Named")
}           //car is Named

if let castedInstance: Aged = myCar as? Aged {
    print("\(castedInstance) is Aged")
}           //notting print... casting failed

