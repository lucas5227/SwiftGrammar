"""
///인스턴스-인스턴스 소멸 deinit
"""
/*
 콜레스의 인스턴스는 디이니살라이저를 구현할 수 있다. 디이니셜라이저는 이니셜라이저와 반대역할을 한다. 즉. 메모리에서 해제되기 직전 클래스 인스턴스와 관련하여 원하는 정리 작업을 구현할 수 있다. 디이니셜라이저는 클래스의 인스턴스가 메모리에서 소멸 되기 바로 직전에 호출된다. deinit키워드를 사용하여 디이니셜라이저를 구현하면 자동으로 호출된다. 디이니셜라이저는 클래스의 인스턴스에만 구현할수 있다.
 
 스위프트는 인스턴스가 더 이상 필요하지 않으면 자동으로 메모리에서 소멸시킨다. 인스턴스 대부분은 소멸시킬때 디이니셜라이저를 사용해 별도의 메모리 관리 작업을 할 필요는 없다. 그렇지만 예를 들어 인스턴스 내부에서 파일을 불러와 열어보는 등의 외부자원을 사용
 했다면 인스턴스를 소멸하기 직전에 파일을 다시 저장하고 닫아주는 등의 부가작업을 해야한다. 또는 인스턴스를 메모리에서 소멸하기 직전에 인스턴스에 저장되어 있던 데이티를 디스크에 파일로 저장 해줘야하는 경우도 있을수 있다. 그런 경우에 디이니셜라이지는 굉장히 유용하게 사용할 수 있다.
 클래스에는 디이니셜라이저를 단하나만 구현할 수 있다. 디이니셜라이지는 이니셜라이저와는 다르게 매개변수를 갖지 않으며, 소괄호도 적어주지 않는다. 또, 자동으로 호출되기 때
 문에 별도의 코드로 호출할수도 없다.
 디이니셜라이저는 인스턴스를 소멸하기 직전에 호출되므로 인스턴스의 모든프로퍼티에 접근할 수 있으며 프로퍼티의 값을 변경할 수도 있다.
 */

///디이니셜라이저 구현
class SomeClass {
    deinit {
        print("Instance will bo deallocated immediately")
    }
}

var instance: SomeClass? = SomeClass()
instance = nil //Instance will bo deallocated immediately

///F i l eManager 클래스의 디이니셜라이저 활용
class FileManager {
    var fileName: String
    
    init(fileName: String) {
        self.fileName = fileName
    }
    
    func openFile() {
        print("Open File: \(self.fileName)")
    }
    
    func modifyFile() {
        print("Modify File: \(self.fileName)")
    }
    
    func writeFile() {
        print("Write File: \(self.fileName)")
    }
    
    func closeFile() {
        print("Close File: \(self.fileName)")
    }
    
    deinit {
        print("Deinit instance")
        self.writeFile()
        self.closeFile()
    }
}

var fileManager: FileManager? = FileManager(fileName: "file_1.txt")

if let manager: FileManager = fileManager {
    manager.openFile()              //Open File: file_1.txt
    manager.modifyFile()            //Modify File: file_1.txt
}

fileManager = nil
//Deinit instance
//Write File: file_1.txt
//Close File: file_1.txt
