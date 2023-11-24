"""
///23-2 맵, 필터, 리듀스직접 구현 해보기 Implement Map, Filter, Reduce
"""
///Array 타입의 맵 사용
let items: Array<Int> = [1, 2, 3]

let mappedItems: Array<Int> = items.map { (item: Int) -> Int in return item * 10 }

print(mappedItems)          //[10, 20, 30]

/*
///Stack 구조체의 맵 메서드
//Stack 구조체의 맵 메서드
func map<T>(transform: (Element) -> T) -> Stack<T> {
    var transfomedStack: Stack<T> = Stack<T>()
    
    for item in items {
        transformedStack.items.append(transform(item))
    }
    
    return transfomedStack
}

////Stack 구조체 구현부 외부
var myIntStack: Stack<Int> = Stack<Int>()
myIntStack.push(1)
myIntStack.push(5)
myIntStack.push(2)
myIntStack.printSelf()          //[1, 5, 2]
var myStrStack: Stack<String> = myIntStack.map{ "\($0)" }
myStrStack.printSelf()          //["1", "5", "2"]
*/
