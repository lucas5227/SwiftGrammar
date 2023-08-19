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
 */

/**
 * 8-2-4 서브스크립트재정의
 */

/**
 * 8-2-5 재정의 방지
 */
