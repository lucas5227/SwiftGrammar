"""
/// 22-6 제네릭 서브스크립트
제네릭 함수(메서드)를 수현할 수 있었던 것처럼 서브스크립트도 제네릭을 활용하여 타임에 큰 제한 없이 유연하게 구현할 수 있다. 물론 타입 제약을 사용하여 제네릭을 활용하는 타입에 제약을 줄 수도 있다.
"""



///Stack 구조체의 제네릭 서브스크립트 구현과 사용
/*
 Stack구조체의 익스텐션으로 서브스크립트를 주가했다.서브스크립트는 Indices라는 플레이스 홀더를 사용하여 매개변수를 제네릭하게 받아들일 수 있다. Indices는 Sequence프로토콜을 준수하는 타입으로 제약이 추가되어 있다. 또, Indices타입 Iterator의 Element타입이 Int타입이어야 하는 제약이 추가 되었다. 서브스크립트는이 Indices타입의 indices라는 매개 변수로 인텍스 값을 받을수 있다. 그 결과 indices 시퀀스의 인덱스 값에 해당하는 스택 요소의 값을 배열로 반환한다.
 */
extension Stack {
    subscript<Indices: Sequence>(indices: Indices) -> [ItemType]
    where Indices.Iterator.Element == Int {
        var result = [ItemType]()
        for index in indices {
            result.append(self[index])
        }
        return result
    }
}

var integerStack: Stack<Int> = Stack<Int>()
integerStack.append(1)
integerStack.append(2)
integerStack.append(3)
integerStack.append(4)
integerStack.append(5)

print(integerStack[0...2])          //[1, 2, 3]







/*-------------------------------------------------*//*-------------------------------------------------*//*-------------------------------------------------*/
/*-------------------------------------------------*//*-------------------------------------------------*//*-------------------------------------------------*/
/*-------------------------------------------------*//*-------------------------------------------------*//*-------------------------------------------------*/
protocol Container {
    associatedtype ItemType
    var count: Int { get }
    mutating func append(_ item: ItemType)
    subscript(i: Int) -> ItemType { get }
}

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
/*-------------------------------------------------*//*-------------------------------------------------*//*-------------------------------------------------*/
/*-------------------------------------------------*//*-------------------------------------------------*//*-------------------------------------------------*/
/*-------------------------------------------------*//*-------------------------------------------------*//*-------------------------------------------------*/
