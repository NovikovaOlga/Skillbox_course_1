//
//  ViewController_1_4.swift
//  HW_9
//
//  Created by Olga Novikova on 18.11.2020.
//

import UIKit

//Поставьте в одну линию два лейбла: левый лейбл должен иметь отступ от левого края 8 pt, правый лейбл — 8 pt от правого края. Между лейблами отступ тоже 8 pt.
//Если у обоих лейблов очень длинный текст, сделайте так, чтобы правый лейбл имел ширину 40 pt, а левый занимал всё остальное пространство. При этом если в левом лейбле мало текста, то правый лейбл бы занимал всё доступное свободное пространство (при этом левый лейбл — помещался бы полностью).

class ViewController_2_1: UIViewController {
    
    let text1 = "Алиса"
    let text2 = "Все, что сказано три раза, становится истиной"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label1.text = "левый"
        label2.text = "правый"
    }
    
    @IBOutlet weak var label1: UILabel! // просто поле 1
    @IBOutlet weak var label2: UILabel! // просто поле 2
    
//    @IBOutlet weak var label1width: NSLayoutConstraint! // длина поля 1 (по умолчанию приоритет 999)
//    @IBOutlet weak var label2width: NSLayoutConstraint! // длина поля 2 (по умолчанию приоритет 999)
    
    @IBAction func button1(_ sender: Any) {
        label1.text = text2
        label2.text = text2
        
//        if label1.text! >= label2.text! {
//            label2width.constant = 40
//            label2width.priority = UILayoutPriority(rawValue: 900)
//            label1width.priority = UILayoutPriority(rawValue: 600)
//            view.layoutIfNeeded()
//        }
    }
    
    @IBAction func button2(_ sender: Any) {
        label1.text = text1
        label2.text = text2
        
//        if label1.text! < label2.text! {
//            label1width.priority = UILayoutPriority(rawValue: 900)
//            label2width.priority = UILayoutPriority(rawValue: 600)
//            view.layoutIfNeeded()
//        }
    }
}
