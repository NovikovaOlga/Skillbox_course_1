//
//  VCitem2.swift
//  HW_7
//
//  Created by Olga Novikova on 12.11.2020.
//

import UIKit

class VCitem2: UIViewController {
    
    var labelColorNew = "Выбран зеленый"

    @IBOutlet weak var labelColor: UILabel!
    
    @IBAction func buttonMulti(_ sender: Any) {  // вместо этого можно было протянуть сегу
        performSegue(withIdentifier: "ToChangeColor", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelColor.text = labelColorNew
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { // передадим надпись на след экран
        if let vc = segue.destination as? VCitem2changeColor, segue.identifier == "ToChangeColor" {
            vc.labelColorChange = labelColor.text!
            vc.delegate = self
        }
    }
    
}

extension VCitem2: VCitem2changeColorDelegate{ // расширение для делегата
    func setColor(_ color: String) {
        labelColor.text = "\(color)"
    }
}
