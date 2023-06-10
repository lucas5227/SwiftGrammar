"""
///연산자-종류 Operator
"""
///할당연산자 a = b
///산술연산자
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

///부울 연산자
"""
NOT(부정)부울연산자            !B           (볼리언값)의 참,거짓을 반전합니다
AND 부울연산자               A && B           A와 B의 불리언 AND논리연산을 실행합니다.
OR 부울연산자                A || B           A와 B의 불리언 OR 논리연산을 실행합니다.
"""

///비트연산자
"""
NOT(부정)비트연신자            ~A              A의 비트를 반전한 결과를 반환합니다.
AND비트연산자                A & B            A와 B의 비트AND논리연산을 실행합니다.
OR비트연산자                 A | B           A와 B의 비트OR논리연산을 실행합니다.
XOR비트연산자                A ^ B           A와 B의 비트XOR논리연산을 실행합니다.
비트아동연산자시프트연산자)      A >> B           A의 비트fmf B만큼 비트를 시프트(이동)합니다.
                         A << B
"""

///복합 할당 연산자
"""
A += B                      A와 B의 합을 A에 할당합니다.                                      A = A + B
A -= B                      A와 B의 차를 A에 한당합니다.                                      A = A - B
A *= B                      A와 B의 곱울 A에 할당합니다.                                      A = A * B
A /= B                      A를 B로 나눈값을 A에 합당합니다.                                   A = A / B
A %=B                       A를 B로 나눈 나머지들 A에 할당합니다.                               A = A % B
A <<= N                     A를 N만큼 오른쪽 비트시프트한값을 A에 할당합니다.                       A = A < N
A >>= N                     A를 N만큼 왼쪽 비트시프트한값을 A에 할당합니다.                         A = A \ N
A &= B                      A와 B의 비트 AND연산 결과를 A에 할당합니다.                           A = A & B
A != B                      A와 B의 비트 OR연산결과름 A에할당합니다.                              A = A | B
A ^= B                      A와 B의 비트 XOR연산결과들A에활당합니다.                              A = A ^ B
"""

///오버플로연산자
"""
오버플로더하기연산                   &+                  오버플로에 대비한 덧셈연산을 합니다.
오버플로 빼기연산                   &-                  오버플로에 대비한 별셈연산을 합니다.
오버몰로 곱하기연산                  &*                  오버플로에 대비한 곱셈연산을 합니다.
"""
/*
var unsignedInteger: UInt8 = 0
let errorUnderflowResult: UInt8 = unsignedInteger - 1     //런타임오류
let underflowedValue: UInt8 = unsignedIntegers - 1           //255

unsignedInteger = UInt8.max                                 //255
let errorOverflowResult: UInt8 = unsignedInteger + 1        //런타임오류
let overflowedValue2: UInt8 = unsignedIntegers &+ 1          //0
*/

///기타연산자
"""
nil 병합연산자                   A ?? B                  A가 nill이 아니면 A를 반환하고, A가 nill이면 B를 반환합니다.
부호변경연산자                    -A                      A(수)의 부호를 변경합니다.
옵셔널 강제추출연산자               O!                      O(옵셔널 개체)의 값을 강제로 추출합니다.
옵셔널 연산자                    V?                       V(울서널 값)을 안전하게 추출하거나. V(데이터 타입)가 올셔널임을 표현합니다.
"""
/*
 let valueInt: Int = someOptionalInt != nil ? someOptionalInt! : 0
  // 위코드와 같은 결과를 볼수 있지만 일씬 안전하게 옵셔널을 다를수 있습니다.
 let valueInt: Int = someOptionalInt ?? 0
  //참고로 읍셔널 강제추출 연산자 사용은 지망하는편이 좋습니다.
 */
 
