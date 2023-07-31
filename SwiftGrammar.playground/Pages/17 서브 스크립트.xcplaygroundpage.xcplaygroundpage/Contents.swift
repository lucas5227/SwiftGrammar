"""
///서브 스크립트 sub script
"""
/**
 * 서브스크립트는 인스턴스의 아름 뒤에 대괄호로 감싼 값을 써줌으로써 인스턴스 내부의 특정 값에 접근 할 수 있다
 * subsctipy.키워드를 사용하여 정의
 */

"""
17-1 서브스크립트문법
"""
///서브스크립트 정의 문법
/*
subscript(index: Int) -> Int {
    get {
        // 적절한 서브스크립트 결괏값 반환
    }
    
    set(newValue) {
        // 적절한 설정자 역할 수행
    }
}
*/

/// 읽기 전용 서브스크립트 정의 문법
/*
subscript(index: Int) -> Int {
    get {
        // 적절한 서브스크립트 값 반환
    }
}

subscript(index: Int) -> Int {
    // 적절한 서브스크립트 결괏값 반환
}
*/

"""
17-2 서브스크립트 구현
"""
struct Student {
    var name: String
    var number: Int
}

class School {
    
    var number: Int = 0
    var students: [Student] = [Student]()
    
    func addStudent(name: String) {
        let student: Student  = Student(name: name, number: self.number)
        self.students.append(student)
        self.number += 1
    }
    
    func addStudents(names: String...) {
        for name in names {
            self.addStudent(name: name)
        }
    }
    
    subscript(index: Int) -> Student? {
        if index < self.number {
            return self.students[index]
        }
        return nil
    }
}

let highScool: School = School()
highScool.addStudents(names: "Lucas", "Neo", "Trinity")

let aStudent: Student? = highScool[1]
print("\(aStudent?.number) \(aStudent?.name)")          //Optional(1) Optional("Neo")

