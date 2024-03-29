"""
///타입캐스팅 - 데이터타입 확인
"""

/*
 타입 확인 연산자인 is를 사용하여 인스턴스가 어떤 클래스(혹은 어떤클래스의 자식 클래스)의 인스턴스인지 타입을 확인해볼수 있다. 타입 확인 연산자는 인스턴스가 해당 클래스의 인스턴스거나 그 자식 클레스의 인스턴스라면 true를 반환하 고, 그렇지 않다면 false를 반환한다. is연산자는 클래스의 인스턴스 뿐만 아니라 모든 데이터 타입에 사용 할 수 있다.
 */
///데이터 타입확인
class Coffee {
    let name: String
    let shot: Int
    
    var description: String {
        return "\(shot) shot(s) \(name)"
    }
    
    init(shot: Int) {
        self.shot = shot
        self.name = "coffee"
    }
}

class Latte: Coffee {
    var flavor: String
    
    override var description: String {
        return "\(shot) shot(s) \(flavor) latte"
    }
    
    init(flavor: String, shot: Int) {
        self.flavor = flavor
        super.init(shot: shot)
    }
}

class Americano: Coffee {
    let iced: Bool
    
    override var description: String {
        return "\(shot) shot(s) \(iced ? "iced" : "hot") americano"
    }
    
    init(shot: Int, iced: Bool) {
        self.iced = iced
        super.init(shot: shot)
    }
}
///
let coffee: Coffee = Coffee(shot: 1)
print(coffee.description)           //1 shot(s) coffee

let myCoffee: Americano = Americano(shot: 2, iced: false)
print(myCoffee.description)           //2 shot(s) hot americano

let yourCoffee: Latte = Latte(flavor: "green tea", shot: 3)
print(yourCoffee.description)            //3 shot(s) green tea latte

print(coffee is Coffee)            //true
print(coffee is Americano)         //false
print(coffee is Latte)             //false

print(myCoffee is Coffee)          //true
print(yourCoffee is Coffee)        //true

print(myCoffee is Latte)          //false
print(yourCoffee is Latte)        //true

///메타타입
protocol SomeProtocol { }
class SomeClass: SomeProtocol { }

let intType: Int.Type = Int.self
let stringType: String.Type = String.self
let classType: SomeClass.Type = SomeClass.self
let protocolProtocol: SomeProtocol.Protocol = SomeProtocol.self

var someType: Any.Type

someType = intType
print(someType)         //Int

someType = stringType
print(someType)         //String

someType = classType
print(someType)         //classType

someType = protocolProtocol
print(someType)         //someProtocol

/*
 인스턴스 self와 타입 self의 의미
 .self표친은 값 뒤에 써주면 그 값 자신을 타입 이름 뒤에 써주면 타입을 표현하는 값을 반환한다 "stringValue" 그 자체를 String.self는 String 타입을 나타내는 값이다.
 */
///t ype(of:) 함수와 .self의 사용
print(type(of: coffee) == Coffee.self)          //false
print(type(of: coffee) == Americano.self)          //true
print(type(of: coffee) == Latte.self)          //false

print(type(of: coffee) == Americano.self)            //false
print(type(of: myCoffee) == Americano.self)          //true
print(type(of: yourCoffee) == Americano.self)        //false

print(type(of: coffee) == Latte.self)            //false
print(type(of: myCoffee) == Latte.self)          //false
print(type(of: yourCoffee) == Latte.self)        //true
