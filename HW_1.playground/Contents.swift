import UIKit

//Что нужно сделать
//
//1.Прочитайте статьи:
//
//Основы Swift (прочитала)
//Основные операторы (прочитала)
//
//
//2. Опишите, в чём разница между переменными let и var.
//
//let - константа, var - переменная
//
//3. Ответьте, возможен ли следующий код?
// var name1 = "Nikita", name2 = "Anton", name3 = "Maria"
//
// Да
//
//4. Подумайте, какой тип будет у следующих констант (ответьте, не используя для проверки Xcode):
//
//let a = 7
//Ответ: Int
//
//let b = 7.0
//Ответ: Double
//
//let c = "7"
//Ответ: String
//
//let d = UInt8.max
//Ответ: UInt со значение 255
//
//let e =  1_000_000
//Ответ: Int
//
//5. Что произойдёт, если выполнить код let number: Int = Int.max + 1
//Ответ: будет ошибка, так как нельзя превысить максимальное значение
//
//6. Приведите три примера (с кодом), в которых будут удобны tuples.
// Ответ:
let saleSunday = ("all goods", 1000, "sanitizer")
let sms = "Wow! Sunday sale: \(saleSunday.0), when buying from \(saleSunday.1) as a gift  \(saleSunday.2)"

let fruitSection = (sections: 26, weight: 175.5, emptySection: "pears")
let orderDeliveryFruit = "Deliver from warehouse: \(fruitSection.emptySection)"

let vegetablesSection = (section: 42, weight: 237.9, emptySection: "sweet potato")
let orderDeliveryVegetables = "Deliver from warehouse: \(vegetablesSection.emptySection)"

let totalWeight = (fruitSection.1) + (vegetablesSection.1)
let orderDelivery = (fruitSection.2) + ", " + (vegetablesSection.2)

//
//
//7. Представим, что у нас есть код:
//
//let age = 25
//let name = "Nikita"
//let greeting = ?
//Что нужно поставить вместо знака «?», чтобы получить «Hello <Значение name>, your age is <значение age>»?
//Ответ:
let age = 25
let name = "Nikita"
let greeting = "Hello \(name), your age is \(age)"

//
//
//8. Чему равны выражения (ответьте, не используя для проверки Xcode):
//
//let a = 21 / 8
// Ответ: 2
//
//let b = 21 % 8
//Ответ: 5
//
//let c = a == b
// Ответ: false ( 5 == 2)
//
//let d = a != b
// ОТвет: true (5 != 2)
//
//let e = c && d (false && true)
//Ответ: false
//
//let f = c || d
// Ответ: true (false || true)
//
//
//
//Критерии оценки
//
//код компилируется,
//задачи реализованы в соответствии с описанием.
//
//
//Как отправить задание на проверку
//
//Реализуйте все задачи в одном swift playground и пришлите его через форму обратной связи.
