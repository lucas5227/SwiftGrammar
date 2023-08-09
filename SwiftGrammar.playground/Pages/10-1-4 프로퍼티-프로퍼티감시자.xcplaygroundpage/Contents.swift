"""
///프로퍼티-프로퍼티 감시자 property observers
"""
/*
 프로퍼티 감시자를 사용하면 프로퍼티의 값이 변경됨에 따라 적절한 작업을 할수 있다.
 프로퍼티 감시자는 프로퍼티의 값이 새로 할당될 때마다 호출한다. 이떄 변경되는 값이 현재 값과 같더라도 호출한다.
 */
/// 프로퍼티 감시자
class Account {
    var credit: Int = 0 {
        willSet {
            print("잔액이 \(credit)원에서 \(newValue)원으로 변경됭 예정입니다.")
        }
        
        didSet {
            print("잔액이 \(credit)원에서 \(oldValue)원으로 변경되었습니다.")
        }
    }
}

let myAccount: Account = Account()
//잔액이 0원에서 1000원으로 변경됭 예정입니다.

myAccount.credit = 1000
//잔액이 1000원에서 0원으로 변경되었습니다..

/// 상속받은 연산 프로퍼티의 프로퍼티 감시자 구현
class Account2 {
    var credit: Int = 0 {
        willSet {
            print("잔액이 \(credit)원에서 \(newValue)원으로 변경됭 예정입니다.")
        }
        
        didSet {
            print("잔액이 \(credit)원에서 \(oldValue)원으로 변경되었습니다.")
        }
    }
    
    var dolloarValue: Double {  // 연산 프로퍼티
        get {
            return Double(credit) / 1000.0
        }
        
        set {
            credit = Int(newValue * 1000)
            print("잔액을 \(newValue)달러로 변경 중입니다.")
        }
    }
}

class ForeignAccount: Account2 {
    override var dolloarValue: Double {
        willSet {
            print("잔액이 \(credit)원에서 \(newValue)원으로 변경됭 예정입니다.")
        }
        
        didSet {
            print("잔액이 \(credit)원에서 \(oldValue)원으로 변경되었습니다.")
        }
    }
}

let myAccount2: ForeignAccount = ForeignAccount()
//잔액이 0원에서 1000원으로 변경됭 예정입니다.
myAccount2.credit = 1000
//잔액이 1000원에서 0원으로 변경되었습니다.

//잔액이 1000원에서 2.0원으로 변경됭 예정입니다.
//잔액이 1000원에서 2000원으로 변경됭 예정입니다.
//잔액이 2000원에서 1000원으로 변경되었습니다.

myAccount2.dolloarValue = 2         //잔액을 2.0달러로 변경 중입니다.
//잔액이 2000원에서 1.0원으로 변경되었습니다.
