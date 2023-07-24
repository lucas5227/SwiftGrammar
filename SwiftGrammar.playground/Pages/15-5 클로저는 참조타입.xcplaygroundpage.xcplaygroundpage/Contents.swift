"""
///클로저는 참조타입 Closure is Referance Type
"""
/// 참조 타입인 클로저
let incrementByTwo: (() -> Int) = makeIncrementer(forIncrement: 2)
let sameWithIncrementByTwo: (() -> Int) = incrementByTwo

let first: Int = incrementByTwo()           //2
let second: Int = sameWithIncrementByTwo()  //4


/*
 ************************************************************
 ************************************************************
 ************************************************************
 */

func makeIncrementer (forIncrement amount: Int) -> (() -> Int) {
    var runningTotal = 0
    func incremeter() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incremeter
}
