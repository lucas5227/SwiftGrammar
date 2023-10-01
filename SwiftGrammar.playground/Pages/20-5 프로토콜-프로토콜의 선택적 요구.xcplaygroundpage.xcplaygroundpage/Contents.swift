"""
///프로토콜 - 프로토콜의 선택적 요구 @objc
///objc속성을 사용하려면 애플의 Foundation프레임워크 모들을 임포트해야한ㄷ.
"""
///프로토콜의 선택적 요구
import Foundation

@objc protocol Noveable {
    func walk()
    @objc optional func fly()
}

//걷기만 할 수 있는 호랑이
class Tiger: NSObject, Noveable {
    func walk() {
        print("Tieger walks")
    }
}

