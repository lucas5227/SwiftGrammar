"""
///사용자 정의 연산자_후위 연산자
"""
postfix operator **
postfix func ** (value: Int) -> Int {
    return value + 10
}

let five: Int = 5
let fivePlusTen = five**

print(fivePlusTen) //15

//전위 연산자와 후위 연산자 동시사용

prefix operator **
postfix operator <>
prefix func ** (value: Int) -> Int {
    return value * value
}
postfix func <> (value: Int) -> Int {
    return value + 3
}
let seven: Int = 7
let sqrtSevenPlusTen: Int = **seven<>
print(sqrtSevenPlusTen) // (3+7)*(3+7) == 100
