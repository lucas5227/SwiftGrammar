"""
///29. 메모리 안전
"""
/*29.1메모리접근충돌의이해*/
///코드를 통해 메모리에 접근하는 유형
//one이 저장될 메모리에 쓰기 접근
var one: Int = 1

//one이 저장된 위치에 읽기 접근
print("숫자 출력 : \(one)")
