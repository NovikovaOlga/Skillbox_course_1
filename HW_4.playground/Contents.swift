import UIKit
//
//Выполните 10 обязательных заданий и дополнительные практические задания — по желанию.
//1.Прочитайте статьи:
//перечисления
//структуры и классы
//свойства
//методы
//наследование
//инициализация

//2. Если бы в вашей программе была работа с игральными картами, как вы организовали бы их хранение? Приведите пример.
// Ответ:
// Вариант 1 (исользуя перечисления и класс с конструктором)
enum Suit { // храним масти
    case hearts, diamonds, clubs, spades
}

enum Rank { // храним ранги
    case ACE, King, Queen, Jack, ten, nine, eight, seven, six
}

final class PlayingCard {
    
    let suit: Suit
    let rank: Rank
    
    init(suit: Suit, rank: Rank) { // конструктор карты
        self.suit = suit
        self.rank = rank
    }
}

let heartsACE = PlayingCard(suit: .hearts, rank: .ACE)
let heartKing = PlayingCard(suit: .hearts, rank: .King)
// и так далее создаем всю колоду

// Вариант 2(используя структуру и класс)
struct PlayingCardBox {
    let suit: Suit
    let rank: Rank
}

final class PlayingCardFactory {
    
    func makePlayingCard() -> [PlayingCardBox] {
        let diamondsACE = PlayingCardBox(suit: .diamonds, rank: .ACE)
        let diamondsKing = PlayingCardBox(suit: .diamonds, rank: .King)
        // и так далее создаем константу для каждой карты с внесение в массив в return
        return [diamondsACE, diamondsKing]
    }
}

//3. Каких типов могут быть raw значения кейсов enum?
// Ответ: String, Int, Double, Float

//4. Напишите класс и структуру для хранения информации (положение, размер) о круге, прямоугольнике.
//Ответ:
//Пояснение преподавателя: давайте объявим структуру положения и структуру размера. Создадим класс прямоугольника и класс круга. И добавим им переменные с типом объявленных структур положения и размера. Что скажете?

struct Location { // структура положения
    var x = 0.0
    var y = 0.0
    
    init (x: Double, y: Double) {
        self.x = x
        self.y = y
    }
}

struct Parameters {
    var length: Int?
    var width: Int?
    var radius: Int?
    
    init(length: Int, width: Int) { // инициализатор для прямоугольника
        self.length = length
        self.width = width
    }
    
    init(radius: Int) { // инициализатор для круга
        self.radius = radius
    }
}

class Circle {
    
    var location = Location (x: 3, y: 1)
    var parameters = Parameters.init(radius: 7)
}

class Rectangle {
    var location = Location (x: -4, y: 17)
    var parameters = Parameters.init(length: 3, width: 2)
}

Circle()
Rectangle()

//5.Выполнение каких строчек для следующего кода закончится ошибкой и почему:
// Ответ:
//class ClassUser1{
//    let name: String
//    init(name: String) {
//        self.name = name
//    }
//}
//
//class ClassUser2{
//    var name: String
//    init(name: String) {
//        self.name = name
//    }
//}
//
//struct StructUser1{
//    let name: String
//    init(name: String) {
//        self.name = name
//    }
//}
//
//struct StructUser2{
//    var name: String
//    init(name: String) {
//        self.name = name
//    }
//}
//
//let user1 = ClassUser1(name: "Nikita")
//2. user1.name = «Anton» // ошибка, так как попытка перезаписать константу let name: String в class ClassUser1
//
//let user2 = ClassUser2(name: "Nikita")
//2. user2.name = «Anton» // ошибки нет
//
//let user3 = StructUser1(name: "Nikita")
//3. user3.name = «Anton» // ошибка, так как попытка перезаписать константу let name: String в struct StructUser1
//
//let user4 = StructUser2(name: "Nikita")
//4. user4.name = «Anton» // ошибка, так как попытка перезаписать константу let user4
//
//var user5 = ClassUser1(name: "Nikita")
//5. user5.name = «Anton» // ошибка, так как попытка перезаписать константу let name: String в class ClassUser1
//
//var user6 = ClassUser2(name: "Nikita")
//6. user6.name = «Anton» //  ошибки нет
//
//var user7 = StructUser1(name: "Nikita")
//7. user7.name = «Anton» // ошибка, так как попытка перезаписать константу let name: String в struct StructUser1
//
//var user8 = StructUser2(name: "Nikita")
//8. user8.name = «Anton» // ошибки нет
//

//6. Напишите пример класса автомобиля (какие поля ему нужны — на ваше усмотрение) с конструктором, в котором часть полей будет иметь значение по умолчанию.
enum Transmission {
    case mechanical, automatic, robotic
}
class Zhiguli {
    let transmission: Transmission
    let color: UIColor
    let windshield: Bool
    let upholstery: String
    
    init(transmission: Transmission, color: UIColor, windshield: Bool, upholstery: String ) {
        self.transmission = transmission
        self.color = color
        self.windshield = true
        self.upholstery = "velvet"
    }
}

let ZhiguliSport = Zhiguli(transmission: .mechanical, color: .red, windshield: .init(), upholstery: .init())

//7. Напишите класс для калькулятора с функциями для сложения, вычитания, умножения и деления цифр, которые в нём хранятся как свойства.
// Ответ:
// Пояснение преподавателя: нам надо объявить класс и добавить ему 2 переменные. функции действий без входных параметров, пусть совершают операции над двумя переменными класса.
// Пояснение преподавателя: По заданию 7 - давайте поместим функции внутрь класса. Сейчас вы в функциях работаете с переменными value1 и value2 разных экземпляров. То есть, для каждой операции создается по 2 объекта класса калькулятора

class Calculator {
    
    var value1: Int = 10
    var value2: Int = 2

    func addition() {
        _ = value1 + value2
        return
    }
    
    func subtraction() {
        _  = value1 - value2
        return
    }
    
    func multiplication() {
        _  = value1 * value2
        return
    }
    
    func division() {
        if value2 != 0 {     // на ноль делить нельзя
            _  = value1 / value2
        }
        return
    }
    
    init() {
        self.addition()
        self.subtraction()
        self.multiplication()
        self.division()
    }
    
}

Calculator()


//8. В каких случаях следует использовать ключевое слово static?
// Ответ: когда нужно определить свойства самого объекта. Например: в классе, который хранит инициализатор автомобиля, через переменную static можно производить подсчет количества машин, так как такая переменная будет принадлежать самому классу, а не конструктору

//9.Могут ли иметь наследников:
//Классы - могут
//Структуры - не могут
//Enums - не могут

//10. Представим, что вы создаете RPG-игру. Напишите структуру для хранения координаты игрока, enum для направлений (восток, север, запад, юг) и функцию, которая берёт к себе на вход позицию и направление и возвращает новую координату (после того как игрок походил на одну клетку в соответствующую сторону). Вызовите эту функцию несколько раз, «походив» своим игроком.

enum Direction {
    case north, south, west, east
}

struct Position {
    var x: Int = 0
    var y: Int = 0
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
}

func travel(direction: Direction, position: inout Position) { // -> Position { // если функция что-то возвращает, то нужен return
    
    switch direction {
    case .north:
        position.y += 1
    case .south:
        position.y -= 1
    case .west:
        position.x += 1
    case .east:
        position.x -= 1
    }
    // return position // возврат нужен, если есть возвращаемое значение
}

var positionNew = Position(x: 1, y: 2)
travel(direction: .west, position: &positionNew)
travel(direction: .west, position: &positionNew)
travel(direction: .north, position: &positionNew)
travel(direction: .north, position: &positionNew)
travel(direction: .north, position: &positionNew)
travel(direction: .east, position: &positionNew)
travel(direction: .east, position: &positionNew)

//Дополнительные задания
//Enums
//Можно ли в enum хранить дополнительные данные?
// Ответ: да, вместе со значение кейса можно хранить дополнительные данные.

enum Barcode {
    case upCode(Int, Int, Int, Int)
    case qrCode(String)
    
}
//Классы
//В каких случаях удобнее структурировать данные и функции в класс?
// Ответ: когда нам необходимо использовать особенности, которые есть только у класса: 1) необходимо использовать наследование 2) когда нам необходимо проверять идентичность при помощи === (являются ли объекты наследниками одного и того же класса)

//Структуры
//В каких случаях лучше использовать класс, а в каких — структуру?
/// Ответ: По умолчанию лучше использовать структуры: проще анализ изменения в коде, уверенность, что никакой другой объект не использует ссылку на объект и  не вызывает утечку памяти. Структуры надо использовать для простых типов данных (пользователи, новости), когда сложных отношений между объектами, в многопоточной среде (могут быть безопасно скопированы). Классы - когда нам нужны их особенности: наследование, деинициализация, проверка идентичности объектов
