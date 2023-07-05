"""
///프로퍼티-타입 프로퍼티 Type Property
"""
/*
 저장 차입프로퍼티: 반드시 초기값 세팅, 지연연산, 다중스레드에서 한번만 초기화, lazy 사용안함
 연산 타입프로퍼티
 */

///타입 프로퍼티와 인스턴스 프로퍼티
class AClass {
    
    // 저장 차임 프로퍼티
    static var typeProperty: Int = 0
    
    // 저장 인스턴스 프로퍼티
    var instanceProperty: Int = 0 {
        didSet {
            // Self.typeProperty는
            // Aclass.typeProperty와 같은 표현입니다.
            Self.typeProperty = instanceProperty + 100
        }
    }
    
    //연산 타입 프로퍼티
    static var typeComputedProperty: Int {
        get {
            return typeProperty
        }
        
        set {
            typeProperty = newValue
        }
    }
}

AClass.typeProperty = 123

let classInstance: AClass = AClass()
classInstance.instanceProperty = 100

print(AClass.typeProperty) //200
print(AClass.typeComputedProperty) //200

///타입프로퍼티의사용 class Account{
class Account {
    
    static let dollarExchangeRate: Double = 1000.0 // 타입 상수
    
    var credit: Int = 0         // 저장 인스턴스 프로퍼티
    
    var dollorValue: Double {      // 연산 인스턴스 프로퍼티
        get {
//             Self.dollarExchagneRate는
//            Account.dollarExchangeRate와 같다.
            return Double(credit)
        }
        
        set {
//             Self.dollarExchangeRate는
//            Account.dollarExchangeRate와 같다
            credit = Int(newValue * Account.dollarExchangeRate)
            print("잔액을 \(newValue)달러로 변경 중입니다.")
        }
    }
}
