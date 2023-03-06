//
//  GenerationViewController.swift
//  HW_8
//
//  Created by Olga Novikova on 14.11.2020.
//

import UIKit

// 2. Используя цикл, сгенерируйте на экране четыре UIImageView и лейблы, как показано на картинке слева (дополнительные элементы генерировать не нужно).
class Work2viewController: UIViewController {
    
    let foto = [UIImage(named: "walter"),
                UIImage(named: "pinkman"),
                UIImage(named: "henk"),
                UIImage(named: "sol"),
                UIImage(named: "gektor")]
    
    let name = ["Уолтер Уайт", "Джесси Пинкман", "Хенк Шрейдер", "Сол Гудман", "Гектор Саламанка"]
    
    let actor = ["Брайан Крэнстон", "Аарон Пол", "Дин Норрис", "Боб Оденкерк", "Марк Маргулис"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // размеры фото
        let fotoWidth = 150
        let fotoHeight = 150
        // начальные значения координат фото
        var fotoCoordinateX = 0
        var fotoCoordinateY = 0
        var stepY = 0
        // цикл для х положения фото в два ряда в зависимости от четности
        for i in 0...foto.count - 1 {
            if i % 2 == 0 {
                fotoCoordinateX = 10
                stepY += 1 // шаг для оси Y
            } else {
                fotoCoordinateX = 210
            }
    
           fotoCoordinateY = stepY * 240 //смещение для каждого шага по Y
            
            let imageView = UIImageView()
            imageView.image = foto[i] // индексы фото в галерее для цикла
            
            let label1 = UILabel() // лейбл 1
            label1.text = "Герой сериала:"
            
            let label2 = UILabel() // лейбл 2
            label2.text = name[i]
            label2.font = .boldSystemFont(ofSize: 16)
            label2.textColor = .blue
            
            let label3 = UILabel() // лейбл 3
            label3.text = actor[i]
            label3.textColor = .gray
            label3.font = .italicSystemFont(ofSize: 16)
            
            var iA = i
            var iB = i + 1
            //первый ряд
            if i == 0 || i == 1 {
                // во всех рядах и у всех элементов пришлось сделать смещение вверх на 200 единиц, так как шаг 240, для каждого ряда смещает первый ряд сильно вниз (возможно это не лучший вариант(( )
                imageView.frame = CGRect(x: fotoCoordinateX, y: fotoCoordinateY - 200, width: Int(fotoWidth), height: Int(fotoHeight))
                label1.frame = CGRect(x: fotoCoordinateX, y: fotoCoordinateY - 200 + 90, width: Int(fotoWidth), height: Int(fotoHeight))
                label2.frame = CGRect(x: fotoCoordinateX, y: fotoCoordinateY - 200 + 110, width: Int(fotoWidth), height: Int(fotoHeight))
                label3.frame = CGRect(x: fotoCoordinateX, y: fotoCoordinateY - 200 + 130, width: Int(fotoWidth), height: Int(fotoHeight))
                iA += 1
                iB += 1
                //fotoCoordinateY = stepY * 200
            }
            //второй и последующий - цикл через проверку условия
            if i > 1 {
                while iB <= foto.count {
                    imageView.frame = CGRect(x: fotoCoordinateX, y: fotoCoordinateY - 200, width: Int(fotoWidth), height: Int(fotoHeight))
                    label1.frame = CGRect(x: fotoCoordinateX, y: fotoCoordinateY - 200 + 90, width: Int(fotoWidth), height: Int(fotoHeight))
                    label2.frame = CGRect(x: fotoCoordinateX, y: fotoCoordinateY - 200 + 110, width: Int(fotoWidth), height: Int(fotoHeight))
                    label3.frame = CGRect(x: fotoCoordinateX, y: fotoCoordinateY - 200 + 130, width: Int(fotoWidth), height: Int(fotoHeight))
                    iA += 1
                    iB += 1
                    // fotoCoordinateY = stepY * 200
                }
            }
            view.addSubview(imageView)
            view.addSubview(label1)
            view.addSubview(label2)
            view.addSubview(label3)
        }
    }
}
