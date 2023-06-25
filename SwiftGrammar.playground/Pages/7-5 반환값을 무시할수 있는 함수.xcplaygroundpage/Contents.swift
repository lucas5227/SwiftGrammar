"""
///반환값을 무시할수 있는 함수 @discardableResult
"""
/*
 @discardableResult 선언으로 함수의 반환값을 무시한다.
 */

///@discardableResult 선언 속성 사용
func say(_ something: String) -> String {
    print(something)
    return something
}

@discardableResult func discardableResultSay(_ somthing: String) -> String {
    print(somthing)
    return somthing
}

//반환값을사용하지 않았으므로컴파일러가경고를표시할수 있습니다.
say("hello") //hello
// 반환값을 사용하지 않을 수 있다고 미리알렸기 때문에 반환값을 사용하지 않아도 컴파일러가 경고하지 않습니다
discardableResultSay("hello") //hello
