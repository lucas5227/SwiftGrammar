"""
///23-1 프로토콜 초기구현
익스텐션은 기존 타입의 기능을 확장하며, 프로토콜은 프로토콜을 채택한 타입이 원하는 기능을 강제로 구현해야한다. 그런데 특정 프로토콜을 정의하고 여러 타입에서 이프 로토콜을 준수하게 만들어 타입마다 똑같은 메서드, 프로퍼티, 서브 스크립트등을 구현해야 할때 익스텐션과 프로토콜의 결합을 사용한다.
"""

///익스텐션을 통한 프로토콜의 실제구현
protocol Receiveable {
    func received(data: Any, from: Sendable)
}

extension Receiveable {
    // 메세지를 수신한다.
    func received(data: Any, from: Sendable) {
        print("\(self) received \(data) from \(from)")
    }
}

//무언가를 발신할 수 있는 기능
protocol Sendable {
    var from: Sendable { get }
    var to: Receiveable? { get }
    
    func send(data: Any)
    
    static func isSendableInstance(_ instance: Any) -> Bool
}

extension Sendable {
    //발신은 발신 기능한 객채, 즉 Sandable 프로토콜릉 준수하는 타입의 인스턴스여야 한다.
    var from: Sendable {
        return self
    }
    
    //메세지를 발신한다.
    func send(data: Any) {
        guard let receiver: Receiveable = self.to else {
            print("Message has no receiver")
            return
        }
        
        //수신 가능한 인스턴스의 received 메소드를 호출한다.
        receiver.received(data: data, from: self.from)
    }
    
    static func isSendableInstance(_ instance: Any) -> Bool {
        if let sendableInstance: Sendable = instance as? Sendable {
            return sendableInstance.to != nil
        }
        return false
    }
}

//수신, 발신이 가능한 Message 클래스
class Message: Sendable, Receiveable {
    var to: Receiveable?
}

//수신, 발신이 가능한 Mail 클래스
class Mail: Sendable, Receiveable {
    var to: Receiveable?
}

//두 Message 인스턴스를 생성합다.
let myPhoneMessage: Message = Message()
let yourPhoneMessage: Message = Message()

//아직 수신받을 인스턴스가 없다.
myPhoneMessage.send(data: "Hello")          //Message has no receiver

// Message 인스턴스는 발신과 수신이 모두 가능하므로 메시지를 주고 받을 수 있다.
myPhoneMessage.to = yourPhoneMessage
myPhoneMessage.send(data: "Hello")          //Message received Hello from Message

//두 Mail 인스턴스를 생성합다.
let myMail: Mail = Mail()
let yourMail: Mail = Mail()

//아직 수신받을 인스턴스가 없다.
myMail.send(data: "Hi")          //Message has no receiver

// Message 인스턴스는 발신과 수신이 모두 가능하므로 메시지를 주고 받을 수 있다.
myMail.to = yourMail
myMail.send(data: "Hi")          //Mail received Hi from Mail

myMail.to = myPhoneMessage

myMail.send(data:"Bye")

Message.isSendableInstance("Bye")  //Message has no receiver

//String은 Sendavle 프로토콜을 준수하지 않는다.
Message.isSendableInstance("Hello")             //false

//Massage와 Mail은 Sendable 프로토콜을 준수한다.
Message.isSendableInstance(myPhoneMessage)      //true

//yourPhoneMessage는 to 프로퍼티가 설정되지 않아서 보낼 수 없는 상태
Message.isSendableInstance(yourPhoneMessage)       //false
Mail.isSendableInstance(myPhoneMessage)             //true
Mail.isSendableInstance(myMail)                     //true

///익스텐션을 통해 구현된 메서드 재정의
class Mail_2: Sendable, Receiveable {
    var to: Receiveable?
    
    func send(data: Any) {
        print("Mail의 send 메서드는 재정의되었습니다.")
    }
}
let mailInstance: Mail_2 = Mail_2()
mailInstance.send(data: "Hello")

///제네릭, 프로토콜, 익스텐션을 통한 재사용 가능한 코드 작성
protocol SelfPrintable {
    func printSelf()
}

extension SelfPrintable where Self: Container {
    func printSelf() {
        print(items)
    }
}

protocol Container: SelfPrintable {
    associatedtype ItemType
    
    var items: [ItemType] { get set }
    var count: Int { get }
    
    mutating func append(item: ItemType)
    subscript(i: Int) -> ItemType { get }
}

extension Container {
    mutating func append(item: ItemType){
        items.append(item)
    }
    
    var count: Int {
        return items.count
    }
    
    subscript(i: Int) -> ItemType {
        return items[i]
    }
}

protocol Popable: Container {
    mutating func pop() -> ItemType?
    mutating func push(_ item: ItemType)
}

extension Popable {
    mutating func pop() -> ItemType? {
        return items.removeLast()
    }
    
    mutating func push(_ item: ItemType) {
        self.append(item: item)
    }
}

protocol Insertable: Container   {
    mutating func delete() -> ItemType?
    mutating func insert(_ item: ItemType)
}

    extension Insertable {
        mutating func delete() -> ItemType? {
            return items.removeFirst()
        }
        
        mutating func insert(_ item: ItemType) {
            self.append(item: item)
        }
}

struct Stack<Element>: Popable {
    var items: [Element] = [Element]()
}

struct Queue<Element>: Insertable {
    var items: [Element] = [Element]()
}

var myIntStack: Stack<Int> = Stack<Int>()
var myStringStack: Stack<String> = Stack<String>()
var myIntQueue: Queue<Int> = Queue<Int>()
var myStringQueue: Queue<String> = Queue<String>()

myIntStack.push(3)
myIntStack.printSelf()          //[3]

myIntStack.push(2)
myIntStack.printSelf()          //[3, 2]

myIntStack.pop()
myIntStack.printSelf()          //[3]

myStringStack.push("A")
myIntStack.printSelf()          //["A"]

myStringStack.push("B")
myStringStack.printSelf()       //["A", "B"]

myStringStack.pop()             //"B"
myStringStack.printSelf()       //["A"]

myIntQueue.insert(3)
myIntQueue.printSelf()          //[3]

myIntQueue.insert(2)
myIntQueue.printSelf()          //[3, 2]

myIntQueue.delete()             //3
myIntQueue.printSelf()          //[2]

myStringQueue.insert("A")
myStringQueue.printSelf()       //["A"]

myStringQueue.insert("B")
myStringQueue.printSelf()       //["A", "B"]

myStringQueue.delete()
myStringQueue.printSelf()       //["B"]
