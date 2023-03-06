//
//  ViewController.swift
//  HW_6
//
//  Created by Olga Novikova on 09.11.2020.
//
//a. Текущее значение текстфилда и все предыдущие, для которых была нажата кнопка. Разделитель — пробел. Например, в поле ввели «Никита», нажали кнопку — в лейбл выведется «Никита». В поле ввели «Антон» и нажали на кнопку — в лейбл должно вывестись «Антон Никита» и так далее.
//b. При вводе целого числа в текстовое поле — значение 2 в степени этого числа. Если в текстовом поле не введено целое число, то выводится надпись «Введите целое число в строку».
//c. Для этой задачи сделайте три текстовых поля. По сути, это аналог калькулятора :) В первое поле вводится целое число, во второе — оператор (минус, плюс, умножить, делить), в третье поле — второе число. При нажатии на кнопку операция из второго поля применяется к числу из первого и третьего поля. Если где-то введены некорректные данные, в лейбл должно вывестись «Некорректные данные».


import UIKit

class ViewController: UIViewController {
    
    var boxNames: [String] = []  // Задание а: массив
    
    //Задание а: аутлеты
    @IBOutlet weak var taskAlabel: UILabel!
    @IBOutlet weak var taskAtextField: UITextField!
    @IBAction func taskAbutton(_ sender: Any){
    
        boxNames.insert((taskAtextField.text!), at: 0)  
        taskAlabel.text = "\(boxNames.joined(separator: " "))"
    }
    
    // Задание b: аутлеты
    @IBOutlet weak var taskBlabel: UILabel!
    @IBOutlet weak var taskBtextField: UITextField!
    @IBAction func taskBbutton(_ sender: Any) {
        
        let numberB = Int(taskBtextField.text!)
        taskBlabel.text = (numberB != nil) ? "\(pow(2, numberB!))" : "Введите целое число в строку"
    }
    
    // Задание с: аутлеты
    @IBOutlet weak var taskClabel: UILabel!
    @IBOutlet weak var taskCtextField1: UITextField!
    @IBOutlet weak var taskCtextField2: UITextField!
    @IBOutlet weak var taskCtextField3: UITextField!
    @IBAction func taskCbutton(_ sender: Any) {
        
        let number1 = Int(taskCtextField1.text!)
        let sign = String(taskCtextField2.text!)
        let number2 = Int(taskCtextField3.text!)
        let mess = "Некорректные данные"
        
        switch sign {
        case "+":
            taskClabel.text = ((number1 != nil) && (number2 != nil)) ? "\(number1! + number2!)" : mess
        case "-":
            taskClabel.text = ((number1 != nil) && (number2 != nil)) ? "\(number1! - number2!)" : mess
        case "*":
            taskClabel.text = ((number1 != nil) && (number2 != nil)) ? "\(number1! * number2!)" : mess
        case "/":
            taskClabel.text = ((number1 != nil) && (number2 != nil) && (number2 != 0)) ? "\(number1! / number2!)" : mess  // проверка деления на ноль
        default:
            taskClabel.text = mess
        }
    }
    
    override func viewDidLoad() { // До того как пользователь увидел экран: когда создан и проинициализирован
        super.viewDidLoad() // переопределяем
        
        // Все label в attribute inspector имеют lines = 2 (чтобы длинные сообщения умещались в две строки)
        taskAlabel.text = " " // Задание а: установка начального значения
        taskBlabel.text = " " // Задание b: установка начального значения
        taskClabel.text = " " // Задание c: установка начального значения
        
    }
}

