"""
///반환값이 없는 함수의 정의와 사용
"""
///반환값이 없는 함수의 정의와 사용
func sayHelloWorld() {
    print("Hello, world!")
}
sayHelloWorld() //Hello, world!

func sayHello(from myName: String, to name: String) {
    print("Hello \(name)! I'm\(myName)")
}

func sayGoodbye() -> Void { //Void 생략가능
    print("Good bye")
}

sayGoodbye()
