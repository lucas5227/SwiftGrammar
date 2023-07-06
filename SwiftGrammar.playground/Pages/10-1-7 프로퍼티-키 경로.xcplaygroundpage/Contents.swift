"""
///프로퍼티-키 경로 Key Path
"""
/*
 프로퍼티의 위치만 참조할수 있도록 함
 */

func someFunction(paramA: Any, paramB: Any) {
    print("someFunction called...")
}

var functionReference = someFunction(paramA:paramB:)

functionReference("A", "B") //someFunction called...
//functionReference = anotherFunction(paramA:paramB:)

"""
프로퍼티도 이 처럼 값을 바로 꺼내오는 것이 아니라 어떤 프로퍼티의 위치만 참조하도록 할 수 있습니다.바로 키 경로를 활용하는 방법이다. 키경로를 사용하여 간접적으로 특정타입의 어떤 프로퍼티값을 가리켜야 할지 미리 지정해 두고 사용할수 있습니다.
키경로 타입은 AnyKeyPath라는 클래스로부터 파생됩니다. 제일 많이 확장된 키경로 타입은 WritableKeyPath<Root,Value>* 와 ReferenceWritableKeyPath<Root,Value>타입입니다.. writablekeyPath<Root, Value> 타입은 값 타입에 키 경로 타입으로 읽고 쓸수 있는 경우에 적용되며, ReferencelritabLeKeyPath<Rot,Value>타입은 참조타입, 즉 클래스 타입에 키 경로 타입으로 읽고 쓸수 있는 경우에 적용됩니다. 키경료는 역슬래 시(\\) 와 타입, 마침표(.) 경로로 구성된다.
    \\타입이름.경로.경로.경로
"""

/// 키 여로 텅입의 타입 확인
class Person {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

struct Stuff {
    var name: String
    var owner: Person
}

print(type(of: \Person.name))   //ReferenceWritableKeyPath<Person, String>
print(type(of: \Stuff.name))    //WritableKeyPath<Stuff, String>

///keyPath 서브스크립트와 키경로 활용
class Person2 {
    let name: String
    init(name: String) {
        self.name = name
    }
}

struct Stuff2 {
    var name: String
    var owner: Person2
}

let lucas = Person2(name: "lucas")
let neo = Person2(name: "neo")
let macbook = Stuff2(name: "macbook Pro", owner: lucas)
var iMac = Stuff2(name: "iMac", owner: lucas)
let iPhone = Stuff2(name: "iPhone", owner: neo)

let stuffNameKeyPath = \Stuff2.name
let ownerkeyPath = \Stuff2.owner

// \Stuff.owner.name과 같은 표현
let ownerNameKeyPath = ownerkeyPath.appending(path: \.name)

// 키 경로와 서브스크립트를 이용해 프로퍼티에 접근하여 값을 가져옵니다.
print(macbook[keyPath: stuffNameKeyPath])       //macbook Pro
print(iMac[keyPath: stuffNameKeyPath])          //iMac
print(iPhone[keyPath: stuffNameKeyPath])        //iPhone

print(macbook[keyPath: ownerNameKeyPath])       //lucas
print(iMac[keyPath: ownerNameKeyPath])          //lucas
print(iPhone[keyPath: ownerNameKeyPath])        //neo

// 키 경로와 서브스크립트를 이요해 프로퍼티에 접근하여 값을 변경합니다.
iMac[keyPath: stuffNameKeyPath] = "iMac Pro"
iMac[keyPath: ownerkeyPath] = neo

// 상수로 지정한 값 타입과 읽기 전용 프로퍼티는 키 경로 서브스크립트로도 값을 바꿔줄 수 없습니다.
//macbook[keyPath: stuffNameKeyPath] = "iMac Pro touch bar" //err
//lucas[keyPath: \Person.name] = "fox" //err

/*
 키경로는 타입 외부로 공개된 인스턴스 프로퍼티 혹은 서브스크민트에 한하여 표현할수 있습니다. 접근수준을 설정할수 있다
 자신을 나타내는 키경로인 \.selF를 사용하면 인스턴스 그자체를 표현하는 키경로가 된다. 또.컴파일러 가 타입을 유추할수 있는 경우에는 키경로에서 타입 이름을 생략할수도 있습니다.
 */
