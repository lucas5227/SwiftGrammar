"""
///맵,필터,리듀스의 활용
"""
/// 정보 생성
enum Gender {
    case male, female, unknown
}

struct Friend {
    let name: String
    let gender: Gender
    let location: String
    var age: UInt
}

var friends: [Friend] = [Friend]()

friends.append(Friend(name: "Neo", gender: .male, location:"LA", age: 36))
friends.append(Friend(name: "Trinity", gender: .female, location:"LA", age: 32))
friends.append(Friend(name: "Oracle", gender: .female, location:"cion", age: 100))
friends.append(Friend(name: "Morpheaus", gender: .male, location:"cion", age: 99))
friends.append(Friend(name: "Mouse", gender: .unknown, location:"Chicago", age: 21))
friends.append(Friend(name: "Naobe", gender: .female, location:"cion", age: 90))
friends.append(Friend(name: "Tank", gender: .male, location:"Chicago", age: 41))

/// map, filtering, reduce
//Friends who lives outside of LA and is over 30 years old
var result: [Friend] = friends.map{ Friend(name: $0.name, gender: $0.gender, location: $0.location, age: $0.age + 1 ) }

result = result.filter{ $0.location != "LA" && $0.age >= 30 }

let string: String = result.reduce("Friends who lives outside of LA and is over 30 years old") { $0 + "\n" + "\($1.name) \($1.gender) \($1.location) \($1.age)세"}

print(string)
//Friends who lives outside of LA and is over 30 years old
//Oracle female cion 101세
//Morpheaus male cion 100세
//Naobe female cion 91세
//Tank male Chicago 42세

