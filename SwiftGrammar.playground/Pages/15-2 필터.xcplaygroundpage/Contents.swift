"""
///필터 Filter
"""
/*
 컨테이너 내부의 값을 걸려서 추출하는 역할을 하는 고차 함수
 맵과 마찬가지로 새로운 컨테이너에 값을 담아 반환해준다.
 
 filter 함수의 매개변수로 전달되는 함수의 반환 타입은 Bool 이ㅏㄷ.
 */

/// 필터메서드의 사용
let numbers: [Int] = [0, 1, 2, 3, 4, 5]

let evenNumbers: [Int] = numbers.filter{ (number: Int) -> Bool in
    return number % 2 == 0
}
print(evenNumbers) //[0, 2, 4]

let oddNumbers: [Int] = numbers.filter{ $0 % 2 == 1 }
print(oddNumbers)   //[1, 3, 5]

/// 맵과 필터 메서드의 연계 사용
let numbers2: [Int] = [0, 1, 2, 3, 4, 5]

let mappedNumbers: [Int] = numbers2.map{ $0 + 3 }

let evenNumbers2: [Int] = mappedNumbers.filter{ (number: Int) -> Bool in
    return number % 2 == 0
}
print(evenNumbers2)

// mappedNumbers를 굳이 여러 번 사용할 필요가 없다면 메서드를 체인처럼 연결하여 사용할 수 있다.
let oddNumbers2: [Int] = numbers.map{ $0 + 3 }.filter{ $0 % 2 == 1 }
print(oddNumbers2)   //[3,5,7]
