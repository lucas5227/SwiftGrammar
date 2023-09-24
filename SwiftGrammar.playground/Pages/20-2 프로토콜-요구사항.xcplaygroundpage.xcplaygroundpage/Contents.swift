"""
///프로토콜 - 요구사항
프로토콜은 타입이 특정 기능을 실행하기 위해 필요한 기능을 요구한다 프로토콜이 자신을 채택한 타입에 요구하는 사항은 프로퍼티나 메서드와 같은 기능들이다.
"""
//20-2-1 프로퍼티 요구
///프로퍼티요구
/**
 프로토콜의 프로퍼티 요구사항은 항상 var 키워드를 사용한 변수 프로퍼티로 정의한다. 읽기와 쓰기가 모두 가능한 프로퍼티는 프로퍼티의 정의 뒤에 { get set } 이라고 명시하며, 읽기 전용 프로퍼티는 프로퍼티의 정의 뒤에 { get }이라고 명시한다.
 
 SomeProtocol에 정의된 settableProperty는 읽기와 쓰기 모두를 요구했고,  notNeedToBeSettableProperty는 읽기만 가능하다면 어떻게 구현 되어도 상관 없다는 요구사항이다. 타입 프로퍼티를 요구하려면 static 키워드를 사용한다. 클래스의 타입 프로퍼티에는 상속 가능한 타입 프로퍼티인 cLass타입 프로퍼티와 상속 불가능한 static 타입 프로퍼티가 있지만 이 두타입 프로퍼티를 따로 구분하지 않고 모두 static 키워드를 사용하여  타입 프로 퍼티를 요구하면 된다. AnotherProtocol에 정의된 someProperty와 anotherProperty는 모두 타입 프로퍼티를 요구한다.
 */
protocol SomeProtocol {
    var settableProperty: String { get set }
    var notNeedToBoSettableProperty: String { get }
}

protocol AnotherProtocol {
    static var someTypePropoerty: Int { get set }
    static var anotherTypeProperty: Int { get }
}

/// Sendable프로토콜과 Sendable 프로토콜을 주수하는 Message와 Mail 클래스
protocol Sendable {
    var form: String { get }
    var to: String { get }
}

class Message: Sendable {
    var sender: String
    var form: String {
        return self.sender
    }
    
    var to: String
    
    init(sender: String, receiver: String) {
        self.sender = sender
        self.to = receiver
    }
}

class Mail: Sendable {
    var form: String
    var to: String
    
    init(sender: String, receiver: String) {
        self.form = sender
        self.to = receiver
    }
}

///Receiveable, Sendable프로토콜과 두 프로토콜을 준수하는 Message와 Mail클래스
//무언가를 발신할 수 있는 기능
protocol Receiveable_2 {
    func received(data: Any, from: Sendable_2)
}

protocol Sendable_2 {
    var from: Sendable_2 { get }
    var to: Receiveable_2? { get }
    
    func send(data: Any)
    
    static func isSendableInstance(_ instance: Any) -> Bool
}
//수신, 발신이 가능한 Message 클래스
class Message_2: Sendable_2, Receiveable_2 {
    //발신은 발신 가능한 객테, 즉 Sendavle 프로토콜을 준수하는 타입의 인스턴스여야 한다
    var from: Sendable_2 {
        return self
    }
    
    //상대방은 수신 가능한 객테, 즉 Receiveavle 프로토콜을 준수하는 타입의 인스턴스여야 한다.
    var to: Receiveable_2?
    
    //메세지를 발신한다.
    func send(data: Any) {
        guard let receiver: Receiveable_2 = self.to else {
            print("Message has no receiver")
            return
        }
        //수신 가능한 인스턴스의 receibed 메서드를 호출한다.
        receiver.received(data: data, from: self.from)
    }
    
    //메세지를 수신한다.
    func received(data: Any, from: Sendable_2) {
        print("Message receibed \(data) from \(from)")
    }
    
    //class 메서드이므로 상속이 가능하다.
    class func isSendableInstance(_ instance: Any) -> Bool {
        if let sendableInstance: Sendable_2 = instance as? Sendable_2 {
            return sendableInstance.to != nil
        }
        return false
    }
}

//수신, 발신이 가능한 Mail 클래스
class Mail_2: Sendable_2, Receiveable_2 {
    var from: Sendable_2 {
        return self
    }
    
    var to: Receiveable_2?
    
    func send(data: Any) {
        guard let receiver: Receiveable_2 = self.to else {
            print("Mail has no receiver")
            return
        }
        
        receiver.received(data: data, from: self.from)
    }
    
    func received(data: Any, from: Sendable_2) {
        print("Mail received \(data) from \(from)")
    }
    
    //static 메서드이므로 상속이 불가능하다.
    static func isSendableInstance(_ instance: Any) -> Bool {
        if let sendavleInstance: Sendable_2 = instance as? Sendable_2 {
            return sendavleInstance.to != nil
        }
        return false
    }
}

//두 Message 인스턴스를 생성한다.
let myPhoneMessage: Message_2 = Message_2()
let yourPhoneMessage: Message_2 = Message_2()

//아직 수신받을 인스턴스가 없다.
myPhoneMessage.send(data: "Hi")                     //Message has no receiver

//MESSAGE 인스턴스는 발신과 수신이 모두 가능하므로 메시지를 주고 받을 수 있다.
myPhoneMessage.to = yourPhoneMessage
myPhoneMessage.send(data: "Hello")                  //Message receibed Hello from Message_2

//두 Mail 인스턴스 생성
let myMail: Mail_2 = Mail_2()
let yourMail: Mail_2 = Mail_2()

myMail.send(data: "Hi")                             //Mail has no receiver

//Mail과 Message 모두 Sendable과 Receiveavle 프로토콜을 준수하므로
//서로 주고 받을 수 있다.
myMail.to = yourMail
myMail.send(data: "Hi")                             //Mail received Hi from Mail_2

myMail.to = myPhoneMessage
myMail.send(data: "Bye")                            //Message receibed Bye from Mail_2

//String은 Sendable 프로토콜을 준수하지 않는다.
Message_2.isSendableInstance("Hello")               //false

//Mail과 Message은 Sendable 프로토콜을 준수한다.
Message_2.isSendableInstance(myPhoneMessage)        //true

//yourPhoneMessage는 to 프로퍼티가 설정죄디 않아서 보낼 수 없는 상태이다.
Message_2.isSendableInstance(yourPhoneMessage)      //false
Mail_2.isSendableInstance(myPhoneMessage)           //true
Mail_2.isSendableInstance(myMail)                   //true


//20-2-3 가변메서드요구
//Resettable 프로토콜의 가변 메서드 요구
protocol Resettable {
    mutating func reset()
}

class Person: Resettable {
    var name: String?
    var age: Int?
    
    func reset() {
        self.name = nil
        self.age = nil
    }
}

struct Point: Resettable {
    var x: Int = 0
    var y: Int = 0
    
    mutating func reset() {
        self.x = 0
        self.y = 0
    }
}

enum Direction: Resettable {
    case east, west, south, north, unknown
    
    mutating func reset() {
        self = Direction.unknown
    }
}

//20-2-4 이니셜라이저 요구

