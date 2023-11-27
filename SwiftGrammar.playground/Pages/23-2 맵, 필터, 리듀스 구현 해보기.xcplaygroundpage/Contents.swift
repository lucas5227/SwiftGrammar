"""
///23-2 맵, 필터, 리듀스직접 구현 해보기 Implement Map, Filter, Reduce
"""

///Array 타입의 맵 사용
let items: Array<Int> = [1, 2, 3]

let mappedItems: Array<Int> = items.map { (item: Int) -> Int in return item * 10 }

print(mappedItems)          //[10, 20, 30]


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


///Array타입의 필터 사용
let filteredItems: Array<Int> = items.filter { (item: Int) -> Bool in return item % 2 == 0 }

/// Stack 구조체의 필터 메서드
////Stack 구조체 구현부
func filter(includeElement: (Element) -> Bool) -> Stack<Element> {
    var filteredStack: Stack<ItemType> = Stack<Element>()
    
    for item in items {
        if includeElemnet(item) {
            filteredStack.items.append(item)
        }
    }
    
    return filteredStack
}

/////Stack 구조체 구현부 외부
let filteredStack: Stack<Int> = myIntStack.filter { (item: Int) -> Bool in return item < 5 }

filteredStack.printSelf()       //[1, 2]


/// Array 타입의 리듀스 사용
let combinedItems: Int = items.reduce(0) { (Result: Int, next: Int) -> Int in return result + next }

print(combinedItems)            //6

let combinedItemsDoubled: Double = items.reduce(0.0) { (result: Double, next: Int) -> Double in return result + Double(next)
}

print(combinedItemsDoubled)          //6.0

let combinedItemsString: String = item.reduce("") { (result: String, itme: Int) -> String in return reslt + "\(next) "
}

print(combinedItemsString)          //"1 2 3 "

///Stack 구조체의 리듀스 메서드
////Stack 구조체의 구현부
func reduce<T>(_ initialResult: T, nextPartialResult: (T, Element) -> T) -> T {
    var result: T = initialResult
    
    for item in items {
        result = nextPartialResult(result, item)
    }
    
    return result
}

////Stack  구조체의 구현부 외부
let combinedInt: Int = myIntStack.reduce(100) { (result: Int, next: Int) -> Int in return result + next
}

print(combinedInt)  //108

let combinedDoubled: Double = myIntStack.reduce(100.0) { (result: Double, next: Int) -> Double in return result + Double(next)
}

print(combinedDoubled)

let combinedString: String = myIntStack.reduce("") { (result: String, next: Int) -> String in return result + "\(next) "
}

print(combinedString)           //"1 5 2 "
