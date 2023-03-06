//
//  HW3_SegmentedControl.swift
//  HW_11
//
//  Created by Olga Novikova on 06.12.2020.
//

import UIKit

// ЗАДАНИЕ 3:
//c) собственный аналог UISegmentControl, у которого:
//всегда есть два возможных варианта сегмента;
//выбранный элемент (по умолчанию — первый) имеет цветную подложку, при нажатии на второй сегмент подложка перемещается под него с анимацией, и наоборот;
//в интерфейсе можно задать названия сегментов, цвет обводки и цвет подложки;
//есть делегат, через который он будет сообщать о выбранном сегменте.

//По заданию 3 - выводить данные можно просто в лог через print(). Суть в том, чтобы кастомному сегменту создать протокол и назначить делегатом контроллер, на который сегмент добавлен. В протоколе функция об изменении сегмента.
protocol CarpetStatus {
    func carpetStatus (_ status: CGFloat) // статус подложки 1 или 2
}

@IBDesignable class HW3_SegmentedControl: UIView {
    
    var delegateCarpetStatus: CarpetStatus? // протокол
    
    private let carpetBox = UIView() // подложка
    private let oneBox = UIView() // первый сегмент
    private let twoBox = UIView() // второй сегмент
    private let oneBoxLabel = UILabel() // надпись первого сегмента
    private let twoBoxLabel = UILabel() // надпись второго сегмента
    
    @IBInspectable var carpetBoxColor: UIColor = UIColor.orange // цвет подложки
    @IBInspectable var oneBoxBorderColor: UIColor = UIColor.purple // обводка первого сегмента
    @IBInspectable var twoBoxBorderColor: UIColor = UIColor.systemPink // обводка второго сегмента
    
    @IBInspectable var oneBoxLabelText: String = "Сектор 1" // надпись первого сегмента
    @IBInspectable var twoBoxLabelText: String = "Сектор 2" // надпись второго сегмента
    
    var keeper: CGFloat = 1 // после перемещения подложки будем хранить данные о состоянии в этой переменной (1 = подложка в первом секторе)
    
    override func layoutSubviews() {// вызывается при загрузке, при изменении размера и по системным запросам
        super.layoutSubviews()
        
        let w = frame.size.width // зададим константу ширины для удобства
        let h = frame.size.height // зададим константу длины для удобства
        // подложка
        carpetBox.frame = CGRect(x: 0, y: 0, width: w / 2 , height: h ) // подложка уменьшенная на рамку
        carpetBox.backgroundColor = carpetBoxColor
        carpetBox.alpha = 0.5
        // сектор 1
        oneBox.frame = CGRect(x: 0, y: 0, width: w / 2, height: h)
        oneBox.layer.borderWidth = 2
        oneBox.layer.borderColor = oneBoxBorderColor.cgColor
        
        // надпись сектора 1
        oneBoxLabel.frame = CGRect(x: 4, y: h / 2 - 15, width: w / 2 - 8, height: 30)
        oneBoxLabel.textColor = UIColor.black
        oneBoxLabel.font = oneBoxLabel.font.withSize(20)
        oneBoxLabel.text = oneBoxLabelText
        
        // сектор 2
        twoBox.frame = CGRect(x: 100, y: 0, width: w / 2, height: h)
        twoBox.layer.borderWidth = 2
        twoBox.layer.borderColor = twoBoxBorderColor.cgColor
        
        // надпись сектора 2
        twoBoxLabel.frame = CGRect(x: 102, y: h / 2 - 15, width: w / 2 - 8, height: 30)
        twoBoxLabel.textColor = UIColor.blue
        twoBoxLabel.font = oneBoxLabel.font.withSize(20)
        twoBoxLabel.text = twoBoxLabelText
        
        
        
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(carpetBoxAnimate)) // константа для функции движения вперед
        let tapBack = UITapGestureRecognizer.init(target: self, action: #selector(carpetBoxAnimateBack)) // константа для функции движения назаl
        
        twoBox.addGestureRecognizer(tap) // обработка нажатия на сектор 1
        oneBox.addGestureRecognizer(tapBack) // обработка нажатия на сектор 2
        
        for s in [oneBox, twoBox, carpetBox, oneBoxLabel, twoBoxLabel] { // добавим элементы через цикл
            addSubview(s)
        }
    }
    @objc func carpetBoxAnimate() { // перемещении подложка на сектор 2
        if keeper == 1 { // хранитель в положении 1? тогда выполняем перемещение и записываем в хранителя положение 2
            UIView.animate(withDuration: 1, animations: { self.carpetBox.frame.origin.x += 100})
            keeper = 2
            delegateCarpetStatus?.carpetStatus(keeper)
        }
        print("Подложка в секторе \(keeper)")
    }

    @objc func carpetBoxAnimateBack() { //перемещение подложки на сектор 1 - обратно
        if keeper == 2 { // хранитель в положении 2? тогда выполняем перемещение и записываем в хранителя положение 1
            UIView.animate(withDuration: 1, animations: { self.carpetBox.frame.origin.x -= 100})
            keeper = 1
            delegateCarpetStatus?.carpetStatus(keeper) 
        }
        print("Подложка в секторе \(keeper)")
    }
}
