"""
///중첩함수
"""
/// 원점으로 이동하기 위한 함수
typealias MoveFunc = (Int) -> Int

func goRgiht(_ currentPosition: Int) ->Int {
    return currentPosition + 1
}

func goLeft(_ currentPosition: Int) -> Int {
    return currentPosition - 1
}

func fuctionForMove(_ shouldGoLeft: Bool) -> MoveFunc {
    return shouldGoLeft ? goLeft : goRgiht
}

var position: Int = 3 // 현 위치

// 현위치가 0보다 크므로 전달되는 인자값은 true가 됩니다.
// 그러므로goLeft(_:) 합수가 한당됨
let moveToZero: MoveFunc = fuctionForMove(position > 0)
print("원점으로 갑시다.")

//원점에 도착하면(현위치가 0이면)반복문이 종료됩니다.
while position != 0 {
    print("\(position)... " )
    position = moveToZero(position)
}
print( "원점도착! " )
// 3..
// 2..
// 1..
// 원점도착!

///중첩함수의 사용
