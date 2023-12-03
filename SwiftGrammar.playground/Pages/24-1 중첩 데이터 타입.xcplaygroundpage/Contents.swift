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
struct Sports {
    enum GameType {
    case football, basketball
    }
    
    var gameType: GameType
    
    struct GameInfo {
        var time: Int
        var player: Int
    }
    
    var gameInfo: GameInfo {
        switch self.gameType {
        case .basketball:
            return GameInfo(time: 40, player: 5)
        case .football:
            return GameInfo(time: 60, player: 11)
        }
    }
}

struct ESports {
    enum GameType {
    case online, offline
    }
    
    var gameType: GameType
    
    struct GameInfo {
        var location: String
        var pakage: String
    }
    
    var gameInfo: GameInfo {
        switch self.gameType {
        case .online:
            return GameInfo(location: "www.liveonline.co.kr", pakage: "LoL")
        case .offline:
            return GameInfo(location: "제주", pakage: "SA")
        }
    }
}

var basketball: Sports = Sports(gameType: .basketball)
print(basketball.gameInfo)          //GameInfo(time: 40, player: 5)

var sudden: ESports = ESports(gameType: .offline)
print(sudden.gameInfo)              //GameInfo(location: "제주", pakage: "SA")

let someGameType: Sports.GameType = .football
let anotherGameType: ESports.GameType = .online
//let errorIfYouWantIt: Sports.GameType = .online           //err
