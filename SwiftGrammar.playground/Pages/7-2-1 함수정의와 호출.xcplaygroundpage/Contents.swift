"""
///매개변수_argument
"""
///매개변수가없는함수점의와사용
func helloWorld() -> String {
    return "Hello, world"
}

///매개변수가여러개인합수의정의와사용
func sayHello(myName: String, yourName: String) -> String {
    return "Hello \(yourName)! I'm \(myName)"
}

print((sayHello(myName: "neo", yourName: "lucas")))

//매개변수 이름과 전달인자 레이블
//스위프트에서 기본적으로 사용하는 키워드 대부분은 매개변수 이름으로 사용할수 없습니다. 하지만 이름을 지정해줄때 강세표. 혹은 ba ckquote(',키보드 탭키 위의 특수기호)로 이름을 감싸주면 대부분의 키워드를 이름으로 사용할수있습니다. 예를 들어 var라는 단어는 스위프트의 키워드이므로 이름으로 사용하면 캄파일 오류가발생하지만, 강세표를 사용하여 Var 처럼 작성해주면 이름으로 사용할수 있다
/*
 매개변수이름과전달인자레이블을지정할때는다음처럼표현합니다.
 func 함수이름(전달인자 레이블 매개변수 이름: 매개변수 타입, 전달인자 레이블 매개변수 이름: 매개변수 타입) -> 반홥 타입 {
     실행구문
     return 반환 값
 }
 */

///매개변수이름과전달인자레이볼을가지는함수정의와사용
// from과 to라는 전달인자 레이볼이 있으며
// myName과 name이라는 매개변수이름이 있는 sayHeLlo 합수
func sayHello(from myName: String, to name: String) -> String{
    return "Hello \(name) I'm \(myName)"
}
print(sayHello(from:"lucas",to:"neo"))//Hello neo I'm lucas

///전달인자레이블이없는함수정의와사용
func sayHello(_ name: String, _ times: Int) -> String {
    var result: String = ""
    
    for _ in 0..<times {
        result += "Hello \(name)!" + " "
    }
    
    return result
}
print(sayHello2("lucas",2)) //Hello lucas! Hello lucas!

// 전달인자레이블변경을통한한수중복정의
func sayHello(to name:String,_ times: Int) -> String {
    var result: String = ""
    for _ in 0..<times{
        result += "Hello \(name)!" + " "
    }
    return result
}
func sayHello(to name:String, repeatCount times: Int) -> String {
    var result: String = ""
    for _ in 0..<times{
        result += "Hello \(name)!" + " "
    }

return result
}

print(sayHello(to:"lucas",2))
print(sayHello(to:"lucas", repeatCount:2))

///매개변수기본값이있는함수의정의와사용
