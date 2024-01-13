"""
///27-6 클로저의 강한참조 순환
 앞에서 인스턴스끼리의 강한참조 때문에 발생하는 강한참조 순환문제를 살펴본 바 있다. 그런데 강한참조 순환문제는 두 인스턴스끼리의 참조일 때만 발생하는것 외에 클로저가 인스턴스의 프로퍼티일때나, 클로저의 값 회득 특성 때문에 발생한다. 예를 들어 클로저 내부에서 self.someProperty처럼 인스턴스의 프로퍼티에 접근할때나 클로저 내부 에서 self.someMethod() 처럼 인스턴스의 메서드를 호출할 때 값 확득이 발생할 수 있는데. 두 경우 모 두 클로저가 self를 획득 하므로 강한참조 순환이 발생한다. 강한참조 순환이 발생하는 이유는 클로저가 클래스와 같은 참조타입이기 때문이다. 클로저를 클래스 인스턴스의 프로퍼티로 할당하면 글로저 의참조가 할당된다. 이때 참조타입과 참조타입이 서로 강한참조를 하기 때문에 강한참조 순환문제가 발생한다. 이러한 클로저의 강한참조 순환문제는 클로저의 획득 목록을 통해 해결할 수. 있다. 그런데 클로저의 획득 목록을 통해 강한참조 순환문제를 해결하는 방법을 알아보기 전에 강한참조 순환이 어떻게 일어나게 되는지 알아본다
"""

///클로저의 강한참조 순환문제
class Person {
    let name: String
    let hobby: String?

    lazy var introduce: () -> String = {
    
        var introduction: String = "My name is \(self.name)."
        
        guard let hobby = self.hobby else {
            
            return introduction
        }
        
        introduction += " "
        introduction += "My hobby is \(hobby)."
        return introduction
     }
    
    init(name:String, hobby:String? = nil) {
        self.name = name
        self.hobby = hobby
        
    }
    
    deinit {
        print("\(name) is being deinitialized")
        
    }
}

var lucas: Person? = Person(name: "lucas", hobby: "eating")
print(lucas?.introduce())           //"My name is lucas. My hobby is eating."
lucas = nil

"""
///27.6.1 획득목록
앞의 문제를 학득목록을 동해 해결할 수 있다. 획득목욕은 클로저 내부에서 참조타입을 희득하는 규칙을 제시해줄 수 있는 기능입니다. 예를 들어 앞의 상황에서 클로저 내부의 self 참조를 약한참조로 지정할 수도, 강한참조로 지정할 수도 있다는 뜻입니다. 앞에서는 self를 약한참조하도록 바꾸면 문제를 해결할 수 있다. 희득목륵을 사용하면 때에 따라서, 혹은 각 관계에 따라서 참조방식을 클로저에 제안할 수 있다. 획득목록은 클로저 내부의 매개변수 목록 이전 위치에 작성해줍니다. 획득목록은 참조방식과 참조할 대상을 대괄호([])로 둘러싼 목록 형식으로 작성하며 획득목록 뒤에는 in 키워드를 써준다. 획득목록에 명시한 요소가 참조타입이 아니라면 해당 요소들은 클로저가 생성될 때 초기화된다.
"""

/// 회득목록을 통한 값 획득
class SimpleClass {
    var value: Int = 0
}

var a = 0
var b = 0
let closure = { [a] in
    print(a, b)
    b = 20
}

a = 10
b = 10
closure()           // 0 10
print(b)            // 20

///참조타입의 획득목톡 동작
var x = SimpleClass()
var y = SimpleClass()

let clouser = { [x] in
    print(x.value, y.value)
}

x.value = 10
y.value = 10

closure()           //10, 10

///획득목록의 획득종류 명시
class SimpleClass_2 {
var value: Int = 0
}
var x_2: SimpleClass_2? = SimpleClass_2()
var y_2 = SimpleClass_2()

let closure_2 = { [weak x_2, unowned y_2] in
    print(x_2?.value, y_2.value)
}


x_2 = nil
y_2.value = 10

clouser_2()           //nil 10

///
