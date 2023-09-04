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
public struct Int: FixedWidthInteger,SignedInteger{
    /* 중략 */
    public init(bitPatternx: UInt)
    public init( _source: Float) public init?(exactlysource:Float)
    public init( _source: Double) public init?(exactlysource:Double)
    public init( _source: Float32) public init?(exactlysource:Float8D)
    public init(bitPatternpointer: OpaquePointer?) publicinit(fromdecoder:Decoder)throws
    public init sT_source:) whereT :BinaryFloatingPoint publicinit(bitPatternobjectID:ObjectIdentifier) publicinit‹›(bitPattern:UnsafekutablePointer«U?)
    public init<U>(bitPattern: UnsafePointer<U>?) public init(bitPattern: UnsafeMutableRawPointer?)
    public init(bitPattern: UnsafeRawPointer?)
    /* 중략 */
    public convenience init?«›_text:S ,radix:I n t=default) whereS : StringProtocol
    public convenience init(integerliteralvalue:Int)
    /* 중략 */
}
