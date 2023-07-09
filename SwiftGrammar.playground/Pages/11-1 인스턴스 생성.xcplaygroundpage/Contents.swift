"""
///인스턴스-인스턴스 생성
"""
///클래스구조치, 열거형 의기본적인 형태의 이니셜라이저
class someClass {
    init() {
        // 초기화할 때 필요한 코드
    }
}

struct SomeStruct {
    init() {
        // 초기화할 때 필요한 코드
    }
}

enum SomeEnum {
    case someCase
    
    init() {
        // 열거형은 초디화할 때 반드시 case중 하나가 되어야 한다.
        self = .someCase
        // 초기화 할때 필요한 코드
    }
}

"""
11-1-1프로퍼티기본값
"""
/*
 구조체와 클래스의 인스틴스는 처음 생성할때 옵셔널 저장프로퍼티를 제외한 모든 저장 프로퍼티에 적절한 초깃값을 할당해야한다. 이니셜라이저가 실행될 때 저장 프로퍼티에 적절한 초깃값을 할당할 수 없다. 초기화후에 값이 확정되지 않은 저장 프로퍼티는 존재할수 없다. 프로퍼티를 정의할때 프로퍼티가 기본값을 할당하면 이니셜라이저 에서 따로 초깃값을 할당하지 않더라도 프로퍼티 기본값으로 저장 프로퍼티의 값이 초기화 된다.
 */
///Area 구조체와 이니셜라이저
struct Area {
    var squareMeter: Double
    
    init() {
        squareMeter = 0.0 // squareMeter의 초깃값 할당
    }
}

let room: Area = Area()
print(room.squareMeter) //0.0

///프로퍼티 기본값 지점
struct Area2 {
    var squareMeter: Double = 0.0 // vmfhvjxl rlqhsrkqt gkfekd
}

let room2: Area2 = Area2()
print(room2.squareMeter) //0.0

"""
11-1-2 이니셜라이저 매개변수
"""
struct Area3 {
    var squareMeter: Double
    
    init(fromPy py: Double) {                               // 첫 번째 이니셜라이저
        squareMeter = py * 3.3058
    }
    
    init(fromSquareMeter squareMeter: Double) {             // 두 번째 이니셜라이저
        self.squareMeter = squareMeter
    }
    
    init(value: Double) {                                   // 세 번째 이니셜라이저
        squareMeter = value
    }
    
    init(_ value: Double) {                                 // 네 번째 이니셜라이저
        squareMeter = value
     }
}

let roomOne: Area3 = Area3(fromPy:  15.0)
print(roomOne.squareMeter)//49.587

let roomTwo: Area3 = Area3(fromSquareMeter: 33.06)
print(roomTwo.squareMeter)//33.06

let roomThree: Area3 = Area3(value: 30.0)
let roomFour: Area3 = Area3(55.0)

//Area3() //err

"""
11-1-3 옵셔널 프로퍼티 타임
"""
/*
 초기화 과정에서 값을 초기화하지 않아도 되는, 즉 인스턴스가 사용되는 동안에 값을 꼭 갖지 않아도 되는 저장 프로퍼티가 있다면 해당 프로퍼티를 옵셔널로 선언할 수 있다. 또는 초기화 과정에서 값을 지정해주기 어려운 경우 저장 프로퍼티를 옵셔널로 선언할 수도 있습니다. 옵셔널로 선언한 저장 프로퍼티는 초기화 과정에서 값을 할당해 주지 않는다면 자동으로 n11이 할당된다
 */
///Person 클래스
class Person {
    var name: String
    var age: Int?
    
    init(name: String) {
        self.name = name
    }
}

let lucas: Person = Person(name: "lucas")
print(lucas.name)   //"lucas"

print(lucas.age)    //nil

lucas.age = 99
print(lucas.age)    //99

lucas.name = "Neo"
print(lucas.name)   //"Neo

"""
11-1-4 상수 프로퍼티
"""
/*
 상수로 선언된 저장 프로퍼티는 인스턴스를 초기화하는 과정에서만 값을 할당할수 있으며, 처음 할당된 이후로는 값 을 변경할 수 없다!
  */
///상수 프로퍼티의 초기화
class Person2 {
    let name: String
    var age: Int?
    
    init(name: String) {
        self.name = name
    }
}

let lucas2: Person2  = Person2(name: "lucas")
//lucas2.name = "Neo"   //err

"""
기본이니셜라이저와멤버와이즈이니셜라이저
"""
/*
 사용자 정의 이니셜라이저를 정의해 주지 않으면 클래스나 구조체는 모든 프로퍼티에 기본값이 지정되어 있다는 전제하에 기본 이니셜라이저를 사용한다. 기본 이니셜라이저는 프로퍼티 기본값으로 프로퍼티를 초기화해서 인스턴스를 생성한다. 즉,  기본 이니셜라이저는 저장 프로퍼티의 기본값이 모두 지정되어 있고, 동시에 사용자 정의 이니셜라이저가 정의되어 있지 않은 상태에서 제공된다.
 저장 프로퍼티를 선언할때 기본값을 지정해 주지 않으면 이니셜라이저에서 초깃값을 설정해야 한다. 그러나, 프로퍼티 하나 때문에 매번 이니셜라이지를 추가하거나 번경하는 일은 여간  귀찮은 일이 아니다. 때문에 구조체는 사용자정의 이니셜라이저를 구현하지 않으면 프로퍼티 의 이름으로 매개변수를 갖는 이니셜라이저인 멤버와이즈 이니셜라이저를 기본으로 제공한다. 그렇지만 클래스는 멤버와이즈 이니셜라이저를 지원하지 않다.
 */
struct Point {
    var x: Double = 0.0
    var y: Double = 0.0
}

struct Size {
    var width: Double = 0.0
    var height: Double = 0.0
}

let point: Point = Point(x: 0, y: 0)
let size: Size = Size(width: 50.0, height: 50.0)

// 구조체의 저장 츠로퍼티에 기본값이 있는 경우
// 필요한 매개변수만 사용하며 초기화할 수도 있습니다.
let somePoint: Point = Point()
let someSize: Size = Size(width: 50)
let anotherPoint: Point = Point(y: 100)

"""
11-1-6 초기화 위임
"""
/*
 값 다입인 구조체와 열거형은 코드의 중복을 피하기 위하여 이니설라이저가 다른 이니셜라이저에게 일부 초기화를 위임하는 초기화 위임을 간단하게 구현할수 있다. 하지만 클래스는 상속을 지원하는터라 간단한 초기화 위임도 할수 없다. 클래스의 초기화 위임은 상속을 이용한다.
 값 타입에서 이니셜라이저가 다른 이니셜라이저를 호출하려면 self.init을 사용한다. 당연히 self init은 이니셜라이저안에서만 사용할수 있는데 self.init을 사용한다는 것 자체가 사용자정의 이니셜라이지를 정의하고 있다는 뜻이다. 그런데 사용자정의 이니셜라이저를 정의하면 기본 이니셜라이저와 멤버와이즈 이니셜라이저를 사용할수 없다고 했다. 따라서 초기화 위임을 하려면 최소 두개 이상의 사용자정의 이니셜라이저를 정의해야 한다.
 */

///Student 연거형과 초기화 위임
enum Student {
    case elementary, middle, high
    case none
    // 사용자 정의 이니설라이저가 있는경우, init()메서드륨구현해주어야기본이니셜라이저를
    // 사용할 수 있다.
    init() {
        self = .none
    }
    
    init(koreanAge: Int) {
        switch koreanAge {
        case 0...13:
            self = .elementary
        case 14...16:
            self = .middle
        case 17...19:
            self = .high
        default:
            self = .none
        }
    }
        
    init(bornAt: Int, currrentYear: Int) {  // 두 번째 사용자 정의 이니셜라이저
        self.init(koreanAge: currrentYear - bornAt + 1)
    }
}

var younger: Student = Student(koreanAge: 16)
print(younger)//middle

younger = Student(bornAt: 2007, currrentYear: 2023)
print(younger)//high

"""
11-1-7 실패 가능한 이니셜라이저
"""
/*
 이니셜라이저를 통해 인스턴스를 초기화 할 수 없는 여러가지예외 상황이 있다. 대표적으로 이니셜라이저의 전달인자로 잘못된 값이나 적절치 못한 값이 전달 되었을때, 이니셜라이저는 인스턴스 초기화에 실패할 수 있다. 그 외에도 여러 이유로 인스턴스 초기화에 실패할 수 있다.
 이니셜라이저를 정의할때 이런 실패 가능성을 염두에 두기도 하는데. 이렇게 실패 가능성을 내포한 이니셜라이저몰 실패가능한 이니살라이즈라고 부른다. 실패가능한 이니셜라이저는 클레스, 구조체, 열거형 등에 모두 정의할수 있다. 실패가능한 이니셜라이저는 실패했을 때 nil을 반환해주므로 반한 타입이 옵서별로 지정된다. 따라서 실패 가능한 이니션라이저는 init 대신에 init? 키워드를 사용한다.
 */
///실패 가능한 이니션라이저
class Person4 {
    let name: String
    var age: Int?
    
    init?(name: String) {
        
        if name.isEmpty {
            return nil
        }
        self.name = name
        
    }
    
    init?(name: String, age: Int) {
        if name.isEmpty || age < 0 {
            return nil
        }
        self.name = name
        self.age = age
    }
}

let lucas3: Person4? = Person4(name: "lucas", age: 99)

if let person: Person4 = lucas3 {
    print(person.name)
} else {
    print("Person wasn't initialized")
}
//lucas

let neo: Person4? = Person4(name: "lucas", age: -10)

if let person: Person4 = neo {
    print(person.name)
} else {
    print("Person wasn't initialized")
}
//Person wasn't initialized

let trinity: Person4? = Person4(name: "", age: 30)

if let person: Person4 = trinity {
    print(person.name)
} else {
    print("Person wasn't initialized")
}
//Person wasn't initialized

///열거형의 실패 가능한 이니셜라이저
enum Student2: String {
    case elementary = "초등학생", middle = "중학생", high = "고등학생"
    
    init?(koreanAge: Int) {
        switch koreanAge {
        case 0...13:
            self = .elementary
        case 14...16:
            self = .middle
        case 17...19:
            self = .high
        default:
            return nil
        }
    }
    
    init?(bornAt: Int, currentYear: Int) {
        self.init(koreanAge: currentYear - bornAt + 1)
    }
}

var younger2: Student2? = Student2(koreanAge: 20)
print(younger2)         //nil

younger2 = Student2(bornAt: 2020, currentYear: 2016)
print(younger2)         //nil

younger2 = Student2(rawValue: "대학생")
print(younger2)         //nil

younger2 = Student2(rawValue: "고등학생")
print(younger2)         //high

"""
11-1-8 함수를 사용한 프로퍼티 기본값 설정
"""
/*
 만약 사용자정의 연산을 통해 저장 프로퍼티 기본값을 설정하고자 한다면 클로저나 합수를 사용하여 프로퍼티 기본값을 제공할수 있다. 인스턴스를 초기화할때 한수나 클로저가 호출되면서 연산 결과값을 프로퍼티 기본값으로 제공해준다. 그렇기 때문에 클로저나 함수의 반환타입은 프로퍼티의 타입과 일치해야 한다. 만약 프로퍼티 기본값을 설정해주기 위해서 클로저를 사용한다면 클로저가 실행되는 시점은 초기화 할때 인스턴스의 다른 프로퍼티 값이 설정되기 전이라는것도 인지해야힌다. 즉, 클로저 내부에서는 인스턴스의 다른 프로퍼티를 사용하여 연산 할수는 없다는 것이다. 다른 프로피티에 기본값이 있다고해도 안된다. 또한, 클로저 내부에서 self프로펴티도 사용할수 없으며, 인스턴스메서드를 호출 할수도 없다.
 */
///클로저를 통한 프로퍼티 기본값 설정
/*
 class SomeClass {
     let someProperty: SomeType = {
         // 새로운 인스턴스를 생성하고 사용자 젖ㅇ의 연산을 통한 후 반환해 준다.
         // 반환되는 값의 타입은 SomeType과 같은 타입이어야 한다.
         return someValue
     }()
 }
 
 클로저 뒤에 소괄효가 붙은 이유는 클로저를 실행하기 위해서이다. 클로저뒤에 소괄호가 붙 어 클로저를 실행한 결과값은 프로퍼티의 기본값이 된다. 만약 소괄호가 없다면 프로퍼티의 기본값은 클로저 그 자체가 된다. 우리가 의도했던 것과는 전혀 다른 의미가 되는것
 */

///클로저를 통한 student 프로퍼티 기본값 설정
struct Student3 {
    var name: String?
    var number: Int?
}

class SchoolClass {
    var students: [Student3] = {
        // 새로운 인스턴스를 생성하고 사용자 정의 연산을 통한후 반환해 준다.
        // 반환되는 값의 타임음 [Student3] 타입이어야 한다.
        
        var arr: [Student3] = [Student3]()
        
        for num in 1...15 {
            var student: Student3 = Student3(name: nil, number: num)
            arr.append(student)
        }
        
        return arr
    }()
}

let myClass: SchoolClass = SchoolClass()
print(myClass.students.count) //15

/*
 iOS에서의 활용
 스위프트 언어와는 크게 관계가 없지만 iOS의 UI등을 구성할때, UI컴포넌트를 클래스의 프로퍼티로 구현하 고 이 컴포넌트의 생성과 동시에 컴포넌트의 프로퍼티를 기본적으로 설정할때 유용하게 사용할수 있다.
 */
1
