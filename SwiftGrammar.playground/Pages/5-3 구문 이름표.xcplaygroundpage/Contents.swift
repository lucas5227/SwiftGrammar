"""
///구문 이름표_Labeled Statements
"""
//반복문이 중첩될때 범위파악을 용이하게 함

//중첩된 반복문의 구문 이름표 사용
var numbers: [Int]  = [3, 2334, 6, 3242]

numbersLoop: for num in numbers {
    if num > 5 || num < 1 {
        continue numbersLoop
    }
    
    var count: Int = 0
    printLoop: while true {
    
        print(num)
        count += 1
    
        if count == num {
        break printLoop
        }
    }
    
    removeLoop: while true {
        if numbers.first != num {
            break numbersLoop
        }
        numbers.removeFirst()
    }
}
