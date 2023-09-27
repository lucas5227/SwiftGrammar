"""
///프로토콜 - 프로토콜 상속 & 클래스 전용 프로토콜
"""

///프로토콜의 상속
protocol Readable {
    func read()
}

protocol Writeable {
    func write()
}

protocol ReadSpeakable: Readable {
    func speak()
}

protocol ReadWriteSpeakable: Readable, Writeable {
    func speak()
}

class SomeClass: ReadWriteSpeakable {
    func read() {
        print("Read")
    }
    
    func write() {
        print("Write")
    }
    
    func speak() {
        print("Speak")
    }
}

protocol ClassOnlyProtocol: class, Readable, Writeable {
    //추가 요구사항
}

class SomeClass_2: ClassOnlyProtocol {
    func read() { }
    func write() { }
}

/*
//오류!! ClassonlyProtocol 프로토골은클래스타입에만채택가능
struct SomeStruct: ClassOnlyProtocol {
    func read() { }
    func write() { }
}
*/
