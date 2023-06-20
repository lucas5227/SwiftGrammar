"""
///기본적인 함수의 정의와 호출
"""
/*
func 함수이름(매개변수이름) -> 반환타입 {
    실행구문
    return 반환값
}
*/

///가본형태의함수정의와사용
func hello(name: String) -> String {
    return "Hello \(name)!"
}

func introduce(name: String) -> String {
    //[return "제 이름은 " + name + "입니다"] 과 같은 동작수행
    "제 이름은 " + name + "입니다"
}

let introduceLucas: String = introduce(name: "Lucas")
print(introduceLucas) //제 이름은 Lucas입니다

