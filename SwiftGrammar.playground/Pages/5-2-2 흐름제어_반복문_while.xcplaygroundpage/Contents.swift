"""
///흐름제어_반볻문_while
"""
///whille 반복구문의사용
var names: [String] = ["lucas", "Neo", "Trinity"]

while names.isEmpty == false {
    print("Good bye \(names.removeFirst())")
    //removeFirst 첫번째 요소를 삭제하면서 삭제한 요소를 반환
}
//Good bye lucas
//Good bye Neo
//Good bye Trinity
