"""
/// 제네릭 타입
제네릭 함수에 이어 제네릭 타입을 구현할 수도 있다. 제네릭 타입을 구현하면 사용자 정의 타입인 구조체, 클래스, 열거형 등이 어떤 타입과도 연관 되어 동작할수 있다. Array와 Dictionary 타입이 자신의 요소로 모든 타입을 대상으로 동작할 수 있는 것과 유사하다.

Stack이라는 제네릭 컬렉션 타입을 어떻게 만들어 가는지 확인한다. 스택은 배열과 유사하게 순서가 있는 값들의 모음이다. 배열은 중간중간 요소를 삽입하거나 삭제할 수 있지만, 스택은 컬렉션의 끝 부분에서만 요소를 추가하고 삭제할 수 있다. 추가를 푸시(push), 삭제를 팝(pop)이라한다.

"""

///제네릭올 사용하지 않은 IntStack구조체 타입
struct IntStack {
    var items = [Int]()
    mutating func push(_ item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
}

var integerStack: IntStack = IntStack()

integerStack.push(3)
print(integerStack.items)           //[3]

integerStack.push(2)
print(integerStack.items)           //[3, 2]

integerStack.push(3)
print(integerStack.items)           //[3, 2, 3]

integerStack.push(5)
print(integerStack.items)           //[3, 2, 3, 5]

integerStack.pop()
print(integerStack.items)           //[3, 2, 3]
