import UIKit
//
//Что нужно сделать
//1. Выполните шесть практических заданий.
//Ответ: не нашла где эти задания (если нижеперечисленные, то их уже 5)

//2. Посмотрите основные принципы ОПП.
// Ответ: прочитано

//3. Прочитайте статью на английском про ООП.
// Ответ: прочитано

//Потренируйтесь находить разницу между классом и объектом. Решите задачу разделения сущностей на классы (используя наследование, где нужно) и протоколы в следующих программах:
//В игре есть сундук с инвентарём. Инвентарь — различные игровые объекты, например: растения, оружие, квестовые предметы.

protocol Displaying {  // демонстрация (уметь отображать)
    func display(in magicBox: MagicBox) -> String // отображение
    }

enum Herbs: Displaying  { // растения
    case shiveringBushes,  venomousTentacula, jumpingOnion
   
    func display(in magicBox: MagicBox) -> String {
        return "Displaying \(self)"
    }
}

class Weapon: Displaying  { // оружие
    func display(in magicBox: MagicBox) -> String { // отображается
        return "Weapon displaying"
    }
    func shooting() -> String {
        return "Weapon fires" // стреляет
    }
}

class MagicItem: Displaying { // магические предметы
    func display(in magicBox: MagicBox) -> String { // отображаются
        return "Magic item displaying"
    }
    
    func magicalAbility() -> String { // имеют способность
        return "Magical ability"
    }
}

class MagicBox { // сундук для хранения
    func display(things: Displaying...) -> String {
        var result = ""
        for thing in things {
            result += thing.display(in: self) + "/n"
        }
        return result
    }
}

let magicBox = MagicBox () // сам сундук
let shiveringBushes = Herbs.shiveringBushes // растение 1
let venomousTentacula = Herbs.venomousTentacula // растение 2
let jumpingOnion = Herbs.jumpingOnion // растение 3
let crossbow = Weapon() // оружие 1
let huntingBow = Weapon() // оружие 2
let crystalBallWhite = MagicItem() // магический предмет 1
let crystalBallPink = MagicItem() // магический предмет 2

magicBox.display(things: shiveringBushes, venomousTentacula, jumpingOnion, crossbow, huntingBow, crystalBallWhite, crystalBallPink) // отобразим предметы

// В игре показывается карта: с игроками, монстрами (ими управляет компьютер), интерактивными предметами и неподвижными элементами (например, деревья, стены)

protocol Drawable { // отрисовывание
    func draw(in map: Map) -> String
}

protocol Moveable { // движение (игроки и монстры)
    func move()
}

protocol Fireable { // стрельба (игроки и монстры)
    func fire()
}

protocol Devouring { // пожирание (только монстры)
    func devour()
}

protocol Grow { // увеличиваться (только монстр-босс)
    func grow()
}

enum Obstacle: Drawable{ // препятствия
    case tree, wall
    
    func draw(in map: Map) -> String {
        return "Drawable \(self)"
    }
}

enum InteractiveItems: Drawable, Moveable { // интерактивные предметы могут двигаться
    case platform, portal
    
    func draw(in map: Map) -> String {
        return "Drawable \(self)"
    }
    
    func move() {
        print("Move")
    }
}

class Player: Drawable, Moveable, Fireable {  // игрок
    func draw(in map: Map) -> String {
        return "player created"
    }
   
    func move() {
        print("Move")
    }
    
    func fire() {
        print("Fire")
    }
}

class Monster: Drawable, Moveable, Fireable, Devouring { // монстр ( может то же что и игрок и еще съесть)
    func draw(in map: Map) -> String {
        return "monster created"
    }
    
    func move() {
        print("Move")
    }
    
    func fire() {
        print("Fire")
    }
    
    func devour() {
        print("Devour")
    }
}

class MonsterBoss: Monster, Grow{ // монстр-босс, тот же монстр, только растет
    func grow() {
        print("Grow")
    }
}

class Map { // карта
    func draw(objects: Drawable...) -> String {
        var result = ""
        for object in objects {
            result += object.draw(in: self) + "; "
        }
        return result
    }
}

let map = Map()  // карта
let tree1 = Obstacle.tree // дерево 1
let tree2 = Obstacle.tree // дерево 2
let wall = Obstacle.wall // стена 1
let platform = InteractiveItems.platform // платформа
let portal1 = InteractiveItems.portal // портал 1
let portal2 = InteractiveItems.portal // портал 2
let player = Player() // игрок
let monster1 = Monster() // монстр 1
let monster2 = Monster() // монстр 2
let monsterBoss = MonsterBoss() // монстр- босс

map.draw(objects: tree1, tree2, wall, platform, portal1, portal2, player, monster1, monster2, monsterBoss)

// В приложении есть три модели машин, у каждой из которых есть три комплектации. Модели отличаются названием, картинкой. Комплектации — названием, ценой, цветом, объёмом двигателя.
// Комментарий преподавателя: В задании 3 предлагаю такой вариант: Давайте объявим протокол для получения комплектаций. В итоге, будет так - Класс машины, сабкласс модели (создадим 3 сабкласса, как в задании), который реализует протокол и для каждого объекта вернем 3 комплектации. Сами комплектации предлагаю объявить структурой. Что скажете? Если не до конца понятно, вышлю вам пример. Но если справитесь самостоятельно - будет здорово!

enum BookModel { // справочник моделей
    case Rio, Soul, Seltos
}

enum BookFotoModel { // справочник фото моделей
    case fotoRio, fotoSoul, fotoSeltos
}

enum BookEquipment{ // справочник комплектаций
    case Comfort, Luxury, Sport
}

struct Equipment{ // комплектации
    var nameEquipment: BookEquipment // комплектация
    var price: Double // цена
    var color: UIColor // цвет
    var volumeEngine: Double // объем двигателя
}

protocol RequestEquipment {  // инструкция для комплектаций
    func nameCar() -> Car
    func comfort() -> Equipment
    func luxury() -> Equipment
    func sport() -> Equipment
}

class Car{ // модели машин
    var nameModel: BookModel
    var fotoModel: BookFotoModel
    init(nameModel: BookModel, fotoModel: BookFotoModel) {
        self.nameModel = nameModel
        self.fotoModel = fotoModel
    }
}
// три комплектации модели 1
class Rio: Car, RequestEquipment {
    func nameCar() -> Car {
        return Car.init(nameModel: .Rio, fotoModel: .fotoRio)
    }
    
    func comfort() -> Equipment {
        return Equipment.init(nameEquipment: .Comfort, price: 12700, color: .black, volumeEngine: 1.4)
    }
    
    func luxury() -> Equipment {
        return Equipment.init(nameEquipment: .Luxury, price: 13800, color: .white, volumeEngine: 1.8)
    }
    
    func sport() -> Equipment {
        return Equipment.init(nameEquipment: .Sport, price: 18700, color: .yellow, volumeEngine: 2.2)
    }
}

// три комплектации модели 2
class Soul: Car, RequestEquipment {
    func nameCar() -> Car {
        return Car.init(nameModel: .Soul, fotoModel: .fotoSoul)
    }
    
    func comfort() -> Equipment {
        return Equipment.init(nameEquipment: .Comfort, price: 14300, color: .black, volumeEngine: 1.6)
    }
    
    func luxury() -> Equipment {
        return Equipment.init(nameEquipment: .Luxury, price: 15700, color: .white, volumeEngine: 1.6)
    }
    
    func sport() -> Equipment {
        return Equipment.init(nameEquipment: .Sport, price: 19200, color: .yellow, volumeEngine: 2.0)
    }
}

// три комплектации модели 3
class Seltos: Car, RequestEquipment {
    func nameCar() -> Car {
        return Car.init(nameModel: .Seltos, fotoModel: .fotoSeltos)
    }
    
    func comfort() -> Equipment {
        return Equipment.init(nameEquipment: .Comfort, price: 17200, color: .black, volumeEngine: 1.8)
    }
    
    func luxury() -> Equipment {
        return Equipment.init(nameEquipment: .Luxury, price: 18300, color: .white, volumeEngine: 1.8)
    }
    
    func sport() -> Equipment {
        return Equipment.init(nameEquipment: .Sport, price: 21200, color: .yellow, volumeEngine: 2.2)
    }
}

//4. В каких случаях лучше использовать наследование, а в каких — расширения (extension)?
// Наследование лучше использовать, когда нам необходим шаблон (например создания автомобилей), а расширение для придания характеристик (автомобили едут) или изменения свойств базового элемента (например, можем расширением менять значение Int на отрицательные, тем самым расширив свойства стандартного типа данных Int).

//5. Ответьте, не используя Xcode:
//Что выведется в консоль в результате выполнения следующего кода?
//Если код некорректен, какая строчка не скомпилируется и почему?
//protocol A{
//    func a()
//}
//
//protocol B{
//    func b()
//}
//
//extension B{
//    func b(){
//        print("extB")
//    }
//}
//
//class C: A{
//    func a() {
//        print("A")
//    }
//
//    func c(){
//        print("C")
//    }
//}
//
//class D: C, B{
//    func b() {
//        print("B")
//    }
//    func d(){
//        print("D")
//    }
//}
//
//
//let v1: A = D()
//      v1.a()
//let v2: B = C()
//      v2.c() // ОШИБКА: здесь нужна строка v2.b (так как в протоколе B нет функции С)
//let v3: C = D() // С-класс, D-класс
//      v3.d() // ОШИБКА: здесь нужна  строка v3.c (так как в протоколе С нет функции d)
//let v4: D = D()
//      v4.a()
//
//6. Заучите определения полиморфизма, инкапсуляции и наследования — об этом могут спрашивать на собеседовании. Если их суть не до конца понятна, пересмотрите видео, перечитайте статью или задайте вопрос в Telegram-чат. Понимать их крайне важно.
// Полиморфизм - свойство системы, позволяющее использовать объекты с одинаковым интерфейсом без информации о типе и внутренней структуре объекта.
// Инкапсуляция - свойство системы, позволяющее объединить данные и методы, работающие с ними, в классе.
// Наследование - свойство системы, позволяющее описать новый класс на основе уже существующего с частично или полностью заимствующейся функциональностью.
