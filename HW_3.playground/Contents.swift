import UIKit

//
//1. Прочитайте статью про функции: http://unetway.com/tutorial/swift-funkcii/.
// Прочитала

//2. Напишите, можно ли в функции вызвать другую функцию? Если да, приведите пример.
// Можно:
func good() -> String {
    return "Good"
}

func greeting (value: String) -> String {
    return good() + " " + value
}

greeting(value: "morning") // Good morning

//3. Напишите функцию, которая получает на вход массив строк, а возвращает одну строку, содержащую все элементы полученного массива через запятую.

func transformer (_ arrayBox: [String]) -> String {
    arrayBox.joined(separator:", ")
}
transformer(["any", "day", "any", "way"])

//4. Напишите функцию, которая получает на вход два Int, меняет их значения, при этом увеличивая их вдвое.
func change (a: inout Int, b: inout Int) {
    let c = a
    a = b * 2
    b = c * 2
    
}
var a = 10
var b = 100

change(a: &a, b: &b)
a
b


//5. Напишите функцию, которая получает на вход два массива с типом Int и возвращает true, если сумма чисел в первом массиве больше суммы чисел во втором массиве. Если условия с суммой чисел не выполняются — функция возвращает false.

func comparison (arrOne :[Int], arrTwo: [Int]) -> Bool {
    var sumArrOne = 0
    var sumArrTwo = 0
    
    for elArrOne in arrOne {
        sumArrOne += elArrOne
    }
    
    for elArrTwo in arrTwo {
        sumArrTwo += elArrTwo
    }
    
    return (sumArrOne > sumArrTwo) ? true : false
}

let arrOne = [1, 3, 7]
let arrTwo = [1, 2, 5]

comparison (arrOne: arrOne, arrTwo: arrTwo)

//6. Напишите функцию, которая получает на вход массив Int и возвращает этот же массив, но отсортированный по убыванию.

func sortBox (arrowBox: [Int]) -> [Int] {
    return arrowBox.sorted(by: >)
}

let arrowBox = [7, 0, -8, 100, 15, 2]
sortBox(arrowBox: arrowBox)

//7. Напишите функцию, которая получает на вход массив Int и возвращает среднее значение всех элементов.
func medium (randomBox: [Int]) -> Double {
    let sumRandomBox = Double(randomBox.reduce(0, +))
    let resultBox = sumRandomBox / Double(randomBox.count)
    return resultBox
}

let randomBox = [2, 4, 6]
medium(randomBox: randomBox)

//8. Напишите функцию, которая пытается найти индекс строки в массиве: на вход получает массив и строку для поиска, возвращает опционал индекс этой строки в массиве.
func cityBox (cityArrow: [String], citySearch: String) -> Int? {
    
    let cityIndex =  cityArrow.firstIndex(of: citySearch)
    return cityIndex
}

cityBox(cityArrow: ["Moscow", "Singapore", "Bangkok"], citySearch: "Bangkok")
cityBox(cityArrow: ["Moscow", "Singapore", "Bangkok"], citySearch: "Tokio")

//9. Чему будет равен result?
//var age = Int("25.") ?? 0
//Ответ: 0 (так как "25." в формате String)

//var result = age < 18 ? "Hello, young man/woman" : "Hello grown man/woman"
//Ответ: "Hello, young man/woman" (так как 0 < 18)

//result += " \(age)»
//Ответ: "Hello, young man/woman 0"

//10. Чему будет равен result?
//func inc(a: Int) -> Int{  //(5+3), (3+3)
//    return a + 3
//}
//func dec(a: Int) -> Int{ //(5-5), (3-5)
//    return a - 5
//}
//
//
//func compute(a: Int) -> Int{
//    return inc(a: a) + dec(a: a) //(8 + 0), (6-2)
//}
//
//
//let result = compute(a: 5) - compute(a: 3) // (8-4)
// Ответ: 4, Порядок действий: result = (((5+3)+(5-5))-(((3+3)+(3-5))) = ((8-0)-((6-2)) = (8-4)

//Дополнительные задания
//Функции
//Напишите, можно ли в функции вернуть tuple?
//Ответ: да
func tuple1 (_ notes: [String]) -> (today: NSDate, list: String, amount: Int) {
    let amountBox = notes.count
    let listBox = notes.joined(separator:", ")
    let todayBox = NSDate()
    return(todayBox, listBox, amountBox)
}

let notes = ["mask", "sanitizer", "gloves"]
tuple1(notes)

// Можно ли внутри функции написать другую функцию?
// Ответ: да

func payload(_ payloadOnBoard: Int) -> String {

    func passengerLuggage(_ passenger: Int) -> Int {
        func luggage(_ places: Int) -> Int{
            return places
        }
        
        let sumLuggage = luggage(passenger) * 25
        return sumLuggage
    }
    
    let currentPayload = passengerLuggage(payloadOnBoard)
    let estimatedPayload = 1000
    let statusPayload = (currentPayload <= estimatedPayload) ? "normal" : "excess"
    return statusPayload
}

payload(50)

//Опционалы
//Напишите, в каких случаях следует использовать восклицательный знак для опционалов.
// Ответ: восклицательный знак для опционалов нужно использовать только, когда мы точно уверены что опциональное значение не равно nill. Если опционал не содержит значение, и мы его принудительно извлечем, то произойдет ошибка и приложение упадет. Чтобы этого не происходило, лучше использовать тернарный оператор.
