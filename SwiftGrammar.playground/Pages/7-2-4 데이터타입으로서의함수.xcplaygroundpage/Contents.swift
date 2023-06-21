"""
///데이터 타입으로서의 함수
"""
/*
 (매개변수타입의나열) ->반환타입
 (Void) -> Void
 () -> Void
 () -> ()
 */

///함수타입의 사용
typealias CaluateTwoInts = (Int, Int) -> Int

func addTwoInts( _ a: Int, _ b: Int) -> Int {
    return a + b
}

func multiplyTwoInts( _ a: Int, _ b: Int) -> Int {
    return a * b
}

var mathFunction: CaluateTwoInts = addTwoInts

//var mathFunction: (Int, Int) -> Int = addTwoInts와 동일한 표현
print(mathFunction(2, 5)) //2 + 5 = 7

mathFunction = multiplyTwoInts
print(mathFunction(2, 5)) //2 * 5 = 19
"""
함수형프로그래밍에서특정로직에관여할함수의매개변수와반환타입은매우중요합니다. 타입별칭을통 해손쉽게함수를관리할수있으며매개변수와반 환타입만잘연계된다면굉장히훌륭한패턴을완성할수 있습니다. 이에관하여참고할만한국내서적으로는「거침없이배우는Swift,(지앤선.2015)가있습니다.
"""
///전달인자로함수를전달받는함수
func printMathResult(_ mathFunction: CaluateTwoInts, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a,b))")
}

printMathResult(addTwoInts, 3, 5) //Result: 8

/*
 전달인자레이블은함수타입의 구성요소가아니므로함수타입을작성할때는전달인자레이블을써줄수없 습니다.
 let somefunction: (Ins: Int, rhs: Int) -> Int      // 오류
 let someFunction:_( Is: Int, - rhs: Int) -> Int    // OK
 let someFunction: (Int, Int) -> Int                // OK
 */
