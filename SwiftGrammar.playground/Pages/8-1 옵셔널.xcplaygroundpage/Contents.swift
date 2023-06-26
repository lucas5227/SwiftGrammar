"""
///옵셔널 사용
"""
/*
 한수형 프로그래밍 패러다임에서 자주 등장하는 모나드 개념과 동일
 옵셔널의 사용은 많은 의미를 축약하여 표험하는것과 같다.옵셔널을 읽을때 해 당변수 또는 상수에는 없이 없을수 있다. 즉, 번수또는 상수가 nil일수도 있으므로사용에 주의하라는 뜻으로 직관적으로 반아들일수 있다. 없이 없는 윤셔널변수 또는 상수에(강재료) 접근하려면 런타임 오류가 발싱한다 그렇게 되면 OS가 그코그램이 강제종료시킬 확률이 매우 높습니다.
 */
/*
 var myName: String = "lucas"
 myName = nil //오류
 */

var myName: String? = "lucas" //var myName: Optional<String>
print(myName) //lucas
// 옵셔널타입의값을print한수를뭉해출력하면
// optional("yagom' )이라고출력되는것이정상입니다. 11다만, 차후의주석표현의편의를위하여
// Optional()은생략하고값만표기하도록하겠습니다.
// 또,옵셔널타입의값을print 함수의매개번수로전달하면 11 컴파일러경고가발생할수있습니다.
// 정상이므로놀라지않아도됩니다.
myName = nil

print(myName) //nil

/*
///원시값을 동한 열거형 초기화
let primary = School(rawValue: "유치원")   //Primary
let graduate = School(rawValue: "석박사")   //nil

let one = Numbers(rawValue: 1) // One
let three = Numbers(rawValue: 3) // nil
*/
/*
///옵셔널 열거형의 정의
public enum Optional<Wrapped> : ExpressibleByNilLiteral {
    case none
    case some(Wrapped)
    public init(_ some: Wrapped)
    /// 중략...
}
//옵셔널이 값을 갖는 케이스와 그렇지 못한 케이 스 두가지로 정의되어. 즉, nil일때는 none케이스가 될것이고, 값이 있는 경우는 some케이스가 되는데, 연 관값으로 Wrapped가 있습니다. 따라서 옵셔널에 값이 있으면 some의 연관값인 wraped에 없이 할당된다. 즉,값이 옵서널이라는 열거형의 방패막에 보호되어 래핑되어있는 모습이라는 것.
//옵셔널자체가 열거형이기때문에 옵셔널변수는 switch구문을 통해 값이 있고 없음을 확인할수 있습니다.
*/

///switch를  통한 옵셔널 값의 확인
func checkOprionalValue(value optionalValue: Any?) {
    switch optionalValue {
    case .none:
        print("This Optional varoable is nil")
    case .some(let value):
        print("Value is \(value)")
    }
}

var myName2: String? = "lucas"
print(myName2)
checkOprionalValue(value: myName2) //Value is lucas

/// witch를통한옵셔널값의확인
let numbers: [Int?] = [2, nil, -4, nil, 100]

for number in numbers {
    switch number {
    case .some(let value) where value < 0:
        print("Negative calue!! \(value)")
    case .some(let value) where value > 10:
        print("Large calue!! \(value)")
        
    case .some(let value):
        print("Value \(value)")
        
    case .none:
        print("nil")
    }
}

//Value 2
//nil
//Negative calue!! -4
//nil
//Large calue!! 100
