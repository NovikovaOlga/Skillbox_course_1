//
//  VCitem3.swift
//  HW_7
//
//  Created by Olga Novikova on 12.11.2020.
//

import UIKit

class VCitem3mom: UIViewController {
    
    var itemSon: VCitem3son! // ссылка на встроенный контроллер
    var colorMomNew = UIColor() // переменная с цветом
    
    @IBAction func viewGreen(_ sender: Any) {
        itemSon.colorSon = .green
    }
    
    @IBAction func viewYellow(_ sender: Any) {
        itemSon.colorSon = .yellow
    }
    
    @IBAction func viewPurple(_ sender: Any) {
        itemSon.colorSon = .purple
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? VCitem3son, segue.identifier == "embedSon"{ // если переход по указанной сеге
            itemSon = vc // контролле в константу
            vc.delegateColor = self //делегат
        }
    }
    func updateVCitem3(){ // функция обновления цвета основного экрана
        view.backgroundColor = colorMomNew
    }
}

extension VCitem3mom: VCitem3momDelegate{ // расширение для контроллера (наследование делегата)
    func setColor(_ color: UIColor) { // функция из протокола
        self.colorMomNew = color // данные со встроенного контроллера (переданные делегатом)
        updateVCitem3()
    }
}


