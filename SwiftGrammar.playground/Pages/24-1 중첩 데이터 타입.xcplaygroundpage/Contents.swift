"""
///24-1 중첩 데이터 타입 Nested Type
"""
///중첩데이터타입구천
class Person {
    enum Job {
        case jobless, programer, student
    }
    
    var job: Job = .jobless
}

class Student: Person {
    enum School {
        case elementary, middle, high
    }
    
    var school: School
    
    init(school: School) {
        self.school = school
        super.init()
        self.job = .student
    }
}

let personJob: Person.Job = .jobless
let studentJob: Student.Job = .student

let student: Student = Student(school: .middle)

print(student.job)                  //student
print(student.school)               //middle

///같은 이름의 중첩 데이티 타입 구현
///
