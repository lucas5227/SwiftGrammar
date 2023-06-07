"""
///튜플
"""
// String, Int, Double 타입을갖는튜플
var person: (String, Int, Double) = ("lucas", 100, 178)
// 인덱스를통해서값을빼올수있습니다.
print("이름:\(person.0), 나이\(person.1), 신장:\(person.2)")
person.1 = 99
person.2 = 178.2
// 인덱스를통해값을할당할수있습니다. person.2 = 178.5
print("이름:\(person.0),나이:\(person.1),신장:\(person.2)")

//String, Int,Double 타입을갖는튜플
var typePerson:(name:String, age:Int, height:Double) = ("lucas",100, 178)
// 요소 이름을 통해서 값을 때 올수 있습니다.
print("이름:\(typePerson.name), 나이:\(typePerson.age), 신장:\(typePerson.height)")
typePerson.age = 99
typePerson.2 = 178.2
// 요소이름을통해값을할당할수있습니다.
// 인덱스를통해서도값을함당할수있습니다.
// 기존처럼인덱스를이용하여값을때올수도있습니다.
print( "이름:\(typePerson.0), 나이:\(typePerson.1), 신장:\(typePerson.2)")

// 타입별칭의 적용
typealias PersonTuple = (name:String, age:Int, height:Double)
let lucas: PersonTuple = ("lucas", 99, 178.2)
let neo: PersonTuple = ("neo", 15, 183.5)
print("이름:\(lucas.name), 나이:\(lucas.age), 신장:\(lucas.height)")
print("이름:\(neo.name), 나이:\(neo.age), 신장:\(neo.height)")
