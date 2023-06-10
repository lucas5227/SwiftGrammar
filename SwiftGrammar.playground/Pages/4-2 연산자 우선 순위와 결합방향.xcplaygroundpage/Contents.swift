"""
///연산자 우선 순위와 결합방향
"""
infix operator === : ComparisonPrecedence
infix operator -= : ComparisonPrecedence
infix operator &= : AssignmentPrecedence
infix operator % : MultiplicationPrecedence
infix operator & : MultiplicationPrecedence
infix operator > : ComparisonPrecedence
infix operator / : MultiplicationPrecedence
infix operator != : ComparisonPrecedence
infix operator <= : ComparisonPrecedence
infix operator ?? : NilCoalescingPrecedence
infix operator ^= : AssignmentPrecedence
infix operator == : ComparisonPrecedence
infix operator >>= : AssignmentPrecedence
infix operator |= : ComparisonPrecedence
infix operator ..< : RangeFormationPrecedence
infix operator << : BitwiseShiftPrecedence
infix operator >> : BitwiseShiftPrecedence
infix operator || : LogicalConjunctionPrecedence
infix operator <: ComparisonPrecedence
infix operator <<= : AssignmentPrecedence
infix operator %= : AssignmentPrecedence
infix operator += : AssignmentPrecedence
infix operator *= : AssignmentPrecedence
infix operator -> : DefaultPrecedence
infix operator -= : AssignmentPrecedence
infix operator ... : RangeFormationPrecedence
infix operator /= :AssignmentPrecedence
infix operator >= : ComparisonPrecedence
infix operator && : LogicalConjunctionPrecedence
infix operator * : MultiplicationPrecedence
infix operator &* : MultiplicationPrecedence
infix operator !==: ComparisonPrecedence
infix operator ^ : AdditionPrecedence
infix operator & : AdditionPrecedence
infix operator + : AdditionPrecedence
infix operator &-: AdditionPrecedence
infix operator - : AdditionPrecedence

//우선그룹
precedencegroup BitwiseShiftPrecedence{
    higherThan:MultiplicationPrecedence
}
precedencegroup FunctionArrowPrecedence{
    associativity: right
    higherThan: AssignmentPrecedence
}
precedencegroup MultiplicationPrecedence{
    associativity: left
    higherThan: AdditionPrecedence
}
precedencegroup TernaryPrecedence{
    associativity: right
    higherThan:FunctionArrowPrecedence
}
precedencegroup DefaultPrecedence{
    higherThan:TernaryPrecedence
}
precedencegroup LogicalDisjunctionPrecedence{
    associativity: left
    higherThan: TernaryPrecedence
}
precedencegroup LogicalConjunctionPrecedence{
    associativity: left
    higherThan:LogicalDisjunctionPrecedence
}
precedencegroup ComparisonPrecedence{
    higherThan: LogicalConjunctionPrecedence
}

precedencegroup NilCoalescingPrecedence{
    associativity: right
    higherThan:ComparisonPrecedence
}

precedencegroup AdditionPrecedence{
    associativity: left
    higherThan : RangeformationPrecedence
}
precedencegroup CastingPrecedence{
    higherThan: RangeformationPrecedence
}
precedencegroup AssignmentPrecedence{
    associativity: right
    assignment: true
}
precedencegroup RangeFormationPrecedence{
    higherThan: CastingPrecedence
}

"""
연산자우선순위그룹이름                         결합방향                        할당방향사용
DefaultPrecedence                       none                          false
BitwiseShiftPrecedence                  none                          false
MultiplicationPrecedence                left                          false
AdditionPrecedence                      left                          false
RangeFormationPrecedence                none                          false
CastingPrecedence                       none                          false
NiCoalescingPrecedence                  right                         false
ComparisonPrecedence                    none                          false
LogicalConjunctionPrecedence            left                          false
LogicalDisjunctionPrecedence            left                          false
TernaryPrecedence                       right                         false
AssignmentPrecedence                    right                         false
FunctionArrowPrecedence                 right                         false
"""
let intValue: Int = 1
let resultValuel: Int = intValue << 3 + 5           //8 + 5 => 13
let resultValue2: Int = 1 * 3 + 5                   //3 + 5 => 8
