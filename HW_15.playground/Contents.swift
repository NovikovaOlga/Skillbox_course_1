import UIKit

//Выполните девять практических заданий.
//Прочитайте статью про функциональное программирование.
// Ответ: прочитала

//Напишите своими словами, что такое Pure Function.
//  Ответ: Pure Function - это функция, которая возвращает одинаковый результат для одного и того же набора входных значений (например: функция вычисления умножения двух чисел, прописанных в условиях функции - всегда будет выдавать одинаковый результат (умножение двух чисел) и не обладать побочными явлениями.

//Отсортируйте массив чисел по возрастанию, используя функцию Sorted.
let numbers = [7, 92, 51, 27, 114]
let numbersSorted = numbers.sorted()
numbersSorted

//Переведите массив чисел в массив строк с помощью функции Map.
let numbersString = numbersSorted.map { int in String(int)}
numbersString

//Переведите массив строк с именами людей в одну строку, содержащую все эти имена, с помощью функции Reduce.
let names = ["Nare", "Mavi", "Dudu", "Halise"]
let superName = names.reduce("") { (nameStep, name) in "\(nameStep)\(name.lowercased())" }
superName

//Напишите функцию, которая принимает в себя функцию c типом (Void) -&gt; Void, которая будет вызвана с задержкой в две секунды.

func greetVip() -> String {
 //   timer(sec: sec)
    return "Вы ждали 2 секунды."
}

DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
    print("Привет! Эта строчка из задания 6.")
    greetVip()
}


//Напишите функцию, которая принимает в себя две функции и возвращает функцию, которая при вызове выполнит первые две функции.

typealias A = () -> Void
typealias B = () -> Void
typealias C = () -> Void

func finalFunc(a: @escaping A , b: @escaping B ) -> C {
    return {
        a()
        b()
    }
}

let foo = finalFunc {
    print("A")
} b: {
    print("B")
}

foo()


//
//let cookiesBox = ["Сегодня удачный день",
//                  "Не делайте спонтанных покупок",
//                  "Вас ждет приятное путешествие",
//                  "Неожиданные поступления денег",
//                  "Вас ждет большая любовь",
//                  "Вам подарят подарок",
//                  "Дети вас порадают"]
//
//let greetingVisitor = { // Функция приветствия (1)
//    print ("Здравствуй, Ева!")
//}
//
//func cookiesFortune (helloVis:() -> Void) { // функция выбора печенья с предсказанием (2)
//    let luckyNumber = Int.random(in: 1...7)
//    let luckyFortune = cookiesBox[luckyNumber]
//   //return luckyNumber
//    helloVis()
//    print ("\(luckyFortune)")
//}
//
//cookiesFortune(helloVis: greetingVisitor)

//Напишите функцию, которая сортирует массив по переданному алгоритму: принимает в себя массив чисел и функцию, которая берёт на вход два числа, возвращает Bool (должно ли первое число идти после второго) и возвращает массив, отсортированный по этому алгоритму.

func statusNumbers(num1: Int, num2: Int) -> Bool {
    return num1 < num2; // false
}

var numbersArray = [22, 17, 4, 9, 5]
// Sort the array.
numbersArray.sort(by: statusNumbers)

//Напишите своими словами, что такое infix-, suffix-, prefix-операторы.

// infix-  оператор, который будет использован между двумя своими входными параметрами
// suffix- оператор, который будет использован после своего входного параметра
// prefix-  оператор, который будет использован перед своим входным параметром
