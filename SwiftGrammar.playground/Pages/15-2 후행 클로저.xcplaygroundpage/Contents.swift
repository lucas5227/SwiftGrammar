"""
///후행 클로저 Trailing Closures
"""
/*
 클로저가 길어지거나 가독성이 떨어질때 사용
 단, 후행클로저는 맨 마지막 전달인자로 전달되는 클로저에만 해당되므로 전달인자로 클로저 여러개를 전달할때는 맨 마지막 클로저만 후행 클로저로 사용할 수 있다. 또한 sorted(by:) 메서드처럼 단 하나의 클로저만 전달인자로 전달하는 경우에는 소괄호를 생략해줄 수도 있다.
 */
/// 후행 클로저 표현
// 후행 클로저의 사용
let names : [String] = [String]()

let reversed: [String] = names.sorted() {
    (first: String, second: String) -> Bool in
    return first > second
}

// sorted(by:) 메서드의 소괄호까지 생략 가능합니다.
let reserved: [String] = names.sorted { (first: String, second: String) -> Bool in
    return first > second
}
