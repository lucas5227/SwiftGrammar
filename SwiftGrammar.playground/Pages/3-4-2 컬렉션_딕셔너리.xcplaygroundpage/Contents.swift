"""
///딕셔너리
"""
//순서없이키와값의쌍으로구성되는컬렉션타입
//중복해서사용할수없습니다.
// typealias를 통해 조금 더 단순하게 표현해 볼수도 있습니다.
typealias StringIntDictionary = [String: Int]

// 키는String, 값은Int 타입인빈딕셔너리를생성합니다.
var numberForName: Dictionary<String, Int> = Dictionary<String, Int>()

// 위선언과같은표현입니다. [String: Int)는DictionaryString, Int>의축약표현입니다.
var numberForName2: [String: Int] = [String: Int]()
var numberForName3: StringIntDictionary = StringIntDictionary()
var numberForName4: [String: Int] = [:]

//초기값 생성
var numberForName5: [String: Int] = ["lucas":52, "neo":1, "trinity":3]

print(numberForName5.isEmpty)
print(numberForName5.count)

print(numberForName5["neo"]) //200
print(numberForName5["oracle"]) //nil
numberForName5["neo"] = 1
print(numberForName5["neo"])
numberForName5["mouse"] = 2
print(numberForName5["mouse"])

print(numberForName5.removeValue(forKey: "lucas"))

print(numberForName5["lucas", default: 0]) //0
