"""
///열거형_순환열거형
"""
//열거형 항목의 연관값이 열거형 자신의 값이고자 할때 사용합니다. 순환열거형을 명시하고 싶다면 indirect키워드를 사용 특정항목에만 한정하고 싶다면 case키워드앞에 indirect를 붙이면되고, 열거형 전체에적용하 고싶다면 enum키워드 앞에 indirect 키워드를 붙이면됩니다.

//특정항목에순환열거형항목명시
enum ArithmeticExpression {
    case number(Int)
    indirect case addiction(ArithmeticExpression, ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
}

//열거형 전체에 순환 열거형 명시
indirect enum ArithmeticExpression2 {
    case number (Int)
    case addition(ArithmeticExpression2, ArithmeticExpression2)
    case multiplication(ArithmeticExpression2, ArithmeticExpression2)
}

//열거형에는 정수를 연관값으로 갖는 number라는 항목이 있고 덧셈을 위한 adition이라는 항목, 곱셈을 위한 multiplication 항목이있습니다. ArithmeticExpression열거형을 사용하여 (5+4) x 2 연산을 구현해보는 예제입니다.
let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addiction(five, four)
let final = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))

// evaluate는 ArithmeticExpression열거형의 계산을 도와주는 순환합수 입니다.
func evaluate(_expression: ArithmeticExpression) -> Int {
    switch expression {
    case .number(let value):
        return value
    case .addiction(let left, let right):
        return evaluate(left) + evaluate(right)
    case .multiplication(let left, let right):
        return evaluate(left) * evaluate(right)
    }
}

let result: Int = evaluate(final)
print("(5+4) * 2 = \(result)") //(5+4) * 2 = 18
