"""
///옵셔널 추출 Optiional Unwrapping
"""
///옵셔널값의 감제추츨
var myName: String? = "lucas"

//옵셔널이 아닌 변수에는 옵셔널 값이 들어갈 수 없다. 추출로서 할당해주어야 한다.
var lucas: String = myName!

myName = nil
//lucas = myName! //런타임 오류

//if 구문 중 조건문을 이용해서 조금 더 안전하게 처리할수 있다.
if myName != nil {
    print("My name is \(myName!)")
} else {
    print("myName == nil")
}
//myName == nil

///옵셔널 바인딩 Optionall binding
var myName2: String? = "lucas"

//옵셔널 바인딩을 통한 임시 상수 할당
if let name = myName2 {
    print("My name is \(name)")
} else {
        print("myName == nil")
}
//My name is lucas

//옵셔널 바인딩을 통한 임시 변수 할당
if var name = myName2 {
    name = "neo" //변수이므로 내부에서 변경 가능
    print("My name is \(name)")
} else {
     print("myName == nil")
}
//My name is neo

///옵셔널바인딩을 사용한 여러개의 옵셔널값의 추출
var myName3: String? = "lucas"
var yourName: String? = "neo"

//friend에 바인딩이 되지 않으므로 실해되지 않는다.
if let name = myName3, let friend = yourName {
    print("We are friedg! \(name) & \(friend)")
}

yourName = "trinity"

if let name = myName3, let friend = yourName {
    print("We are friedg! \(name) & \(friend)")
}

//We are friedg! lucas & trinity

/*
 때떄로 nil을 할당하고싶지만, 옵서널바인딩으로 매번 값을 추출하기 귀찮거나 로직상 nil떄문에 런타임오류가 발생하지 않을것 같다는 확신이 들때 nil을 할당해줄수 있는 읍서날이 아닌 변수나 상수가 필요할때 사용하는 것이 바로 암시적 추출 옵셔널이다. 옵셔널을 표시하고자 타입 뒤에 물음표(?)를 사용했지만, 암시적추출 옵셔널을 사용하려면 타입뒤에 느낌표(!)를 사용해주면 된다
 */

var myName4: String! = "lucas"
print(myName4)      //lucas
myName4 = nil

//암시적 우출 옵셔널도 옵셔널이므로 당연히 바인딩을 사용할 수 있습니다.
if let name = myName4 {
    print("My name is \(name)")
} else {
    print("myName == nil")
}
//myName == nil

//myName4.isEmpty //오류!

"""
옵셔널을 사용할때는 강제추출 또는 암시적추출 옵셔널을 사용하기 보다는 옵셔널바인딩, nil병합 연산자를 비롯해 뒤에서 배울  옵셔널 체이닝등의 방법을 사용하는 편이 훨씬 안전합니다. 또한 이렇게 하는 편이 스위프트의 지향하는 바이다.
"""
