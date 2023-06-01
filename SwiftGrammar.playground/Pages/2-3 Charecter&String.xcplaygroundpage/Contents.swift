"""
///Character
"""
let alphabetA: Character = "A"
print(alphabetA)

let 한글변수이름: Character = "ㄱ"
print("한글의 첫 자음: \(한글변수이름)")

"""
///String
"""
// 상수로선언된문자열은변경이불가능합니다.
let name: String = "lucas"
// 이니셜라이저를사용하여빈문자열을생성할수있습니다.
// var 키워드를사용하여 변수를생성했으므로 문자열의 수정및 변경이가능합니다.
var introduce: String = String()
//append() 메서드를사용하여문자열을이어붙일수있습니다.
introduce.append("제 이름은")
// +연산자를통해서도문자열을이어붙일수있습니다.1
introduce = introduce+" "+name+"입니다."
print(introduce)

// name에해당하는문자의수를셀수있습니다.
print("name의 글자수: \(name.count)")
// 빈문자열인지확인해볼수있습니다.
print( "introduce가비어있습니까?: \(introduce .isEmpty)")
// 유니코드의스칼라값을사용하면값에해당하는표현이출력됩니다- 어떤모양이출력되나요?
let unicodescalarValue: String = "\u{2665}" //--> ♥


// 연산자를 통한 문자열 결합
let hello: String = "Hello"
let lucas: String = "lucas"
var greeting: String = hello + " " + lucas + "!"
print(greeting)

// 연산자를통한문자열비교
var isSameString: Bool = false

isSameString = hello == "Hello"
print(isSameString) //true

isSameString = hello == "hello"
print(isSameString) //false

// 메서드를 통한 접두어, 저미어 확인
var hasPrefix: Bool = false
hasPrefix = hello.hasPrefix("He")
print(hasPrefix) //true

hasPrefix = lucas.hasPrefix("cas")
print(hasPrefix) //false

hasPrefix = hello.hasPrefix("Hello")
print(hasPrefix) //true

var hasSuffix: Bool = false
hasSuffix = hello.hasSuffix("He")
print(hasSuffix) //false

hasSuffix = hello.hasSuffix("llo")
print(hasSuffix) //true

hasPrefix = greeting.hasSuffix("lucas")
print(hasSuffix) //false

hasPrefix = greeting.hasSuffix("lucas!")
print(hasSuffix) //true

// 메소드를 통한 대소문자 변환
var covertedString: String = ""
covertedString = hello.uppercased()
print(covertedString) //HELLO

covertedString = greeting.uppercased()
print(covertedString) //HELLO LUCAS!

covertedString = greeting.lowercased()
print(covertedString) //hello lucas!

//프로퍼티를 통한 빈 문자열 확인
var isEmptyString: Bool = false
isEmptyString = greeting.isEmpty
print(isEmptyString) //false

greeting = "안녕"
isEmptyString = greeting.isEmpty
print(isEmptyString) //false

greeting = ""
isEmptyString = greeting.isEmpty
print(isEmptyString) //true

// 프로퍼티를 이용한 문자열길이확인
greeting = "안녕하세요"
print(greeting.count) //5

// 코드상에서여러줄의문자열을직접쓰고싶다면큰따옴표세개를사용하면됩니다.
// 큰따옴표세개를써주고한줄을내려써야합니다.
// 마지막줄도큰따옴표세개는한줄내려써야합니다.
greeting = """
안녕하세요 저는 \(lucas)입니다. Swift 잘 하고 싶어요!
잘 부탁합니다!
"""

print("문자열 내부에\n 이런(\"특수문자\"를\t사용하면 \\이런놀라운결과를볼수있습니다")
print(#"문자열 내부에서 특수문자를 사용하기 싫다면(\\) 문자열 앞,뒤에 #을붙여주세요"#)
let number: Int = 100
print(#"특수문자를사용하지않을때도문자열보간법을사용하고싶다면이렇게\#(number) 해보세요"#)
