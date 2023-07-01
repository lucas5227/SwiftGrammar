"""
///프로퍼티-저장 프로퍼티
"""
/*
 프로퍼티는 인스턴스의 변수 또는 상수를 의미한다.
 프로퍼티의 값이 변하는 것을 감시하는 프로퍼티 감시지도 있다. 프로퍼티 감시자는 프로퍼티의 값이 변할때 값의 변화에 따른 특정작업을 실행합니다. 프로퍼티 감시자는 저장프로퍼티에 적용할수 있으며 부모클래스로부터 상속 받을수 있습니다.
 */

/*
 저장 프로퍼티
 
 클래스 또는 구조체의 인스턴스와 연관된 값을 저장하는 가장 단순한 개념의 프로퍼티입니다. 저장 프로퍼티는 var 키워드를 사용하면 변수 저장프로퍼티 Let 키워드를 사용하면 상수 저장 프로퍼티가 된다.
 저장 프로퍼티를 정의할때 프로퍼티 기본값*과 초깃값을 지정해줄 수 있다
 */

///저장 프로퍼티의 선언 및 인스턴스 생성
//좌표

struct CoordinatePoint {
    var x: Int          //저장 프로퍼티
    var y: Int          //저장 프로퍼티
}

//구조페에는 기본적으로 저장 프로퍼티를 매개변수로 갖는 이니셜라이저가 있다.
let lucasPoint: CoordinatePoint  = CoordinatePoint(x: 10, y: 5)

//사람의 위치 정보
class Position {
    var point: CoordinatePoint
    //저장 츠로퍼티(변수) - dnlcl(point)는 변경될 수 없을을 뜻합니다.
    let name: String            //저장프로퍼티 (상수)
    
    //프로퍼티 기본값을 지정해주지 않는다면 이니셜라이저를 따로 정의해주어야 합니다.
    init(name: String, currentPoint: CoordinatePoint) {
        self.name = name
        self.point = currentPoint
    }
}

//사용자 정의 이니셜라이저를 호출해야만 한다.
//그렇지 않으면 프로퍼티 초깃값을 할당할 수 없기 때문에 인스턴스 생성이 불가능하다.
let lucasPosition: Position = Position(name: "lucas", currentPoint: lucasPoint)

///저장 프로퍼티의 초깃값 지정
//좌표
struct CoordinatePoint2 {
    var x: Int = 0          //저장 프로퍼티
    var y: Int = 0          //저장 프로퍼티
}

//프로퍼티의 토깃값을 할당했다면 굳이 전달인자로 초깃값을 넘길 필요가 없습니다.
let lucasPoint2: CoordinatePoint2  = CoordinatePoint2()

//물론 기존에 초깃값을 할당할 수 있ㅁ는 이니셜라이저도 사용 가능하다.
let neoPoint: CoordinatePoint2 = CoordinatePoint2(x:10, y:5)

print("lucas's point : \(lucasPoint2.x), \(lucasPoint2.y)")
//lucas's point : 0, 0

print("neo's point : \(neoPoint.x), \(neoPoint.y)")
//neo's point : 10, 5
 
//사람의 위치 정보
class Position2 {
    var point:  CoordinatePoint2 = CoordinatePoint2()       //저장프로퍼티 (상수)
    var name: String = "Unknown"                    //저장프로퍼티 (상수)
}

//초기값을 지정해줬다면 사용자 정의 이니셜라이저를 사용하지 않아도 된다.
let lucasPosition2: Position2 = Position2()

lucasPosition2.point = lucasPoint2
lucasPosition2.name = "lucas"

///옵셔널저장프로퍼티
//좌표
struct CoordinatePoint3 {
    //위치는 x, y 갑ㅈㅅ이 모드 있어야 하므로 옵셔널이면 안된다.
    var x: Int
    var y: Int
}

//tkfkadml dnlcl wjdqh
class Position3 {
    //현재 사람의 위치를 모를 수도 있다. -> 옵셔널
    var point: CoordinatePoint3?
    let name: String
    
    init(name: String) {
        self.name = name
    }
}

//이름은 필수지만 위티는 모를 수 있다.
let lucasPosition3 : Position3 = Position3(name: "lucas")

//위티를 알게되면 그 때 위치 값을 할당해준다.
lucasPosition3.point = CoordinatePoint3(x: 20, y: 10)
