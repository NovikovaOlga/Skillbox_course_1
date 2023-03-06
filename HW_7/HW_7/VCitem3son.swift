//
//  VCitem3onBoard.swift
//  HW_7
//
//  Created by Olga Novikova on 12.11.2020.
//

import UIKit

protocol VCitem3momDelegate {
    func setColor(_ color: UIColor) // функция фона
}

class VCitem3son: UIViewController {
    
    var colorMom = UIColor()  // переменная для хранения значения цвета
    var colorSon = UIColor() {
        didSet {view.backgroundColor = colorSon}
    }
    
    var delegateColor: VCitem3momDelegate? // протокол
    
    @IBAction func sonGreen(_ sender: Any) { 
        colorMom = .green // загружаем цвет в переменную
        delegateColor?.setColor(colorMom) // делегат со значением переменной (цвет)
    }
    
    @IBAction func colorYellow(_ sender: Any) {
        colorMom = .yellow // загружаем цвет в переменную
        delegateColor?.setColor(colorMom) // делегат со значением переменной (цвет)
    }
    
    @IBAction func colorPurple(_ sender: Any) {
        colorMom = .purple // загружаем цвет в переменную
        delegateColor?.setColor(colorMom) // делегат со значением переменной (цвет)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
