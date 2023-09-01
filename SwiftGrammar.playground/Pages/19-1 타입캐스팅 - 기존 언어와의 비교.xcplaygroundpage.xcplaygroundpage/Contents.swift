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
publicstructI n t :FixedWidthInteger,SignedInteger{
/ *34...* publicinit(bitPatternx :UInt)
publici n i t ( _source:Float) publicinit?(exactlysource:Float)
publici n i t i _source:Double) publicinit?(exactlysource:Double)
publici n i t ( _source:Float8o) publicinit?(exactlysource:Float8D)
publicinit(bitPatternpointer:OpaquePointer?) publicinit(fromdecoder:Decoder)throws
publicinitsT_source:) whereT :BinaryFloatingPoint publicinit(bitPatternobjectID:ObjectIdentifier) publicinit‹›(bitPattern:UnsafekutablePointer«U?)
p u b l i cinit‹U›(bitPattern:UnsafePointer<U›?) publicinit(bitPattern:UnsafeMutableRawPointer?)
p u b l i c i n i t ( b i t P a t t e r n : UnsafeRawPointer?)
# 6 9 . .*
publicconvenienceinit?«›_text:S ,radix:I n t=default) whereS : StringProtocol
publicconvenienceinit(integerliteralvalue:Int)
3 56 件 •
 
