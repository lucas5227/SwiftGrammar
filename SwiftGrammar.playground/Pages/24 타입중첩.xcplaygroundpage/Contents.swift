"""
///24 타입 중첩

열거형은 특징 클래스나 구조체의 기능을 명확히 사용하기에 용이하다. 그러나 굳이 클래스나 구조체 외부에서는 열거형을 사용할 필요가 없을 때도 있다. 즉, 클래스나 구조치 내부에서 자신의 역할을 충실히 할 수. 있도록 역할을 구분짓는 열거형을 선언해주고 자신의 내부에서만 사용할 수 있기를 원할 수 있다. 또는 특정 데이터 타입들을 하나의 클래스나 구조체에 구현하여 외부와의 혼선을 피하고 싶을 수도 있다.
어떤 이유가 되었든, 스위프트에는 타입 내부에 타입을 정의하고 구현할 수 있다. 이처럼 타입 내부에 새로운 타입을 선언해준 것을 중접 타입이라고 부릅니다. 타입 내부에 새로운 타입을 정의하고 싶다면, 자신의 정의 내부에 새로운 타입을 정의하고 구현하기만 하면 된다.
"""
