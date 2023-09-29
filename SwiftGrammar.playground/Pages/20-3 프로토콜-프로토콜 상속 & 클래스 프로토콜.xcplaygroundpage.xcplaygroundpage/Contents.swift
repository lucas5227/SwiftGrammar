"""
///프로토콜 - 프로토콜 상속 & 클래스 전용 프로토콜
"""
///프로토몰의 상속
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

///클래스전용 프로토골의 정의
protocol ClassOnlyProtocol: class, Readable, Writeable {
    //추가 요구하상
}

class SomeClass_2: ClassOnlyProtocol {
    func read() { }
    func write() { }
}

/*
 //err!! ClassOnlyProtocol 프로토콜은 클래스 타입에만 채택가능하다.
 struct SomeStruct: ClassOnlyProtocol {
 func read() { }
 func write() { }
 }
*/
