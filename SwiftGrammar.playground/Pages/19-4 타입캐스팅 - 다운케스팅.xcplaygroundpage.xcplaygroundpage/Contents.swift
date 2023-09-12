"""
///타입캐스팅 - 다운케스팅
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

///Latte타입의 인스턴스를 참조하는 Coffee타입 actingConstant상수
let actingConstant: Coffee = Latte(flavor: "vanilla", shot: 2)
print(actingConstant.description)           //2 shot(s) vanilla latte
// actingConstant상수는 Coffee 인스턴스를 참조하도록 선언 했지만, 실제로는 Coffee타입인 척하는 Latte타입의 인스턴스를 참조하고 있다.
//다운 캐스팅이 클래스의 인스턴스에서만 사용하는 것은 아니다. Ary타입등에서 다른 타입으로 캐스팅할때도 다운캐스팅을 사용한다.


///다운캐스팅
let coffee = Coffee(shot: 1)
let myCoffee: Americano = Americano(shot: 2, iced: false)
let yourCoffee: Latte = Latte(flavor: "green tea", shot: 3)

if let actionOne: Americano = coffee as? Americano {
    print("This is Americano")
} else {
    print(coffee.description)
}
//1 shot(s) coffee

if let actionOne_2: Coffee = coffee as? Coffee {
    print("This is Just Coffee")
} else {
    print(coffee.description)
}
//This is Just Coffee

if let actionOne_3: Coffee = coffee as? Latte {
    print("This is Just Latte")
} else {
    print(coffee.description)
}
//1 shot(s) coffee

if let actionOne_4: Coffee = myCoffee as? Latte {
    print("This is Just Latte")
} else {
    print(coffee.description)
}
//This is Just Coffee

//Success
let castedCoffee: Coffee = yourCoffee as! Coffee

//runtime err!!! 강제 다운캐스팅 실패!
let castedAmericano: Americano = coffee as! Americano
// 1. as? if letactingone: Americano = coffee as? Americano만놓고보면"만약coffee가 참조하는 인스턴스가 Americano타입의 인스턴스라면 actingOne이라는 임시상수에 할당하라"로 해석할 수 있다.
// 2. as! let castedAmericano: Americano = coffee as! Americano는 "coff ee가 참조하는 인스턴스를 Americano타입으로 강제 변환하여 castedAmericano 상수에 할당하라. 뒷일은 책입지지 않는다"로 읽어볼수 있다.
// 3. 컴파일러가 다운캐스팅을 확신할 수 있는 경우에는 as?나 as! 대신 as를 사용할 수도 있다. 항상 성공하는것을 아는 경우는 캐스팅하려는 타입이 같은 타입이거나 부모 클래스타입이라는 것을 알때이다.

///항상 성공하는 다운캐스팅
// 항상 성공한다는 것을 컴파일러도 알고 있다.
let castedCoffee_2: Coffee = yourCoffee as Coffee

/**
 캐스팅은 실제로 인스턴스를 수정하거나 값을 변경하는 직업이 아니다. 인스턴스는 메모리에는 똑같이 남아있을뿐이다. 다만 인스턴스를 사용할 뗴 어떤 타입으로 다루고 어떤타입으로 접근하야 할지 판단할 수 있도록 컴퓨터에 힌트를 주는 것뿐이다.
 */
