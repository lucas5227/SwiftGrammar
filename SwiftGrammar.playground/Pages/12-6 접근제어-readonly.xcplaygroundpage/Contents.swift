"""
///접근제어-읽기 전용 read only
"""
/*
 선정자()만 더 낮은 접근수준을 갖도록 제한한다.
 접근수준 키워드 뒤에 접근수준(set)처럼 표현하면 지정가ㄴ능하다
 선정아 접근수준 제한은 프로퍼티, 서브스크립트, 변수등에 적용 가능하고 그 수준은 같거나 낮은 수준으로 제한해야한다.
 */

/// 설정자의 접근수준 지정
public struct SomeType {
    // 비공개 접근수준 저장 프로퍼티 count
    private var count: Int = 0
    
    // 공개 접근수준 저장 프로퍼티 publicStoredProperty
    public var publicStoredProperty: Int = 0
    
    // 설정자는 비공개 접근수준
    public private(set) var publicGetOnlyStoredProperty: Int = 0
    
    //내부 접근수준 저장 프로퍼티 internalCoputedProperty
    internal var internalCoputedProperty: Int {
        get {
            return count
        }
        
        set {
            count += 1
        }
    }
    
    // 내부 접근수준 저장 프로퍼티 internalGetOnlyCComputedProperty
    // 설정자는 비공개 접근수준
    internal private(set) var internalGetOnlyCComputedProperty: Int {
        get{
            return count
        }
        
        set {
            count += 1
        }
    }
    
    // 공개 접근수준 서브스크립트
    public subscript() -> Int {
        get {
            return count
        }
        
        set {
            count += 1
        }
    }
    
    // 공개 접근수준 서브스크립트
    // 설정자는 내부 접근수준
    public internal(set) subscript(some: Int) -> Int {
        get {
            return count
        }
        
        set {
            count += 1
        }
    }
}

var someInstance: SomeType = SomeType()

// 외부에서 접근자, 설정자 모두 사용 가능
print(someInstance.publicGetOnlyStoredProperty)                         //0
someInstance.publicStoredProperty = 100

// 외부에서 접근자, 설정자 모두 사용 가능
print(someInstance.publicGetOnlyStoredProperty)                         //0
//someInstance.publicGetOnlyStoredProperty = 100                        //err

// 외부에서 접근자, 설정자 모두 사용 가능
print(someInstance.internalGetOnlyCComputedProperty)                    //0
someInstance.internalCoputedProperty = 100

// 외부에서 접근자만 사용 가능
print(someInstance.internalGetOnlyCComputedProperty)                    //1
//someInstance.internalGetOnlyCComputedProperty = 100                   //err

// 외부에서 접근자, 설정자 모두 사용 가능
print(someInstance[])                                                   //1
someInstance[] = 100

// 외부에서 접근자만, 같은 모둘 내에서는 설정자도 사용 가능
print(someInstance[0])                                                  //2
someInstance[0] = 100
