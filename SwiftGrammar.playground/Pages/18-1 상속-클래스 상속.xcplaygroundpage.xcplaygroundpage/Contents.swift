"""
///상속 extends (: parents) - 클래스 상속
"""

/// 기반클래스 Person
class Person {
    var name: String = ""
    var age: Int = 0
    
    var introduction: String {
        return "이름 : \(name). 나이 : \(age)"
    }
    
    func speak() {
        print("가나다라마바사")
    }
}

let lucas: Person = Person()
lucas.name = "lucas"
lucas.age = 99
print(lucas.introduction)           //이름 : lucas. 나이 : 99
lucas.speak()                       //가나다라마바사

/*
 class 클래스이름: 부모클래스 이름 [
    프로퍼티의 메서드들
 }
 */

///Person 클래스를 상속받은 Student 클래스
class Student: Person {
    var grade: String = "F"
    
    func study() {
        print("Study hard...")
    }
}

let lucas2: Person = Person()
lucas2.name = "lucas"
lucas2.age = 99
print(lucas2.introduction)          //이름 : lucas. 나이 : 99
lucas2.speak()                      //가나다라마바사

let neo: Student = Student()
neo.name = "neo"
neo.age = 99
neo.grade = "A"
print(neo.introduction)         //이름 : neo. 나이 : 99
neo.speak()                     //가나다라마바사
neo.study()                     //Study hard...
