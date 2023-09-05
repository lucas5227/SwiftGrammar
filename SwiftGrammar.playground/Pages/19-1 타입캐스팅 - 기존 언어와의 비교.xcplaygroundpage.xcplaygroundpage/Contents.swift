"""
///타입캐스팅 - 기존 언어와의 비교
"""
///C언어와스위프트의데이터타입변환비교
/*
// C언어
double value = 3.3
int convertedValue = (int)value
convertedValue = 5.5 //double->int암시적데이터타입변환

//스위프트
var value:Double = 3.3
var convertedValue: Int =  Int(value)
convertedValue = 5.5
*/

///Int구조체의다양한이니셜라이저정의
/*
public struct Int: FixedWidthInteger,SignedInteger{
    /* 중략 */
    public init(bitPatternx: UInt)
    public init( _source: Float)
    public init?(exactlysource:Float)
    public init( _source: Double)
    public init?(exactlysource:Double)
    public init( _source: Float32)
    public init?(exactlysource:Float8D)
    public init(bitPatternpointer: OpaquePointer?)
    public init(fromdecoder: Decoder)throws
    public init sT_source:) whereT :BinaryFloatingPoint
    public init(bitPatternobjectID:ObjectIdentifier)
    public init<U>(bitPattern: UnsafekutablePointer<U>?)
    public init<U>(bitPattern: UnsafePointer<U>?)
    public init(bitPattern: UnsafeMutableRawPointer?)
    public init(bitPattern: UnsafeRawPointer?)
    /* 중략 */
    public convenience init?<S>(_text:S, radix: Int = default)
        where S : StringProtocol
    public convenience init(integer literalvalue:Int)
    public convenience init()
    public convenience init?<T>(exactly source T) where T : BinaryFloatingPoint
    public convenience init(littleEndian value: Int)
    public convenience init(bigEndian value: Int)
    public convenience init<Other>(clamping source: Other)
        where Other : BinaryInteger
    public convenience init<T>( _ source: T) where T : BinaryInteger
    public convenience init?<T>(exactly source: T) where T : BinaryInteger
    /* 중략 */
}
*/

/// 실패 가능한 I nt 이니셜라이저
var stringValue: String = "123"
var integerValue: Int? = Int(stringValue)

print(integerValue)         //Oprional(123)

stringValue = "A123"
integerValue = Int(stringValue)

print(integerValue)     //nil == Optional.none
