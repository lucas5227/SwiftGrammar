"""
///흐름제어_반볻문_for_in
"""
/*
for 임시 상수 in 시퀀스아이템{
    실행 코드
}
*/

///for-in반복구문의활용
for i in 0...2 {
    print(i)
}
//0
//1
//2

for i in 0...5 {
    if i.isMultiple(of: 2) {
        print(i)
        continue
    }
    
    print("\(i)  == 홀수")
}
//0
//1  == 홀수
//2
//3  == 홀수
//4
//5  == 홀수

let helloSwift: String = "Hello Swift!"

for char in helloSwift {
    print(char)
}

var result: Int = 1

// 시퀸스에해당하는값이필요없다면와일드카드식별자(_)를사용하면됩니다.
for _ in 1...3 {
    result *= 10
}

print("10의 3제곱은 \(result)입니다.")
//10의 3제곱은 1000입니다.

///기본 데이터 타입의 for-in 반복구문 사용
//Dictionary
let friends: [String: Int] = ["lucas":35, "oracle":100, "morpheus":50]

for tuple in friends {
    print(tuple)
}
//(key: "oracle", value: 100)
//(key: "lucas", value: 35)
//(key: "morpheus", value: 50)

let 주소: [String: String] =
["도": "충청북도", "시군구": "청주시청원구","동읍면":"율량동"]

for (키, 값) in 주소 {
    print("\(키) : \(값)")
}
//도 : 충청북도
//시군구 : 청주시청원구
//동읍면 : 율량동

// Set
let 지역번호: Set<String> = ["02", "031", "032", "033", "041", "042", "043", "051", "052", "053", "054" , "055","061","062", "063", "064"]

for 번호 in 지역번호 {
    print(번호)
}
//052
//051
//...

//함수형 프로그래밍 패러다임을 이해하면 for-i n구문보다 map, filter, flatMap등을 더 많이 사용하게 된다 14장 참고

