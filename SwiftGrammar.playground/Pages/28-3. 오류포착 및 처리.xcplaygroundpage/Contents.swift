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
/*
 부모 클래스의 다시 던지기 메서드(rethrows메서드)는 자식 클래스에서 던지기 메서드(throws메서드)로 재정의할 수 없다. 그러나 부모 클래스의 던지기 대서드는 자식 클래스에서 다시 던지기 메서드로 재정의 할 수 있다.
 */
//오류를 던지는 함수
func someThrowFunction_3() throws {
    enum SomeError: Error {
        case justSomeError
    }
    
    throw SomeError.justSomeError
}

//다시 던지기 함수
func someFunction(callback: () rhrows -> Void) rethrows {
    try callback()  //다시 던지기 함수는 오류를 다시 던질 뿐 따로 처리하지 않는다.
}

do {
    try someFunction(callback: someThrowFunction_3)
} catch {
    print(error)
}
//justSomeError


///다시 던지기 함수의 오류 던지기
//오류를 던지는 함수
func someThrowingFunction_4() throws {
    enum SomeError: Error {
        case justSomeError
    }
    
    throw SomeError.justSomeError
}

//다시 던지기 함수
func someFunction_2(callback: () throws -> Void) rethrows {
    enum AnotherError: Error {
        case justAnotherError
    }


do {
    //매개변수로 전달한 오류 던지기 함수이므로
    //catch 절에서 제어할 수 있다.
    try callback()
} catch {
    throw AnotherError.justAnotherError
}

do {
    //매개변수로 전달한 오류 던지기 함수가 아니므루
    //catch 절에서 제어할 수 없다.
    try someThrowFunction_3()
} catch {
    //err!
//    throw AnotherError.justAnotherError
}

//catch 절 외부에서 단독으로 오류를 던질 수는 없다. err!
//throw Another.justAnotherError
}

///프로토콜과상속에서던지기함수와다시던지기함수
protocol SomeProtocol {
    func someThrowFunctionFromProtocol(callback: () throws -> Void) throws
    func someRethrowFunctionFromProtocol(callback: () throws -> Void) rethrows
}

class SomeClass: SomeProtocol {
    func someThrowingFunction(callback: () throws -> Void) throws { }
    func someFunction(callback: () -> throws -> Void) rethrows { }
    
    //던지기 메서드는 다시 던지기 메서드를 요구하는 프로토콜을 충독할 수 없다.
    //err!
//    func someRethrowFunctionFromProtocol(callback: () throws -> Void) rethrows {
//    }
    
    //다시 던지기 메서드는 더지기 메서드를 요구하는 프로토콜의 요구사항에 부한한다.
    func someThrowFunctionFromProtocol(callback: () throws -> Void) throws {
    }
}

class someChildClass: SomeClass {
    //부모클래스의 던지기 메서드는 자식클래스에서 다시 던지기 메서드로 재정의할 수 있다.
    override func someThrowingFunction(callback: () throws -> Void) throws { }
    
    //부모클래스의 다시 던지기 메서드는 자식클래스에서 던지기 메서드로 재정의할 수 없다.
    //err!
//    override func someFunction(callback: () -> Void) rethrows { }
}

///28-3-6 후처리 defer
/*
 defer 구문을 사용하여 현재 코드 블록을 나가기 전에 꼭 실행해야 하는 코드를 작성해줄 수 있다. 즉, defer구문은 코드가 블록을 어떤식으로 빠져나가든 간에 꼭 실행해야 하는 마무리작업을 할 수 있도록 도와준다. 그 말인즉슨, 오류가 발생하여 코드 블록을 빠져나가는 것이든. 정상적 으로 코드가 블록을 빠져나가는 것이든 간에 defer구문은 코드가 블록을 빠져나가기 전에 무조건 실행되는 것을 보장한다는 뜻이다.
 예를 들어 함수내에서 파일을 열어 사용하다가 오류가 발생하여 코드가 블록을 빠져나가더라도 파일을 정상적으로 닫아 메모리에서 해제해야하기 때문에 defer 구문 내부에는 파일을 닫는 코드를 작성하여 정상적으로 파일이 메모리에서 해제될 수 있도록 한다.
 + defer 구문과 오류처리
 defer 구문은 꼭 오류처리 상황에서만 사용해야 하는 것은 아니지만, 오류처리를 할 때 유용하게 쓰이기에 오류처리 파트에서 소개한다. deger 구문은 오류처리 상황뿐만 아니라 함수, 메서드, 반복문, 조건문 등등 보통의 고드 블록 어디에서든 사용할 수 있다.
 */

for i in 0...2 {
    defer {
        print("A", terminator: " ")
    }
    print(i, terminator: " ")
    
    if i % 2 == 0 {
        defer {
            print("", terminator: "\n")
        }
        
        print("It's even", terminator: " ")
    }
    // 0 It's even
    // A 1 A 2 It's even
    // A
}

///28-10 파일쓰기 예제에서 defer 구문 활용
/*
func writeData() {
    let file = openFile()
    
    //함수 코드 블록을 빠져나가기 직전 무조건 실행되어 파일을 잊지 않고 닫아 준다.
    defer {
        closeFile(file)
    }
    
    if ... {
        return
    }
    
    if ... {
        return
    }
    
    //처리 끝
}
*/
