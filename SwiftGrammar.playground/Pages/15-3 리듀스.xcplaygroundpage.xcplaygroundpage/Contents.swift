"""
///리듀스
"""
/*
 리듀스 기능은 사실 결합이라고 불려야 하는 기능이다. 리듀스는 컨테이너내부
 의 콘텐츠를 하나로 합하는 기능을 실행하는 고차 합수이다. 배열이 라면 배열의 모 든값을 전달인자로 전달받은 클로저의 연산 결과로 합해준다.
 스위프트의 리듀스는 두가지 형태로 구현되어 있다. 첫번째 리듀스는 클코저가 각 요소를 전달 받아 연산한 후 값을 다음 클로저 실행을 위해 반환하며 컨테이너를 순환하는 형태이다.
 */
"""
public func reduce<Result>(_ initialResult: Result, _ nextPartialResult: (Result, Element) throws -> Result) rethrows -> Result
"""


