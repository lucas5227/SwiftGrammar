"""
///28.3 오류포착 및 처리
오류를 던질 수도 있지만 오류가 던져지는 것에 대비하여 던져진 오류를 처리하기 위한 코드도 작성해야 한다.
예를 들어 던저진 오류가 무엇인지 판단하여 다시 문제를 해결한다든지, 다른 방법으로 문제 해결을 시도해 본다든지, 오류를 알리고 사용자에게 선택 권한을 넘겨주어 다음에 어떤 동작을 하게할 것인지 결정하도록 유도하는 등의 코드를 작성해야 한다. 스위프트에는 오류를 처리하기 위한 네가지 방법이 있다.

• 함수에서 발생한 오류를 해당 함수를 호출한 코드에 알리는 방법
• do-catch구문을 이용하여 오류를 처리하는방법
• 옵셔널 값으로 오류들 처리하는 방법
• 오류가 발생하지 않을 것이라고 확신하는 방법
"""

///2 8.3.1함수에서발생한오류알리기
/*
 먼저 함수에서 발생한 오류를 해당함수를 호출한 코드에 알리는 방법 합수가 오류를 던지면 프로그램의 흐름이 바꿀 가능성이 매우크다. 그러므로 어디서 오류를 던지고 받을 것인가 결정하는 것은 매우 중요하다. try 키워드로 던져진 오류를 받을 수 있다 . try 키워드는 try 또는 try?, try!등으로 표현할 수 있다.
 함수, 메서드, 이니셜라이저의 매개변수 뒤에 throws키워드를 사용하면 해당함수, 메서드, 이니셜라이저는 오류를 던질수 있다.일반적으로 func  cannotThrowErrors() -> String 처럼 표현하던 것에 func canThrowErrors() throws -> String처럼 throws키워드를 명시해주면 오류를 던질 수 있다. 이런 함수는 호출했을때, 동작도중 오류가 발생하면 자신을 효출한 코드에 오류를 던져서 오류를 알릴 수 있다.
 +) throws는 합수나 메서드의 자체 타입에도 영향을미친다. 즉, throws함수나메서 드는 같은 이름의 throws가 명시되지 않는 힘수나 메서드와 구분된다. 또 throws를 포함한 함수,메서드, 이나설라이저는 일반함수, 메서드, 이니셜라이저로 재정의할 수. 없다. 반대로 일반함수. 메서드, 이니셜라이저는 throws 함수. 메서드, 이니셜라이저로 재정의 할 수 있다.
 */

///자판기 동작 도중 발생한 오류 던지기

enum VendingMachineError: Error {
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfSrock
}

struct Item {
    var price: Int
    var count: Int
}

class VendingMachine{
    var inventory = [
        "Candy Bar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Biscuit": Item(price: 7, count: 1)
    ]
    
    var coinsDeposited = 0
    
    func dispense(snack: String) {
        print("\(snack) 제공")
    }
    
    func vend(itemNamed name: String) throws {
        guard let item = self.inventory[name] else {
            throw VendingMachineError.invalidSelection
        }
        
        guard item.price <= self.coinsDeposited else {
            throw VendingMachineError.insufficientFunds(
                coinsNeeded: item.price - self.coinsDeposited)
        }
        
        self.coinsDeposited -= item.price
        
        var newItem = item
        newItem.count -= item.price
        
        self.inventory[name] = newItem
        
        self.dispense(snack: name)
    }
}

let favoriteSnacks = [
    "lucas": "Chips",
    "dohyun": "Biscuit",
    "jinkyung": "Chocolate",
]

func buyFavoriteSnack(poerson: String, vendingMachine: VendingMachine) throws {
    let snackName = favoriteSnacks[poerson] ?? "Candy Bar"
    try vendingMachine.vend(itemNamed: snackName)
}

struct PurchasedSnack {
    let name: String
    init(name: String, vendingMachine: VendingMachine) throws {
        try vendingMachine.vend(itemNamed: name)
        self.name = name
    }
}

let machine: VendingMachine = VendingMachine()
machine.coinsDeposited = 30

var purchase: PurchasedSnack = try PurchasedSnack(name: "Biscuit",
                                                  vendingMachine: machine)
//Biscuit 제공

print(purchase.name)            //Biscuit

for (person, favoriteSnack) in favoriteSnacks {
    print(person, favoriteSnack)
    try buyFavoriteSnack(poerson: person, vendingMachine: machine)
}

//Biscuit 제공
//Biscuit
//dohyun Biscuit
//Biscuit 제공
//lucas Chips
//Chips 제공
//jinkyung Chocolat

//err


///28-3-2 do-catch구문을 이용하여 오류처리
/*
 do-catch 구문을 이용하여 오류를 처리하는 방법 한수, 메서드, 이니셜라이저등에서 오류를 던져주면 오류발생을 전달받은 코드블록은 do-cat ch구문을 사용하여 오류를 처리해 주어야 한다. do절 내부의 코드에서 오류를 던지면 catch절에서 오류를 전달 반아 적절이 처리해주면 된다.
 
 do {
    try 오류 발생 가능코드
    오류가 발생하지 않으면 실행할 코드
 } catch 오류 패턴1 {
    처리 코드
 } catch 오류 패턴2 where 추가 조건 {
    처리코드
 }
 */

/// do-catch 구문을 사용하여 던져진 오류 처리
func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) {
    let snackName = favoriteSnacks[person] ?? "Candy Bar"
    tryingVend(itemNamed: snackName, vendingMachine: vendingMachine)
}

struct PuchasedSnack {
    let name: String
    init(name: String, vendingMachine: VendingMachine) {
        tryingVend(itemNamed: name, vendingMachine: vendingMachine)
        self.name = name
    }
}

func tryingVend(itemNamed: String, vendingMachine: VendingMachine) {
    do {
        try vendingMachine.vend(itemNamed: itemNamed)
    } catch VendingMachineError.invalidSelection {
        print("유효하지 않은 선택")
    } catch VendingMachineError.outOfSrock {
        print("품절")
    } catch VendingMachineError.insufficientFunds(coinsNeeded: let coinsNeeded) {
        print("자금 부족 = 동전 \(coinsNeeded)개를 추가로 지급해주세요")
    } catch {
        print("그 외 오류 발생:", error)
    }
}

let machine_2: VendingMachine = VendingMachine()
machine_2.coinsDeposited = 20

var purchase_2: PuchasedSnack = PuchasedSnack(name: "Biscuit", vendingMachine: machine)
//Biscuit 제공

print(purchase_2.name)            //Biscuit

purchase_2 = PuchasedSnack(name: "Ice Cream", vendingMachine: machine_2)
//유효하지 않은 선택

print(purchase_2.name)          //Ice Cream

for (person, favoriteSnack) in favoriteSnacks {
    print(person, favoriteSnack)
    try buyFavoriteSnack(person: person, vendingMachine: machine_2)
}
//lucas Chips
//Chips 제공
//dohyun Biscuit
//자금 부족 - 동전 4개를 추가로 지급해주세요.
//jinkyung Chocolate
//유효하지않은 선택

///28-3-3 옵셔널값으로 오류처리
///옵셔널값으로 오류처리
func someThrowingFunction(shouldThrowError: Bool) throws -> Int {
    if shouldThrowError {
        enum SomeError: Error {
            case justSomeError
        }
        
        throw SomeError.justSomeError
    }
    
    return 100
}

let x: Optional = try? someThrowingFunction(shouldThrowError: true)
print(x)            //nil

let y: Optional = try? someThrowingFunction(shouldThrowError: false)
print(y)            //Optional(100)

///옵셔널 값으로 오류를 처리하는 방법과 기존 옵셔널 반환 타입과의 결합
func fetchData() -> Data? {
    if let data = try? fetchDataFromDisk() {
        return data
    }
    if let data = try? fetchDataFromServer() {
        return data
    }
    return nil
}
//--------//
class Data {}
func fetchDataFromDisk() throws -> Data {
    // For example:
    // return someData
    throw NSError(domain: "DiskError", code: 1, userInfo: nil) // throw an error for demonstration
}

func fetchDataFromServer() throws -> Data {
    // Implement logic to fetch data from server
    // For example:
    // return someData
    throw NSError(domain: "ServerError", code: 1, userInfo: nil) // throw an error for demonstration
}
 
//--------//

///28-3-4 오류가 발생하지 않을 것이라고 확신하는 방법
///오류가 발생하지 않음을 확신하여 오류처리
func someThrowingFunction_2(shouldThrowError: Bool) throws -> Int {
    if shouldThrowError {
        enum SomeError: Error {
            case justSomeError
        }
        
        throw SomeError.justSomeError
    }
    return 100
}
    
let y: Int = try! someThrowingFunction_2(shouldThrowError: false)
print(y)            //100

//let x: Int = try! someThrowingFunction_2(shouldThrowError: true)          //err: RUNTIME


///28-3-5 다시 던지기
/*
 rethrows 키워드를 사용하여 다시던지기(rethrowing) 가능하게 하려면 최소 하나 이상의 오류 발생 가능한 함수를 매개변수로 전달 반아야 한다.
 */

///오류의 다시던지기
//오류를 던지는 함수
func someThrowFunction_3() throws {
    enum SomeError: Error {
        case justSomeError
    }
    
    throw SomeError.justSomeError
}

//다시 던지기 함수
