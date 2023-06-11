"""
///사용자 정의 연산자_전위 연산자
"""
//전위연산자 구현과 사용
prefix operator **
prefix func **(value: Int) -> Int{
        return value * value
}
let minusFive: Int = -5
let sartMinusFive: Int = **minusFive
print(sartMinusFive)

//전위연산자함수중복정의와사용


prefix func ! (value: String) -> Bool {
    return value.isEmpty
}

var stringValue: String = "lucas"
var isEmptyString: Bool = !stringValue
print(isEmptyString)            //false

stringValue = ""
isEmptyString = !stringValue
print(isEmptyString)            //true

//사용자정의 전위 연산자 함수 중복정의와 사용
//prefix operator ** 위에서 선언
prefix func ** (value: String) -> String {
    return value + " " + value
}

let resultString: String = **"lucas"

print(resultString) //lucas lucas

