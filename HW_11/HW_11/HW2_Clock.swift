//
//  MoveToTrash.swift
//  HW_11
//
//  Created by Olga Novikova on 05.12.2020.
//

import UIKit

// ЗАДАНИЕ 2:
// часы с часовой, минутной и секундной стрелками, у которых можно менять цвет и размер каждой стрелки;

// @IBInspectable - говорит о том, что сами элементы можно изменять прямо в сториборде (появятся поля)
@IBDesignable class HW2_Clock: UIView { // увидим все изменения сразу в сториборде (после того как поработали слово @IBDesignable лучше закомментировать, так как дизайнить элемент удобно, но сильно загружает сториборд)
    
   
    // маркеры: ширина, длина, цвет
    var markerSize: CGFloat = 6 // размер маркера в ширину
    var markerLength: CGFloat = 12 // длина маркера
    var markerColor: UIColor = UIColor.purple // цвет маркера
    
    var hourLineOffset: CGFloat = 60 // отступ от края часов часовой стрелкой (для красоты
    var minuteLineOffset: CGFloat = 45 // отступ от края часов минутной стрелкой (для красоты
    var secondLineOffset: CGFloat = 30 // отступ от края часов секундной стрелкой (для красоты
    // Можно изменить размер в сториборде
    @IBInspectable var hourLineSize: CGFloat = 6 // размер часовой стрелки
    
    @IBInspectable var minuteLineSize: CGFloat = 4 // размер минутной стрелки
    @IBInspectable var secondLineSize: CGFloat = 2 // размер секундной стрелки
    // можно изменить цвет в сториборде
    @IBInspectable var hourLineColor: UIColor = UIColor.systemPink // цвет часовой стрелки
    @IBInspectable var minuteLineColor: UIColor = UIColor.orange // цвет минутной стрелки
    @IBInspectable var secondLineColor: UIColor = UIColor.yellow // цвет секундной стрелки
    
    var hours: CGFloat = 4 { // начальное значение времени для указания часовой стрелки
        didSet { updateHours() } // при изменении часов - вызываем апдейт
    }
    
    var minutes: CGFloat = 35 { // начальное значение времени для указания часовой стрелки
        didSet {  updateMinutes() } // при изменении часов - вызываем апдейт
    }
    
    var seconds: CGFloat = 58{ // начальное значение времени для указания часовой стрелки
        didSet { updateSeconds() } // при изменении часов - вызываем апдейт
    }
    
    var roundedViewColor = UIColor.purple // цвет центра часов
    
    // набор маркером часов
    private let topMarker = UIView() // верх
    private let leftMarker = UIView() // лево
    private let rightMarker = UIView() // право
    private let bottomMarker = UIView() // низ
    
    private let hourLine = UIView() // часовая стрелка
    private let minuteLine = UIView() // минутная стрелка
    private let secondLine = UIView() // секундная стрелка
    
    private let roundedView = UIView() // центр часов (кружочек)
    
    // в этой функции добавляем вью элементы, которые нам нужны
    override func layoutSubviews() { // вызывается при загрузке, при изменении размера и по системным запросам
        super.layoutSubviews()
        
        let w = frame.size.width // зададим константу ширины для удобства
        let h = frame.size.height // зададим константу длины для удобства
        
        hourLine.layer.anchorPoint = CGPoint(x: 0.5, y: 1) // точка, вокруг которой крутится часовая стрелка
        minuteLine.layer.anchorPoint = CGPoint(x: 0.5, y: 1) // минутная
        secondLine.layer.anchorPoint = CGPoint(x: 0.5, y: 1) // секундная
        
        // часовая стрелка
        hourLine.frame = CGRect(x: w / 2 - hourLineSize / 2, y: hourLineOffset, width: hourLineSize, height: h/2 - hourLineOffset) // по умолчанию стрелка указывает в ноль-ноль
        hourLine.backgroundColor = hourLineColor // цвет стрелки
        
        // минутная стрелка
        minuteLine.frame = CGRect(x: w / 2 - minuteLineSize / 2, y: minuteLineOffset, width: minuteLineSize, height: h/2 - minuteLineOffset) // по умолчанию стрелка указывает в ноль-ноль
        minuteLine.backgroundColor = minuteLineColor // цвет стрелки
        
        // секундная стрелка
        secondLine.frame = CGRect(x: w / 2 - secondLineSize / 2, y: secondLineOffset, width: secondLineSize, height: h/2 - secondLineOffset) // по умолчанию стрелка указывает в ноль-ноль
        secondLine.backgroundColor = secondLineColor // цвет стрелки
        
        // зададим положение всех маркеров
        topMarker.frame = CGRect(x: w / 2 - markerSize / 2, y: 0, width: markerSize, height: markerLength)
        bottomMarker.frame = CGRect(x: w / 2 - markerSize / 2, y: h - markerLength, width: markerSize, height: markerLength)
        leftMarker.frame = CGRect(x: 0, y: h / 2 - markerSize / 2, width: markerLength, height: markerSize)
        rightMarker.frame = CGRect(x: w - markerLength, y: h / 2 - markerSize / 2, width: markerLength, height: markerSize)
        
        // зададим цвет в цикле для каждого маркера
        for v in [topMarker, leftMarker, rightMarker, bottomMarker]{
            v.backgroundColor = markerColor // для всех маркеров
        }
        
        roundedView.backgroundColor = roundedViewColor // цвет центра часов
        roundedView.frame = CGRect(x: w / 2 - 8, y: h / 2 - 8, width: 16, height: 16) // положение центра часов
        roundedView.layer.cornerRadius = 8 // закругление центра часов
        
        layer.cornerRadius = frame.size.width / 2 // сделаем часы круглыми
        
        // обновим часы
        updateHours()
        updateMinutes()
        updateSeconds()
        
        // добавим все на часы
        for v in [topMarker, leftMarker, rightMarker, bottomMarker, hourLine, minuteLine, secondLine, roundedView]{
            addSubview(v)
        }
    }
    
    func updateHours(){  // поворачиваем часовую стрелку часов
        let angleHours = CGFloat.pi * 2 * (hours / CGFloat(12))  // угол для часовой
        hourLine.transform = CGAffineTransform(rotationAngle: angleHours) // поворот стрелки на нужный угол
    }
    
    func updateMinutes(){  // поворачиваем минутную стрелку часов
        let angleMinutes = CGFloat.pi * 2 * (minutes / CGFloat(60))  // угол для минутной
        minuteLine.transform = CGAffineTransform(rotationAngle: angleMinutes) // поворот стрелки на нужный угол
    }
    
    func updateSeconds(){  // поворачиваем секундную стрелку часов
        let angleSeconds = CGFloat.pi * 2 * (seconds / CGFloat(60))  // угол для секундной
        secondLine.transform = CGAffineTransform(rotationAngle: angleSeconds) // поворот стрелки на нужный угол
    }
}
