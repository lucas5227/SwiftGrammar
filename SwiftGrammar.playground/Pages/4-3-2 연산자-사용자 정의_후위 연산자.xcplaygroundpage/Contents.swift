"""
///사용자 정의 연산자_중위 연산자
"""
//중위 연산자는 우선순위 그룹을 명시해줄수 있습니다.
/*
precedencegroup 우선순위_그룹이름 {
    higherThan: 더_낮은순위_그룹이름
    lowerThan: 더_높은순위_그룹이름
    associativity: 결합방향(left / right / none)
    assignment: 할당방향사용(true / false)
}
*/
/*
 결합방향이 있는 더하기(+) 또는 빼기 (-) 등의 연산자는 1 + 2 + 3 과 같이 연산 해줄수 있고. 3 - 2 - 1 과 같이 연산 해줄수 있습니다. 결합 방향이 있는 연산자는 섞어서 1 + 2 - 3 처럼도 사용할수 있습니다. 그렇지만 결합방향이 없는 부등호연산자(<)의 검우에는 연달아 사용해 줄수 없습니다. 1 < 2 < 3과 같은 모양으로 사용할수 없다는 뜻입니다.
 니다. 그렇지만결합방향이없는부등호연산자(<) 의검우에는연달아사용해줄수없습니다. 1 < 2<3과같은모양으로사용할수없다는뜻입니다.
 연산자 우선순위 그룹의 assignment는 옵셔널체이닝과 관련된사항입니다. 연산자가 옵셔널체이닝을 포합한 연산에 포함되어 있을 경우 연산자의 우선순위를 지정합니다. true로 설정 해주면 해당 우선순위 그룹에 해당하는 연산자는 옵셔널체이닝을 할때 표준라 이브러리의 할당연산자와 동일한 결합방향 규칙을 사용합니다. 즉, 스위프트의 할당연산자는 오른쪽 결합을 사용하므로 assignment를 true로 설정하면 연산자를 사용하여 옵셔널 채이닝을 할때 오른쪽부터 체이닝이 시작된다는 뜻입니다. 그렇지않고 false를 설정하거나 assignment를 따로 명시해주지 않으면 해당우선순위그룹에 해당하는 연산자는 할당을 하지않는 연산자와 같은 옵셔널체이닝규칙을 따릅니다. 즉, 연산자에 옵셔널체이닝기능이 포합되어 있다면 왼쪽부터 옵셔널제이닝을 하게됩니다.
 */

///중위연신자의정의
infix operator ** : MultiplicationPrecedence

// 중위연산자의 구현과 사용
//String타입의 contains(_: )메서드를 사용하기 위해 Foundation 프레임워크를 임포트합니다.
import Foundation
//infix operator **: MultiplicationPrecedence
func ** (Ihs: String, rhs: String) -> Bool {
    return Ihs.contains(rhs)
}
let helloLucas: String = "Hello lucas"
let lucas: String = "lucas"
let isContainsLucas: Bool =  helloLucas ** lucas //true

///클래스및구조체의비교연산자구현
class Car{
    var modelYear: Int?                 //연식
    var modelName: String?              //모델이름
}
struct SmartPhone{
    var company: String?                    //제조사
    var model: String?                      //모델
}
// Car클래스의 인스턴스끼리 ==연산했을때 modeIName이 같다면 true을 반환
func == (Ihs:Car,rhs:Car) -> Bool{
    return Ihs.modelName == rhs.modelName
}
//SmartPhone 구조체의 인스턴스끼리 == 연산했을때 mode1이 같다면 true를 반환
func == ( Ihs: SmartPhone, rhs: SmartPhone) -> Bool {
    return Ihs.model == rhs.model
}
let myCar = Car()
myCar.modelName = "S"
let yourCar = Car()
yourCar.modelName = "S"
var myPhone = SmartPhone()
myPhone.model = "SE"
var yourPhone = SmartPhone()
yourPhone.model = "6"
print( myCar == yourCar) //true
print( myPhone == yourPhone) //false

//타입메서드로구현된시용자정의비교연산자
class Car2{
    var modelYear: Int?                 //연식
    var modelName:String?               //모델이름
}
struct SmartPhone2 {
    var company: String?                //제 조사
    var model: String?                  //모델
    // SmartPhone 구조체의 인스턴스끼리 == 연산했음때 model이 같다면 true을 반환
    static func == (lhs: SmartPhone2, rhs: SmartPhone2) -> Bool {
        return Ihs.model == rhs.model
    }
}
