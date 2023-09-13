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

