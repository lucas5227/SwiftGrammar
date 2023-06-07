"""
///열거형_항목순회
"""
//단순한 열거형에는 CaseIterable 프로토콜을 채택해주는 것만으로 aliCases프로퍼티를 사용할수 있습니다. 그렇지만 조금 복잡해지는 열거형은 그렇지 않을수도 있습니다. 그대표적인예가플랫폼별로사용조건을추가하는경우입니다.

enum School: CaseIterable {
    case primary
    case elementary
    case middle
    case high
    case college
    case university
    case graduate
}

let allCases: [School] = School.allCases
print(allCases) //[School.primary, School.elementary, School.middle, School.high, School.college, School.university, School.graduate]


//available속성을통해특정케이스를플랫폼에따라사용할수있거나 없는경우가생기면Caserterable 프로토콜을 채택하는 것만으로는 aLICases 프로퍼티 를 사용할수 없습니다. 그럴때는 직접 a11Cases 프로퍼티를 구현해 주어야 합니다.이렇게 CaseIterable 프로토콜을 채택하여도 allCases 프로퍼티를바로 사용할수없는경우가 또있는데, 바로 열거형의 케이스가 연관값을 갖는 경우입니다.
enum School2: String, CaseIterable {
    case primary = "유치원"
    case elementary = "초등학교"
    case middle = "중학교"
    case high = "고등학교"
    case college = "대학"
    case university = "대학교"
    @available(iOS, obsoleted: 12.0)
    case graduate = "대학원"

    static var allCases: [School2] {
        let all: [School2] = [.primary,
                             .elementary,
                             .middle,
                             .high,
                             .college,
                             .university]
    #if os(iOS)
    return all
    #else
    return all + [.graduate]
    #endif
    }
                  
}

let allCases2: [School2] = School2.allCases
print(allCases2)
//[School2.primary, School2.elementary, School2.middle, School2.high, School2.college, School2.university, School2.graduate]

//연관값을 갖는 열거형의 항목 순회
//직접 a11Cases프로퍼티를 구현해주었는데요. 처음 열거형을 정의하고 a11Cases를 구현한 이후에 케이스를 추가할 일이 생긴다면 꼭 잊지말고 a11Cases를 다시 살펴봐야한다.
enum PastaTaste: CaseIterable {
    case cream, tomato
}

enum PizzaDough: CaseIterable {
    case cheeseCrust, thin, original
}
enum PizzaTopping: CaseIterable {
    case pepperoni, chese, bacon
}
enum MainDish: CaseIterable {
    case pasta (taste: PastaTaste)
    case pizza(dough: PizzaDough, topping: PizzaTopping)
    case chiken(withSauce: Bool)
    case rice
    
    static var allCases: [MainDish] {
        return PastaTaste.allCases.map(MainDish.pasta)
        + PizzaDough.allCases.reduce([]) { (result, dough) -> [MainDish] in
            result + PizzaTopping.allCases.map{ (topping) -> MainDish in
                MainDish.pizza(dough: dough, topping: topping)
            }
        }
        + [true, false].map(MainDish.chiken)
        + [MainDish.rice]
    }
}

print(MainDish.allCases.count) // 14
print (MainDish.allCases) //모든 경우의 연관값을 갖는케이스 컬렉션
