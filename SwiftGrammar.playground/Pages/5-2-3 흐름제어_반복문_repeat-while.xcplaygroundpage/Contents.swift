"""
///흐름제어_반볻문_repeat-while
"""
///do-while
var names: [String] = ["lucas", "Neo", "Trinity"]

repeat {
    print("Good bye \(names.removeFirst())")
}while names.isEmpty == false
//Good bye lucas
//Good bye Neo
//Good bye Trinity
