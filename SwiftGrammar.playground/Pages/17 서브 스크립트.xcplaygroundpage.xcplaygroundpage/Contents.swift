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

"""
17-3 복수 서브스크립트
매개변수 타입을 하용하여 서브스크립트를 구현하면 하나의 타입이 여러 개의 서브스크립트를 가질수 있다.
"""
/// 복수의 서브스크립트 구현
struct Student2 {
    var name: String
    var number: Int
}

class School2 {
    
    var number : Int = 0
    var students: [Student2] = [Student2]()
    
    func addStudent(name: String){
        let student: Student2 = Student2(name: name, number: self.number)
        self.students.append(student)
        self.number += 1
    }
    
    func addStudents(names: String...) {
        for name in names {
            self.addStudent(name: name)
        }
    }
    subscript(index: Int) -> Student2? {        // 첫 번째 서브스크립트
        get {
            if index < self.number {
                return self.students[index]
            }
            return nil
        }
        
        set {
            guard var newStudent: Student2 = newValue else {
                return
            }
            
            var number: Int = index
            
            if index > self.number {
                number = self.number
                self.number += 1
            }
            
            newStudent.number = number
            self.students[number] = newStudent
        }
    }
    
    subscript(name: String) -> Int? {           // 두 번째 서브스크립트
        get {
            return self.students.filter { $0.name == name }.first?.number
        }
        
        set {
            guard var number: Int = newValue else {
                return
            }
            
            if number > self.number {
                number = self.number
                self.number += 1
            }
            
            let newStudent: Student2 = Student2(name: name, number: number)
            self.students[number] = newStudent
        }
    }
    subscript(name: String, number: Int) -> Student2? {         // 새 번째 서브스크립트
        return self.students.filter{ $0.name == name && $0.number == number }.first
    }
}

let highScool2: School2 = School2()
highScool2.addStudents(names: "Lucas", "Neo", "Trinity")

let aStudent2: Student2? = highScool2[1]
print("\(aStudent2?.number) \(aStudent2?.name)")    //Optional(1) Optional("Neo")

print(highScool2["Oracle"])         //nil
print(highScool2["Lucas"])          //Optional(0)

highScool2[0] = Student2(name: "SungMin", number: 0)
highScool2["KL"] = 1

print(highScool2["Lucas"])              //nil
print(highScool2["KL"])                 //Optional(1)
print(highScool2["Trinity", 2])         //Optional(Student2(name: "Trinity", number: 2))
print(highScool2["Oracle", 3])         //nil

"""
17-4 타입 서브스크립트
인스턴스가 아니라 타입 자체에서 사용할 수 있는 서브스크립트
subscript 키워드 앞에 static 키워드를 사용(클래스의 경우네는 class 키워드 사용)
"""

///타입 서브스크립트 구현
enum School3: Int {
    case elementary = 1, middle, high, university
    
    static subscript(level: Int) -> School3? {
        return Self(rawValue: level)
        //return School(rawvalue: level) 과 동일.
    }
}

let school3: School3? = School3[2]
print(school3)
//School3.middle

