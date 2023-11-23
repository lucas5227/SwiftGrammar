"""
///23-2 맵, 필터, 리듀스직접 구현 해보기 Implement Map, Filter, Reduce
"""
///Array 타입의 맵 사용
let items: Array<Int> = [1, 2, 3]

let mappedItems: Array<Int> = items.map { (item: Int) -> Int in return item * 10 }

print(mappedItems)          //[10, 20, 30]
