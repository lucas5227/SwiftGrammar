"""
/// 제네릭 타입 확장
만약 익스텐션을 통해 제네릭을 사용하는 타입에 기능을 추가 하고자 한다면 익스텐션 정의에 타입 매개변수를 명시하지 않아야 한다 대신 원래의 제네릭 정의에 명시한 타입 매개변수를 익스텐션에서 사용할 수 있다.
"""
struct Stack<Element> {
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    
    mutating func pop() -> Element {
        return items.removeLast()
    }
}

var doubleStack: Stack<Double> = Stack<Double>()
doubleStack.push(1.0)

var stringStack: Stack<String> = Stack<String>()
stringStack.push("1")

var anyStack: Stack<Any> = Stack<Any>()
anyStack.push(1.0)
anyStack.push("2")

///익스텐션을 통한 제네릭 타임의 기능 추가
extension Stack {
    var topElement: Element? {
        return self.items.last
    }
}

print(doubleStack.topElement)          //Optional(1.0)
print(stringStack.topElement)          //Optional("1")
print(anyStack.topElement)          //Optional("2")
