"""
///연산자 Operator
"""
///할당연산자
/*
 더하기 연산자            a + b
 뺴기 연산자            a - b
 곱하기 연산자            a * b
 나누기 연산자            a / b
 나머지 연산자            a % b
 */
//나누기연산은 기존의 프로그레밍 언어처럼 나머지나 소수점을 지의한 징수 결과값으로 반환
"""
var result: Int = 5 / 3 //1
result = 10 / 3 //3
"""

///비교연산자
/*
 값이같다                  a == b
 값이 크거나 같아            a >= b
 값이 작거나 같다            a <= b
 값이 크다                 a > b
 값이 작다                 a < b
 값이 같지 같다             a != b
 참조가 같다               a === b
 참조가 같지 않다           a !== b
 패턴 매치                 a ~= b
 */

//나누기연산은 기존의 프로그레밍 언어처럼 나머지나 소수점을 지의한 징수 결과값으로 반환
"""
let valueA: Int = 3
let valueB: Int = 5
let valueC: Int = 5
let isSameValueAB: Bool = valueA==valueB
let isSameValueBC: Bool = valueB == valueC
let referenceA: SomeClass = Someclass()
let referenceB: SomeClass = SomeClass()
let referenceC: Someclass = reference

let isSameReferenceAB: Bool = referenceA === referenceB //false
let isSameReferenceAC: Bool = referenceA === referenceC //true
"""

///상향조건연산자
//상항조건연신자           Question?A:B            Question(볼리언값이참이면A를.거짓이면B를반활합니다.
var valueA: Int = 3
var valueB: Int = 5
var biggerValue: Int = valueA>valueB ? valueA: valueB           //5
valueA = 0
valueB = -3
biggerValue = valueA > valueB ? valueA : valueB                  //0
var stringA: String = ""
var stringB: String = "String"
var resultValue: Double = stringA.isEmpty ? 1.0 : 0.0           //1.0
resultValue = stringB.isEmpty ? 1.0 : 0.0                       //0.0

///범위연산자
"""
패쇄 범위 연산자         A...B            A부터 B까지의 수를 묶어 범위표현합니다. A와 B를 포함합니다.
반패쇄 범위 연산자         A..<B            A부터 B미만까지의 수를 묶어 범위표현합니다. A를 포함하고 B를 포함하지 않는다.
단방향 범위 연산자         A..             A이상의 수름 묶어 범위를 표현합니다. A를포함합니다.
단방향 범위 연산자         ..A             A이하의 수름 묶어 범위를 표현합니다. A를포함합니다.
단방향 범위 연산자         ..<A            A미만의 수름 묶어 범위를 표현합니다. A를포함합니다.
"""
