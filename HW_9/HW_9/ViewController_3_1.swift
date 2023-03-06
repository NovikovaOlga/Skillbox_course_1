//
//  ViewController_3_1.swift
//  HW_9
//
//  Created by Olga Novikova on 18.11.2020.
//

import UIKit

class ViewController_3_1: UIViewController {
    
    let textNew = "Кроличья нора сначала шла прямо, подобно туннелю, и затем неожиданно обрывалась вниз, так неожиданно, что Алиса, не имея ни секунды, чтобы остановиться, упала в глубокий колодец."
    
    
    @IBOutlet weak var label1: UILabel!
    
    @IBOutlet weak var labelHeight: NSLayoutConstraint!
    @IBAction func label1(_ sender: Any) {
        
        if labelHeight.constant == 22 { //проверим высоту строки
            labelHeight.constant += 88 // прибавим еще 4 строки, итого 5 строк
            labelHeight.priority = UILayoutPriority(950) // приоритет (основной приоритет в сториборде понизим до 999)
            view.layoutIfNeeded() //применим изменения констрейнтов к элементам
        } else {
            labelHeight.constant -= 88 // уменьшим на 4 строки и останется 1
            labelHeight.priority = UILayoutPriority(950)
            view.layoutIfNeeded()
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label1.text = textNew // загрузим текст
        labelHeight.constant = 22 // установим текст = 1 строка при таком шрифте
        labelHeight.priority = UILayoutPriority(950) // приоритет (основной приоритет в сториборде понизим до 999)
        view.layoutIfNeeded() // применим изменения констрейнтов к элементам
    }    
}
