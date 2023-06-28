"""
///구조체 struct
"""
/*
 struct 구토체 이름 {
 픠로퍼티와 메서드들
 */
///Basiclnformation 구조체 정의
struct BasicInformation {
    var name: String
    var age: Int
}


///Basiclnformation 구조체의 인스턴스 생성및사용
//프로퍼티이름(name,age)으로자동생성된이니셜라이저를사용하여구조치를생성합니다.
var lucasInfo: BasicInformation = BasicInformation(name: "lucas", age: 99)
lucasInfo.age = 100 //변경가능
lucasInfo.name = "oracle" //변경가능
//프로퍼티이름(name, age)으로 자동생성된 이니셜라이저를 사용하여 구조체를 생성합니다.
let neoInfo: Basicinformation = BasicInformation(name:"noe", age: 33)
//neoInfo.age = 100 //변경불가 오류!
//trinityInfo.age = 30 // 변경불가!
