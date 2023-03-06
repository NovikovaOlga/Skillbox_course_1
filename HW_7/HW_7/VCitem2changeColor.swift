//
//  VCitem2changeColor.swift
//  HW_7
//
//  Created by Olga Novikova on 12.11.2020.
//

import UIKit

protocol VCitem2changeColorDelegate { // делегат для события при передаче на предыдущий экран
    func setColor(_ color: String)
}

class VCitem2changeColor: UIViewController {
    
    var labelColorChange = "" // для записи (отображения) выбора в текстовом поле
    
    var delegate: VCitem2changeColorDelegate? // для делегата (если вызываем)
    
    @IBOutlet weak var labelChange: UILabel!
    
    @IBAction func buttonChangeGreen(_ sender: Any) { // кнопка выбрать зеленый
        labelChange.text = "Выбран зеленый"
        delegate?.setColor(labelChange.text!)
        dismiss(animated: true, completion: nil) // закроем текущий контроллер
    }
    
    @IBAction func buttonChangeBlue(_ sender: Any) { // кнопка выбрать синий
        labelChange.text = "Выбран синий"
        delegate?.setColor(labelChange.text!)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func buttonChangeRed(_ sender: Any) { // кнопка выбрать красный
        labelChange.text = "Выбран красный"
        delegate?.setColor(labelChange.text!)
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelChange.text = labelColorChange // устанавливаем значение в текстовое поле
    }
}

