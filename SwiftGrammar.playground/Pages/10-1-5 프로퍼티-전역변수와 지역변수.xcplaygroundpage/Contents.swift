"""
///프로퍼티-전역변수와 지역변수 Global and Local Variables
"""
/*
 전역변수 또는 전역상수는 지연저장 프로퍼티처럼 처음 접근할때 최초로 연산이 이루어집니다. 1ezy키워드를 사용하여 연산을 늦출 믿요가 없습니다. 반대로 지역변수 및 지역상수는 절대로 지연연산 되지 않습니다.
 */

///저징연수의 감시자와 연산변수
var wonInPocket: Int = 2000 {
    willSet {
        print("주머니의 돈이 \(wonInPocket)원에서 \(newValue)원으로 변경될 예정입니다.")
    }
    
    didSet {
        print("주머니의 돈이 \(oldValue)원에서 \(wonInPocket)원으로 변경되었습니다.")
    }
}

var dollarPocket: Double {
    get {
        return Double(wonInPocket) / 1000.0
    }
    
    set {
        wonInPocket = Int(newValue + 1000.0)
        print("주머니의 달러를 \(newValue)달러로 변경중입니다.")
    }
}

//주머니의 돈이 2000원에서 1003원으로 변경될 예정입니다.
//주머니의 돈이 2000원에서 1003원으로 변경되었습니다.
dollarPocket = 3.5 //주머니의 달러를 3.5달러로 변경중입니다.

