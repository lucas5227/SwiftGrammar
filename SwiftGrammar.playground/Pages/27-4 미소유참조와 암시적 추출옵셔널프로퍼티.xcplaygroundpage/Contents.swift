"""
///27.5 미소유 참조와 암시적 추출 옵셔널 프로퍼티
약한 참조와 미소유 참조의 예제에서 강한참조순환 문제 두가지를 해결 해보았다.
강한참조순환문제에서 Person은 Room타입의 강한참조프로퍼티 room이있고, Room은 Person타입의 강한 참조 프로퍼티 host가 있었다. 또,Person타입의 변수 lucas와 Room타입의 번수 room에 nil을 할당할 수. 있었는데, 이 모두는 강한 참조순환문제가 발생할 가능성을 열어두는 것이다. 이 강한참조순환 문제는 약한참조를 통해 멋지게 해결할 수. 있었다.
미소유 참조 예제에서 CreditCard는 owner를 소유하지 않으면서, nil을 할당할 수 없는 미소유 참조 상수 프로퍼티를 사용함으로서 강한참조 순환문제를 해결해 볼 수 있다. 그런데 앞의 두 문제외에 또 다른 문제상황이 있다. 서로 참조해야하는 프로퍼티에 값이 꼭 있어야하면서도 한번 초기화되면 그 이후에는 nil을 할당할 수. 없는 조건을 갖추어야하는 경우이다.
"""

///미소유참조와 암시적 추출 옵셔널 프로퍼티의 활용
class Company {
    let name: String
    //암시적 추출 옵셔널 프로퍼티 (강한참조)
    var ceo: CEO!
    
    init(name: String, ceoName: String) {
        self.name = name
        self.ceo = CEO(name: ceoName, company: self)
    }
    
    func introduce() {
        ptint("\(name)의 CEO는 \(ceo.name)입니다.")
    }
}

class CEO {
    let name: String
    //미소유참조 상수 프로퍼티 (미소유 참조)
    unowned let company: Company
    
    init(name: String, company: Company) {
        self.name = name
        self.company = company
    }
    
    func introduce() {
        print("\(name)는 \(company.name)의 CEO입니다.")
    }
}

let company: Company = Company(name: "무한상사", ceoName: "김태호")
conpany.introduce()             //무한상사의 CEO는 김태호입니다.
company.ceo.introduce()         //김태호는 무한상사의 CEO입니다.
