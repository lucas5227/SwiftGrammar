"""
///컬렉션
"""
//배열Array,덕셔너리 dictionary, 세트set

///Array
var names: Array<String> = ["lucas", "hoo", "neo", "lucas"]
var names2: [String] = ["lucas", "neo", "hoo", "lucas"]

var emptyArray: [Any] = [Any]() //Any 데이터를 요소로 가지는 빈배열 생성
var emptyArray2: [Any] = Array<Any>()


// 배열의 타입을 정확히 명시해 줬다면 [1만으로도 빈배열을 생성할수 있습니다.
var emptyArray3: [Any] = []
print(emptyArray.isEmpty)
print(names.count)

print(names[1])
names[1] = "trinity"
print(names[2])
//print(names[4]) //err: Swift/ContiguousArrayBuffer.swift:600: Fatal error: Index out of range
//names[4] = "svan" //err: Swift/ContiguousArrayBuffer.swift:600: Fatal error: Index out of range
names.append("mouse")
names.append(contentsOf: ["morpheus","niobe"])

names.insert("oracle", at: 4)
names.insert(contentsOf: ["doger","tank"], at: 5)

print(names[4])
print(names.index(of: "lucas")) //0
print(names.index(of: "seraph")) //nil
print(names.first)
print(names.last)

let firstItem: String = names.removeFirst()
let lastItem: String = names.removeLast()
let indexSixItem: String = names.remove(at: 6)

print(firstItem)
print(lastItem)
print(indexSixItem)
print(names[1...3]) //범위연산자
print(names)
