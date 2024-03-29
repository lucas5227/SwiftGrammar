"""
///28-2 오류의 표현
스위프트에서 오류는 Error라는 프로토콜을 준수하는 타입의 값을 통해 표현한다. Error 프로토콜은 사실상 요구사항이 없는 빈 프로토콜 일 뿐이지만, 오류를 표현하기 위한 타입(주로 열거형)은 이 프로토콜을 채택한다.
스위프트 의열거형은 오류의 종류를 나타내기에 아주 적합한 기능으로 연관값(4.5.3)을 통해 오류에 관한 부가정보를 제공할 수도 있다.
프로그랩내에서 자관기를 작동시키려고 할 때 발생하는 오류의 종류를 열거형으로 표현한 것이다.
"""

///자판기 동작오류의 종류물 표현한 VendingMachineEror열거형
enum VendingMachineError: Error {
    case invalidSelection
    case insufficientFunds(coinssNeeded: Int)
    case outOfStock
}
