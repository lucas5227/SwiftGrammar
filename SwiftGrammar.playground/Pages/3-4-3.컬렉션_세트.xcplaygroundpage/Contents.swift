"""
///세트
"""
//같은 타입의 데이터를 순서 없이 하나의 묶음으로 저장하는 형태의 컬렉션타입
//모두유일한값
//순서가 중요하지않거나각요소가유일한값이어야하는경우에사용합니다.
//세트의요소로는 {해시가능한값}이 들어와야합니다.
//축약형이 없다 Array<Int> => [Int]

var names: Set<String> = Set<String>()
var names2: Set<String> = []

var names3: Set<String> = ["lucas", "neo", "trinity", "lucas"] //set 는 유일성을 지키기때문데 마지막 "lucas"가 없어짐
// 그렇기때문에타입추론을사용하게되면컴파일러는Set가아닌Array로타입을지정합니다.
var numbers = [1, 2, 3]
print(type(of: numbers)) //Array<Int>

print(names3.isEmpty) //false
print(names3.count)

print (names.count)  //0
names.insert("mouse")
print (names .count) //1
print (names.remove("mouse")) // mouse
print (names.remove("john")) //pil

let englishClassStudent: Set<String> =  ["lucas", "neo", "trinity"]
let koreanClassStudent: Set<String> =  ["lucas", "hoo"]

//교집합 //["lucas"]
let intersectSet: Set<String> = englishClassStudent.intersection(koreanClassStudent)

//합집합 //["trinity", "lucas", "neo", "hoo"]
let unionSet: Set<String> = englishClassStudent.union(koreanClassStudent)

//치집합 //["neo", "trinity"]
let subtractSet: Set<String> = englishClassStudent.subtracting(koreanClassStudent)

print(unionSet.sorted())

let 새: Set<String> = ["비둘기", "닭", "기러기"]
let 포유류: Set<String> = ["사자", "호랑이", "공"]
let 동물: Set<String> = 새.union(포유류)
// 새 와 포 유 류의 합 집 합
                      
print(새.isDisjoint(with: 포유류))          //서로 베타적인지? true
print(새.isSubset(of: 동물))               //새가 동물의 부분집합인가? true
print(동물.isSuperset(of: 포유류))          //동물은 표유류의 전체집합인가? true
print(동물.isSuperset(of: 새))             //동물은 새의 전체집합인가? true
