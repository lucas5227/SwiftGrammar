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
 * 8-2-3 프로퍼티 감시자 재정의
 * 프로퍼티 감시자도 프로퍼티의 접근자와 설정자처럼 재정의 할수 있다. 또 조상 클래스에 정의한 프로퍼티가 연산 프로퍼티인지 저장프로퍼티인지는 상관없다. 다만 상수지장 프로퍼티나 읽기 전용 연산프로퍼티는 프로퍼디 감시자를 재정의 할수 없다. 왜냐하면 상수 저장 프로퍼티나 읽기 전용 연산 프로퍼티는 값을 설정할 수 없으므로 willSet 이나 didSet 메서드를 사용한 프로퍼티 감시자를 원천직으로 사용할 수 없기 때문이다. 또, 프로퍼티 감시자를 재정의하더라도 조상클래스에 정의한 프로퍼티 감시자도 동작한다는점, 잊지말아야 한다. 프로퍼티의 접근자와 프로퍼티 감시자는 동시에 재정의할 수 없다. 만약 둘 다 동작하길 원한다면 재정의하는 점근자에 프로퍼티 감시자의 역할을 구현해야 한다.
 */
class Person3 {
    var name: String = ""
    var age: Int = 0 {
        didSet {
            print("Person age: \(self.age)")
        }
    }
    var koreanAge: Int {
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
class Studunt3: Person3 {
    var grade: String = "F"
    override var age: Int {
        didSet {
            print("Student age : \(self.age)")
        }
    }
    
    override var koreanAge: Int {
        get {
            return super.koreanAge
        }
        
        set {
            self.age = newValue - 1
        }
        
        //didSet { }          //err
    }
    
    override var fullName: String {
        didSet {
            print("Full Name : \(self.fullName)")
        }
    }
}

let lucas3: Person3 = Person3()
lucas3.name = "lucas"
lucas3.age = 99
lucas3.fullName = "Lucas Kim"
print(lucas3.koreanAge)

let neo3: Studunt3 = Studunt3()
neo3.name = "neo"
neo3.age = 1
//Person age: 1
//Student age : 1
neo3.koreanAge = 3
//Person age: 2
//Student age : 2
neo3.fullName = "NEO"           //Full Name : NEO
print(neo3.koreanAge)           //3

/**
 * 8-2-4 서브스크립트재정의
 */
class Student4 {
    // Student4 클래스의 프로퍼티들
}

class School4 {
    var students: [Student4] = [Student4]()
    
    subscript(number: Int) -> Student4 {
        print("School subscript")
        return students[number]
    }
}

class MiddleSchool: School4 {
    var middleStudent: [Student4] = [Student4]()
    
    // 부모클래스(School)에세 상속받은 서브스크립트 재정의
    override subscript(index: Int) -> Student4 {
        print("MiddleSchool subscript")
        return middleStudent(index)
    }
}

let university: School = School()
university.students.append(Student())
university[0] //Schoolsubscript
let middle: MiddleSchool = MiddleSchool()
middle.middleStudents.append(Student())
middle[0] //MiddleSchoolsubscript

/**
 * 8-2-5 재정의 방지
 */
