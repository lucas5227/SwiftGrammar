"""
///맵 Map
"""
/*
 맵 MaP은 자신을 호출할 때 매개변수로 전달된 함수를 실행하여 그 결과를 다시 반환해주는 함수이다. 스위프트에서 맵은 배열, 딕셔너리, 세트, 옵셔널등에서 사용할 수 있다. 조금 더 정확히 말하면 스위프트의 Sequence, Collection 프로토콜을 따르는 타입과 옵셔널은 모두 맵을 사용할 수 있다.
 맵을 사용하면 컨테이너가 담고 있던 각각의 값을 매개변수를 통해 받은 함수에 적용한후 다시 컨테이너에 포장하여 반환한다. 기존 컨테이너의 값은 변경되지않고 새로운 컨테이너가 생성되어반환된다. 그래서 맵은 기존 데이터를 변형하는데 많이 사용한다.
 */
/// for -in 구문과 맵 메서드의 사용 비교
let numbers: [Int] = [ 0, 1, 2, 3, 4]

var doubleNumbers: [Int] = [Int]()
var strings: [String] = [String]()

// for 구문 사용
for number in numbers {
    doubleNumbers.append(number * 2)
    strings.append("\(number)")
}

print(doubleNumbers)    //[0, 2, 4, 6, 8]
print(strings)          //["0", "1", "2", "3", "4"]

// map 메서드 사용
doubleNumbers = numbers.map({ (number: Int) -> Int in
    return number * 2
})
strings = numbers.map({ (number: Int) -> String in
    return "\(number)"
})

print(doubleNumbers)                //[0, 2, 4, 6, 8]
print(strings)                      //["0", "1", "2", "3", "4"]

///클로저 표현의 간략화
let numbers2: [Int] = [0, 1, 2, 3, 4]

// 기본 클로저 표현식 사용
var doubleNumbers2 = numbers2.map({ (number: Int) -> Int in
    return number * 2
})

//  매개변수 및 반환 타입 생략
doubleNumbers2 = numbers2.map({ return $0 * 2} )
print(doubleNumbers2)           //[0, 2, 4, 6, 8]

// 반확 키워드 생력
doubleNumbers2 = numbers.map({ $0 * 2} )
print(doubleNumbers2)           //[0, 2, 4, 6, 8]

// 후행 클로저 사용
doubleNumbers2 = numbers2.map { $0 * 2 }
print(doubleNumbers2)           //[0, 2, 4, 6, 8]

/// 클로저의 반복 사용
let evenNumbers: [Int] = [0, 2, 4, 6, 8]
let oddNumbers: [Int] = [0, 1, 3, 5, 7]
let multiplyTwo: (Int) -> Int = { $0 * 2 }

let doubledEvenNumbers = evenNumbers.map(multiplyTwo)
print(doubleNumbers)    //[0, 4, 8, 12, 16]

let dobledOddNumbers = oddNumbers.map(multiplyTwo)
print(doubleNumbers) //[0, 2, 4, 6, 8]

///다양한 컨테이너 타입에서의 맵의 활용
let alphabetDictionart: [String: String] = ["a":"A", "b":"B"]

var keys: [String] = alphabetDictionart.map { (tuple: (String, String)) ->
    String in
    return tuple.0
}

keys = alphabetDictionart.map{ $0.0 }

let values: [String] = alphabetDictionart.map { $0.1 }
print(keys)             //["b", "a"]
print(values)           //["B", "A"]

var numberSet: Set<Int> = [1, 2, 3, 4, 5]
let resultSet = numberSet.map{ $0 * 2 }
print(resultSet)        //[2, 4, 8, 10, 6]

let range: CountableClosedRange = (0...3)
let resultRange: [Int] = range.map{ $0 * 2 }
print(resultRange)          //[0, 2, 4, 6]
