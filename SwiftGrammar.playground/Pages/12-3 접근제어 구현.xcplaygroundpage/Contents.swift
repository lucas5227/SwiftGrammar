"""
///접근제어 구현
"""
///접근 수준을 명기한 각 요소들의 예
open class OpenClass {
    open var openProperty: Int = 0
    public var publicProperty: Int = 0
    internal var internalProperty: Int = 0
    fileprivate var filePrivateProperty: Int = 0
    private var privateProperty: Int = 0
    
    open func openMethod() {}
    public func publicMethod() {}
    internal func internalMethod() {}
    fileprivate func fileprivateeMethod() {}
    private func privateMethod() {}
}

public class PublicClass {}
public struct PublicStruct {}
public enum PublicEnum {}
public var PublicVariable = 0
public let PublicConstant = 0
public func PublicFunction() {}

internal class InternalClass {}             // internal 키워드는 생략해도 무관하다.
internal struct InternalStruct {}
internal enum InternalEnum {}
internal var InternalVariable = 0
internal let InternalConstant = 0
internal func InternalFunction() {}

fileprivate class FileprivateClass {}
fileprivate struct FileprivateStruct {}
fileprivate enum FileprivateEnum {}
fileprivate var FileprivateVariable = 0
fileprivate let FileprivateConstant = 0
fileprivate func FileprivateFunction() {}

private class PrivateClass {}
private struct PrivateStruct {}
private enum PrivateEnum {}
private var PrivateVariable = 0
private let PrivateConstant = 0
private func PrivateFunction() {}
