"""
///접근제어
"""
/*
 12-1 접근제어
 12-1-1 접근제어의 필요성
 12-1-2 모듈과 소스파일 키워드: import
 12-2 접근수준
 12-2-1 open
 12-2-1 public
 12-2-1 internal
 12-2-1 fileprivate
 12-2-1 private
 */
 
///스위프트 표준 라이브러리에 정의되어 있는 Bool 타입
/// A value type whose instances are either 'ture' or 'false'.
public struct Bool {
    /// Default-initialize Boolean value to 'false'.
    public init()
}

"""
12-2-2 개방 접근수준 - open
"""
/*
 * 개방접근수준을 제외한 다른 모든 접근수준의 클래스는 그클래스가 정의된 모듈 안에서만 상속할수 있습니다.
 * 개방 접근수준을 제외한 다른 모든 접근수준의 클래스 멤버는 해당멤버가 정의된 모듈안에서만 재정의 할수있습니다.
 * 개방 접근수준의 클래스는 그 클래스가 정의된 모듈밖의 다른 모듈에서도 상속할수 있다.
 * 개방 접근수준의 클래스 멤버는 해당멤버가 정의된 모듈밖의 다른 모델에서도 재정의 할수있다.
 */
/// foundation 프레임워크에 정의되어있는 개방접근수준의 NSString글래스
open class NSString : NSObject, NSCopying, NSMutableCopying, NSSecureCoding {
    open var length: Int { get }
    open func character(at index: Int) -> unichar
    public init()
    public init?(coder aDecoder: NSCoder)
}
