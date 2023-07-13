"""
///접근제어
"""
/*
 12-1 접근제어
 12-1-1 접근제어의 필요성
 12-1-2 모듈과 소스파일 키워드: import
 12-2 접근수준
 12-2-1 open
 12-2-2 public
 12-2-3 internal
 12-2-4 fileprivate
 12-2-5 private
 */
 
///스위프트 표준 라이브러리에 정의되어 있는 Bool 타입
/// A value type whose instances are either 'ture' or 'false'.
public struct Bool {
    /// Default-initialize Boolean value to 'false'.
    public init() {
        // Initialization logic, if needed
        // init의 바디가 있어야함
    }
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
"""
/// foundation 프레임워크에 정의되어있는 개방접근수준의 NSString글래스
open class NSString : NSObject, NSCopying, NSMutableCopying, NSSecureCoding {
    open var length: Int { get }
    open func character(at index: Int) -> unichar
    public init()
    public init?(coder aDecoder: NSCoder)
}
"""

"""
12-2-3 내부 접근수준 - internal
"""
/*
 * 기본적으로 모든요소에 암묵적으로 지장하는 기본접근수준입니다.
 * 내부 집근수준으로 지정된 요소는 소스파일이 속해있는 모듈 어디에서든 쓰일수 있다
 * 다만 그 모들을 가지다 쓰는 외부모듈에서는 접근할수 없다
 * 보통 외부에서 사용한 클래스나 구조체가 아니며. 모듈 내부에서 광역적으로 사용할 경우 내부 접근수준을 지정한다.
 */

"""
12-2-4 파일외부비공개 접근수준 - fileprivate
"""
/*
 * 요소가 구현된 소스파일 내부에서만 사용 가능
 * 외부에서 값이 변경되거나 함수를 호풀하면 안되는 경우 사용
 */

"""
12-2-5 비공개 접근수준 - private
"""
/*
 * 가장 한정적인 범위
 * 기능을 정의하고 구현한 범위 내에서만 사용 가능
 * 비곤대 접근수준으로 지정한 요소는 같은 소스파일 안에 구현한 다른 타입이나 기능에서도 사용 불가
 */

