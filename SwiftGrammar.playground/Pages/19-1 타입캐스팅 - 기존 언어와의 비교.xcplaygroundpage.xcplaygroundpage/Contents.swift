"""
///타입캐스팅 - 기존 언어와의 비교
"""

///C언어와스위프트의데이터타입변환비교
/*
// C언어
double value = 3.3
int convertedValue = (int)ValueTransformer
convertedValue = 5.5            // double -> int 암시적 데이터 타입 변환

// Swift
var value = 3.3
var convertedValue: Int = Int(value)
convertedValue = 5.5            //err!
*/

///Int구조체의다양한이니셜라이저정의
public struct Int: FixedWidthInteger,SignedInteger{
    /* 중략...*/
    public init(bitPatternx :UInt)
    public init(_source: Float)
    public init?(exactlysource: Float)
    public init(_source: Double)
    public init?(exactlysource: Double)
    public init(_source: Float8o)
    public init?(exactlysource: Float80)
    public init(bitPatternpointer: OpaquePointer?)
    public init(fromdecoder: Decoder) throws
    public init<T>(_source: T) where T :BinaryFloatingPoint
    public init(bitPatternobjectID: ObjectIdentifier)
    public init<U>(bitPattern:UnsafekutablePointer<U>?)
    public init<U>(bitPattern:UnsafePointer<U>?)
    public init(bitPattern: UnsafeMutableRawPointer?)
    public init(bitPattern: UnsafeRawPointer?)
    
    /* 중략...*/
public convenienceinit?«›_text:S ,radix:I n t=default) whereS : StringProtocol
public convenienceinit(integerliteralvalue:Int)
public convenienceinit()
public convenienceinit?<(exactlysource:T )whereT : BinaryFloatingPoint
public convenienceinit(littleEndianvalue:Int)
public convenienceinit(bigEndianvalue:I n t )
public convenienceinit<Other›(clampingsource:Other) whereO t h e r: BinaryInteger
public convenienceinit<T›(truncatingIfNeededsource:T) whereT : BinaryInteger
public convenienceinit‹M_source:T)whereT : BinaryInteger publicconvenienceinit?‹(exactlysource:T )whereT : BinaryInteger

    /* 중략...*/
I nt 의이니셜라이저는대부분실패하지않는이니셜라이저로정의되어있습니다. 그러나좀 더살펴보면실패가능한이니셜라이저도포함되어있습니다. stringProtocol 타입을매개 변수로받는p ubLi c c onveni ence i ni ts ( _t ext : S, r adix: I nt = d ef aul t ) wheres : stringProtocol*가실패가능한이니셜라이저입니다.StringProtoco!타 입의데이터t ext 를I nt 타입으로변경할때, 적절하지못한대개변수가전달된다면새로운 인 스턴스가생성되지않을수있다는뜻입니다.
코 드1 9 - 3 실 패가능한I nt 이니셜라이저
v a rstringValue:S t r i n g= "123"
v a rintegerValue:I n t ?= In(stringValue)
print(integerValue)/ /Optional(123)
stringValue= "A123* integerValue=Int(stringValue)
print(integerValue)/ /nil= Optional.none

