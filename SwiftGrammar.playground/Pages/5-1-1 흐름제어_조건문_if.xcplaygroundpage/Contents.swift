"""
///흐름제어_조건문_if
"""
///if 구문 기본구현
let first: Int = 5
let second: Int = 7

if first > second {
    print("first > second")
}else if first < second {
    print("first < second")
}else{
    print("first == second")
}
 
//print("first < second")

///if구문의다양한구현(소괄호가없는코드)
let first2 = 5
let second2 = 5
var biggerValue: Int = 5

if (first2 > second2) { //조건 수식을 소괄호로 묶어주는 것은 선택사항임
    biggerValue = first2
} else if (first2 == second2) {
    biggerValue = first2
} else if (first2 < second2) {
    biggerValue = second2
} else if (first2 == 5) {
    //조건을충족하더라도 이미 first sesecond라는 조건을 충족해 위에서 실행됨
    biggerValue = 100
}
//마지막 else는 생략가능
print(biggerValue) //5

///if구문의다양한구현(소괄호가 있는코드)
let first3 = 5
let second3 = 5
var biggerValue2: Int = 5

if first3 > second3 { //조건 수식을 소괄호로 묶어주는 것은 선택사항임
    biggerValue2 = first3
} else if first3 == second3 {
    biggerValue2 = first3
} else if first3 < second3 {
    biggerValue2 = second3
} else if first3 == 5 {
    //조건을충족하더라도 이미 first sesecond라는 조건을 충족해 위에서 실행됨
    biggerValue2 = 100
}
//마지막 else는 생략가능
print(biggerValue2) //5

