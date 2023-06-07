"""
///열거형_연관값
"""
//연관값은 각 항목 옆에 소괄호로 묶어 표현할수 있습니다

enum MainDish {
    case pasta( taste: String)
    case pizza(dough: String, topping: String)
    case chicken(withSauce: Bool)
    case rice
}

var dinner: MainDish = MainDish.pasta(taste: "cream")
dinner = .pizza(dough: "cheeseCrust", topping: "bulgogi")
dinner = .chicken(withSauce: true)
dinner = .rice

enum PastaTaste {
    case cream, tomato
}
enum PizzaDough {
    case cheeseCrust, thin, original
}
enum PizzaTopping {
    case pepperoni, cheese, bacon
}
enum MainDish2 {
    case pasta(taste: PastaTaste)
    case pizza(dough: PizzaDough, topping: PizzaTopping)
    case chicken(withSauce: Bool)
    case rice
}

var dinner: MainDish2 = MainDish2.pasta(taste: PastaTaste.tomato)
dinner = MainDish2.pizza(dough: PizzaDough.cheeseCrust, topping: PizzaTopping.bacon))
