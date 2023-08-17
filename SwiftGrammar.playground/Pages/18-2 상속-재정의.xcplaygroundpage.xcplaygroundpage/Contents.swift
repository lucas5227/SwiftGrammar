"""
///상속 - 재정의 override
"""
/**
 *18-2-1 메서드 재정의
 */
class Person {
    var name: String = ""
    var age: Int = 0
    
    var introduction: String {
        return "이름 : \(name). 나이 : \(age)"
    }
    
    func speak() {
        print("가나다라마바사")
    }
    
    class func introduceClass() -> String {
        return "인류의 소원은 평화입니다."
    }
}

class Studunt: Person {
    var grade: String = "F"
    
    func study() {
        print("Study hard...")
    }
    
    override func speak() {
        print("저는 학생입니다.")
    }
}

class UniversityStudent: Studunt {
    var major: String = ""
    
    class func introduceClass() {
        print(super.introduceClass())
    }
    
    override func speak() {
        super.speak()
        print("대학생이죠.")
    }
}

let lucas: Person = Person()
lucas.speak()           //가나다라마바사

let nee: Studunt = Studunt()
nee.speak()             //저는 학생입니다.

let trinity: UniversityStudent = UniversityStudent()
trinity.speak()         //저는 학생입니다. 대학생이죠.

print(Person            .introduceClass())              //인류의 소원은 평화입니다.
print(Studunt           .introduceClass())              //인류의 소원은 평화입니다.
print(UniversityStudent .introduceClass() as String)    //인류의 소원은 평화입니다.
UniversityStudent.introduceClass() as Void              //인류의 소원은 평화입니다.

/**
 *18-2-2 프로퍼티 재정의
 */
///프로퍼티 재정의
class Person2 {
    var name: String = ""
    var age: Int = 0
    var koreanAge: Int {
        return age + 1
    }
    
    var introduction: String {
        return "이름: \(name), 나이 : \(age)"
    }
}

class Student2: Person2 {
    var grade: String = "F"
    
    override var introduction: String {
        return super.introduction + " " + "학점 : \(self.grade)"
    }
    
    override var koreanAge: Int {
        get {
            return super.koreanAge
        }
        
        set {
            self.age = newValue - 1
        }
    }
}

let lucas2: Person2 = Person2()
lucas2.name = "lucas"
lucas2.age = 55
//lucas,koreanAge = 56              //err
print(lucas2.introduction)          //이름: lucas, 나이 : 55
print(lucas2.koreanAge)             //56

let neo2: Student2 = Student2()
neo2.name = "neo"
neo2.age = 14
neo2.koreanAge = 15
print(neo2.introduction)                //이름: neo, 나이 : 14 학점 : F
print(neo2.koreanAge)                   //15

/**
 * 18-2-3 프로퍼티 감시자 재정의
 */
class Person3 {
    var name: String = ""
    var age: Int = 0 {
        didSet {
            print("Person age : \(self.age)")
        }
    }
    var koreaAge: Int {
        return self.age + 1
    }
    
    var fullName: String {
        get {
            return self.name
            
        }
        
        set {
            self.name = newValue
        }
    }
}

class Student3: Person3 {
    var grade: String = "F"
    
    override var age: Int {
        didSet {
            print("Student age : \(self.age)")
        }
    }
    
    override var koreaAge: Int {
        get {
            return super.koreaAge
        }
        
        set {
            self.age = newValue - 1
        }
        
//            didset { }          //err!!!
    }
    
    override var fullName: String {
        didSet {
            print("Full name : \(self.fullName)")
        }
    }
}

let lucas3: Person3 = Person3()
lucas3.name = "lucas"
lucas3.age = 99                      //Person age : 99
lucas3.fullName = "Lucas Kim"
print(lucas3.koreaAge)              //100


let neo3: Student3 = Student3()
neo3.name = "lucas"
neo3.age = 15
//Person age : 15
//Student age : 15
neo3.koreaAge = 15
//Person age : 14
//Student age : 14
neo3.fullName = "NEO"
print(neo3.koreaAge)
//Full name : NEO
//15

/**
 * 18-2-4 서브스크립트 재정의
 */
class School {
    var students: [Studunt] = [Studunt]()
    
    subscript(number: Int) -> Studunt {
        print("School subscribe")
        return students[number]
    }
}

class MiddleSchool: School {
    var middleStudents: [Studunt] = [Studunt]()
    
    //부모클래스(School)에게 상속받은 서브스크립트 재정의
    override subscript(index: Int) -> Studunt {
        print("MiddleSchool subcript")
        return middleStudents[index]
    }
}
let university: School = School()
university.students.append(Studunt())
university[0]           //School subscribe

let middle: MiddleSchool = MiddleSchool()
middle.middleStudents.append(Studunt())
middle[0]               //MiddleSchool subcript

/**
 * 18-2-5 재정의 방지
 */
