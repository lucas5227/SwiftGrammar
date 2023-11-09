"""
/// 22-5 프로토콜의 연관 타입
프로토콜을 정의할때 연관타입을 함께 정의하면 유용할때가 있다. 연관타입은 프로토콜에서 사용할 수 있는 플레이스 홀더 이름이다. 즉, 제네릭에서는 어떤 타입이 들어울지 모를 때, 타입 매개변수를 통해 종류는 알 수 없지만, 어떤 타입이 여기에 쓰일 것이다 라고 표현 해주었다면 연관 타입은 타입 매개변수의 그 역할을 프로토콜에서 수행할 수 있도록 만들어진 기능이다.
"""
///Container 프로토콜의 정의
/*
 Container프로토콜은 존재하지 않는 타입인 ItemType을 연관 타입으로 정의하여 프로토콜 정의에서 타입 이름으로 활용한다. 이는 제네릭의 타입 매개변수와 유사한기능으로,프로토콜 정의 내부에서 사용할 타입이 "그어떤것이어도상관없지만, 하나의 타입임은 분명하다라는 의미입니다. Container프로토콜을 준수하는 타입이 꼭 구현해야 할 기능을 명시하면
    • 컨테이너의 새로운 아이템을 apend(_:) 메서드를 통해 추가한 수 있어야한다.
    • 아이템 개수를 확인할 수 있도록 Int타입 값을 갖는 count 프로퍼티를 구현해야 한다.
    • Int 타입의 인덱스 값으로 특정 인텍스에 해당하는 아이템을 가져올 수 있는 서브스크립트를 구천해야 한다.
 이 세가지 조건을 충족한다면 Container프로토콜을 준수하는 타입이 될 수 있다. 그런데 생각해보면 컨테이너가 어떤 타입의 아이템을 저장해야 할지에 대해서 언급하지 않는다는 것을 알 수 있다.
 */
protocol Container {
    associatedtype ItemType
    var count: Int { get }
    mutating func append(_ item: ItemType)
    subscript(i: Int) -> ItemType { get }
}

///MyContainer 클래스 정의
class MyContainer: Container {
    var items: Array<Int> = Array<Int>()
    
    var count: Int {
        return items.count
    }
    
    func append(_ item: Int) {
        item.append(item)
    }
    
    subscript(i: Int) -> Int {
        return items[i]
    }
}

/// IntStack 구조체의 Container 프로토콜 준수
struct IntStack: Container {
    //기존 IntStack 구조체 구현
    var items = [Int]()
    mutating func puch(_ item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
    
    //Container 프로토콜 준수를 위한 구현
    mutating func append(_ item: Int) {
        self.puch(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Int {
        return items[i]
    }
}

/// IntStack 구조체의 typealias 사용
struct IntStack: Container {
    typealias ItemType = Int
    
    // 기존 IntStack 구조체 구현
    var items = [ItemType]()
    mutating func push(_ item: ItemType) {
        items.append(item)
    }
    mutating func pop() -> ItemType {
        return items.removeLast()
    }
    
    // Container 프로토콜 준수를 위한 구현
    mutating func append(_ item: ItemType) {
        self.push(item)
    }
    var count: ItemType {
        return items.count
    }
    subscript(i: ItemType) -> ItemType {
        return items[i]
    }
}

/// Stack 구조체의 Container 프로토콜 준수
struct Stack<Element>: Container {
    // 기존 Stack<Element> 구조체 구현
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
    
    // Container 프로토콜 준수를 위한 구현
    mutating func append(_ item: Element) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Element {
        return items[i]
    }
}
