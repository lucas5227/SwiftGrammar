"""
/// 제네릭 함수
"""

///제네릭을 사용한 swapTwoValues(_:_:)함수
var numberOne: Int = 5
var numberTwo: Int = 10
func swapTwoValue<T>(_ a: inout T, _ b: inout T) {
    let temporaryA: T = a
    a = b
    b = temporaryA
}

swapTwoValue(&numberOne, &numberTwo)
print("\(numberOne), \(numberTwo)")         //10, 5

