///문자열 보간법
let name: String = "lucas"
print("My nams is \(name)")

//한줄주석
/*
 여러줄 주석
 */
/*
 /*
  중첩주석
  //중첩주석
  */
 */
///문서화 주석(마크업)
/**
 문서화 주석(마크업)
 */

///변수
var job = "programer"
var age: Int = 100
var heigth = 177.3          //타입추론
//print("\(type(of: heigth))")
age = 99
job = "developer"
print("저의 이름은 \(name)이고 직업은 \(job)입니다. 키는 \(heigth)센티미터 입니다.")

///상수
let sex: String = "man"
print("저의 이름은 \(name)이고 직업은 \(job)입니다. 키는 \(heigth)센티미터 \(sex) 입니다.")
