//
//  ViewController.swift
//  HW_8
//
//  Created by Olga Novikova on 14.11.2020.
//

import UIKit

// 1. Сделайте проект-галерею: большой UIImageView и под ним две кнопки: «Назад» и «Дальше». Добавьте в проект 10 картинок, и по нажатию на кнопки должна показываться соответственно предыдущая или следующая картинка.
class Work1viewController: UIViewController {
    
    let galleryBB = [UIImage(named: "walter"),
                     UIImage(named: "pinkman"),
                     UIImage(named: "skyler"),
                     UIImage(named: "henk"),
                     UIImage(named: "mari"),
                     UIImage(named: "walterMl"),
                     UIImage(named: "sol"),
                     UIImage(named: "gektor"),
                     UIImage(named: "gustavo"),
                     UIImage(named: "ted")]
    
    var currentIndex = 0 // переменная для записи индекса в любом случае
    var statusIndex = 0 // переменная для записи индекса, ТОЛЬКО при выполнении условия
    
    @IBOutlet weak var indexFoto: UITextField! // поле с индексом фото
    
    @IBOutlet weak var foto: UIImageView! // фото из галереи
    
    @IBAction func forthStep(_ sender: Any) { // кнопка вперед
        
        statusIndex = currentIndex + 1 // если нажимать кнопку много раз, то индекс уйдет за пределы массива
        if statusIndex < galleryBB.count {
            currentIndex += 1 // индекс в переделах массива
            foto.image = galleryBB[currentIndex]
            indexFoto.text = String(currentIndex) // отобразим индекс
        }
    }
    
    @IBAction func backStep(_ sender: Any) { // кнопка назад
        statusIndex = currentIndex - 1 // если нажимать кнопку много раз, то индекс уйдет за пределы массива
        if statusIndex >= 0 {
            foto.image = galleryBB[statusIndex]
            currentIndex -= 1 // индекс в переделах массива
            indexFoto.text = String(currentIndex) // отобразим индекс
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        foto.image = galleryBB[0] // фото при загрузке
        indexFoto.text = String(statusIndex)  // индекс фото в текстовом поле (можно и current index)
    }
}

