"""
///타입캐스팅 - Any,AnyObject의 타입캐스팅
"""
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
let coffee: Coffee = Coffee(shot: 1)
let myCoffee: Americano = Americano(shot: 1, iced: false)
let yourCoffee: Latte = Latte(flavor: "cafe", shot: 1)
let actingConstant:Latte = Latte(flavor: "cafe", shot: 1)


// Ant와 AnyObject를 사용하면 예기치 못한 오류가 발생할 확룰이 높아지므로 되도록이면 사용을 지양한다
///AnyObject의 타입 확인
func checkType(of item: AnyObject) {
    if item is Latte {
        print("item is Latte")
    } else if item is Americano {
        print("item is Americano")
    } else if item is Coffee {
        print("item is Coffee")
    } else {
        print("Unknwon Type")
    }
}

checkType(of: coffee)               //item is Coffee
checkType(of: myCoffee)             //item is Americano
checkType(of: yourCoffee)           //item is Latte
checkType(of: actingConstant)       //item is Latte

///Any의 타입캐스팅
func checkAnyType(of item: Any) {
    switch item {
    case 0 as Int:
        print("zero as an Int")
    case 0 as Double:
        print("zero as an Double")
    case let someInt as Int:
        print("an interger value of \(someInt)")
    case let someDoble as Double where someDoble > 0:
        print("a positive douvle value of \(someDoble)")
    case is Double:
        print("some other double value that I don't want to print")
    case let someString as String:
        print("a string value of \"\(someString)\"")
    case let (x, y) as (Double, Double):
        print("an (x, y) point at \(x), \(y)")
    case let latte as Latte:
        print(latte.description)
    case let stringConverter as (String) -> String:
        print(stringConverter("lucas"))
    default:
        print("something else : \(type(of: item))")
    }
}


checkAnyType(of: 0)                             //zero as an Int
checkAnyType(of: 0.0)                           //zero as an Double
checkAnyType(of: 42)                            //an interger value of 42
checkAnyType(of: 3.14159)                       //a positive douvle value of 3.14159
checkAnyType(of: -0.25)                         //some other double value that I don't want to print
checkAnyType(of: "hello")                        //a string value of "hello"
checkAnyType(of: (3.0, 5.0))                     //an (x, y) point at 3.0, 5.0
checkAnyType(of: yourCoffee)                     //1 shot(s) cafe latte
checkAnyType(of: coffee)                         //something else : Coffee
checkAnyType(of: { (name: String) -> String in "Hello, \(name)" })
//Hello, lucas












