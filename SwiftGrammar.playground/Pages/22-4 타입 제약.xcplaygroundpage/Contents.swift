"""
/// 타입 제약
계속해서 살펴본 제네릭 기능의 타입 매개변수는 실제 사용시 타입의 제약없이 사용할 수 있었습니다. 그러나 종종 제네릭 합수가 처리해야 할 기능이 특정타입에 한정되어야만 처리할 수 있다던가, 제네릭 타입을 특정 프로토콜을 따르는 타입만 사용할 수 있도록 제약을 두어야 하는 상황이 발생할 수 있다. 타입 제약은 타입 매개변수가 가져야 할 제약사항을 지정할 수 있는 방법입니다. 예를 들어 타입 매개변수자리에 사용할 실제 타일이 특정 클래스를 상속 받은 타입이어야 한다든지, 특정 프로토콜을 준수하는 타입 이어야 한다는 등의 제약을 줄 수 있다는 뜻dl다. 타입 제막은 클래스 타입 또는 프로토플로 만들 수 있다. 즉 열거형, 구조체등의 타입은 타입 제약의 타입으로 사용할 수 없다.
예를 들어 우리가 자주 사용하는 제네릭타입인 Dictionary의 키는 Hashable프로토콜을 준수하는 타입만 사용할 수. 있다.
"""

///Dictionary 타입 정의
/*
 Dictionary의 두 타입 매개변수는 Key와 value이다. 그런데 Key뒤에콜론(:) 을 붙인 다음에 Hashable이라고 명시되어 있다. 이는 타임 매개변수인 Key 타입은 Hashable 프로토콜을 준수 해야한다는 뜻이다. 즉, Key로 사용할 수 있는 타입 은 HashabLe 프로토콜을 준수하는 타임이어야 한다는 것이다. Hashable은 스위프트 표준 라이브러리에 정의 되어있 는 프로토콜이며 스위프트의 기본타입(tring, Int, Bool 등등)은 모두 Hashable 프로토콜을 준수한다. 제네릭 타임에 제약을 주고 싶으면 타입 매개변수 뒤에 콜론을 붙인후 원하는 클래스타입 또는 프로토콜을 명시하면 된다.

 public struct Dictionary<Key : Hashable, Value> : Collection, ExpressibleByDictionaryLiteral { /*...*/ }

 */

/// 제네릭 타입 제약
/*
 기존에 타입 제약없이 구현해 보았던 swapTwovalues(_:_:) 함수와 Stack구조체에 타입 제약을 준 것이다. 코드에서 보다시피 타입 매개변수 뒤에 콜론을 붙이고 제약조건으로 주어질 타입을 명시해주면 된다. 여러 제약을 추가하고 싶다면 콤마로 구분 해주는 것이 아니라 where절(26장)을 사용할 수 있다. Stack구조체의 Elenent타입매개변수의타입을Hashable프로토콜을준수하는타입으로제약을준다면, Any타입은 Hashable프로토콜을 준수하지 않기 때문에 [코드22- 3]에서 사용했던 Any타입은 사용할 수없을 것이다.
 */
func swapTwoValues<T: BinaryInteger>(_ a: inout T, _ b: inout T) {
    // 함수 구현
}

struct Stack<Element: Hashable> {
    // 구조체 구현
}

///제네릭 타입 제약 추가
/*
 위의 코드는 사실 의도했던 완벽한 조건을 갖추지는 못했다. 의도는 T에 정수도, 실수도 들어올 수 있게 구현하고 싶었지만 그렇게 하려면 합수를 중복 정의해 주어야 한다. 다만 where를 사용하여 제약을 추가할 수는 있다. 즉, 아래의 T는 BinaryInteger 프로토콜을 준수하고, FloatingPoint 프로토콜도 준수하는 타입만 사용할 수 있다.우리가 특별히 사용자정의 타입을 만들어 구현하지 않는 한, 저 조건에 맞는 기본 타입은 없다. 결국 이런 상황에서는 앞서 말했듯 합수를 중복 정의하거나 새로운(프로토콜)타입을 정의해서 사용하는 등 다른 방법을 사용해야한다. 이레 코드에 사용된 where절에 대해서는 26장에서 상세히 디룬다.
 타입 제약을 실제로 사용할밥한 예를 생각해보면 뺄셈 정도를 생각해볼 수 있다.
 */
func swapTwoValues<T: BinaryInteger>(_ a: inout T, _ b: inout T) where T:
FloatingPoint {
    //함수구현
}

/// substractTwoValue 힘수의 잘못된 구현
/*
 이번 코드에서 타입 매개변수인 T의 타입을 BinaryInteger 프로토콜을 준수하는 타입으로 한정해두니 뺄셈 연산이 가능하게 되었다. 이처럼 타입 제약은 합수 내부에서 실행 해야 할 연산에 따라 적절한 타입을 전달 받을 수. 있도록 제약을 둘 수. 있다. 다시 [ 22-1 코드의 **연산자를 보면 타입 매개변수(T)가 BinaryInteger라는 특정 프로토콜을 준수할 때 제네릭 함수인 연산자를 사용 할수 있도록 타입을 제약 해준 것이다.
 */
func substractTwoValue<T: BinaryInteger>(_ a: T, _ b: T) -> T {
    return a - b
}

///substractTwoValue함수의 구현
func substractTwoValue2<T:BinaryInteger>(_ a :T ,_ b:T ) -> T {
    return a - b
}
