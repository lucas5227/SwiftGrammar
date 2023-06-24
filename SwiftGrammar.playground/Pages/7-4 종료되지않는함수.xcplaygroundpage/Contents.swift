"""
///종료되지않는 함수
"""
/*
 스위프트에는 종료(return) 되지 않는 험수가 있습니다. 종료되지 않는다는 의미는 정상적으로 끝나지 않는 함수라는 뜻입니다. 이를 비반환 함수  또는 비반환 메서드 Nonreturning fucntion라고 합니다. 비반한함수(메서드)는 정상적 으로 끝날수 없는 합수입니다. 이함수를 실행하면 프로세스동작은 끝났다고 볼수 있습니다. 왜 이런 이름을 붙이게 되었을까요? 비반한할수안에서는 오류를 던진다든가?. 증대한 시스템 오류를 보고하는등의 일을 하고 프로세스를 종료해버리기 때문입니다. 비반한함수는 어디서든 호출이 가능하고 guard구문의 else블록에서도 호출할수 있습니다. 비반환메서드는 재정의는 할수 있지만 비반환타입이라는것은 변경할수 없습니다.

 */
///비반환 함수의 정의와 사용
func crashAndBurn() -> Never {
    fatalError("Something vrey, Very bad happend")
}

func someFunction(isAllIsWell: Bool) {
    guard isAllIsWell else {
        print("마율에도둑이들었습니다!")
        crashAndBurn()
    }
    print("All is well")
}

someFunction(isAllIsWell: true) //All is well
someFunction(isAllIsWell: false) //마물에 도둑이 들었습니다!
//프로세스종료후오류보고
