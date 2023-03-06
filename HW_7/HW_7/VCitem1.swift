//
//  ViewController.swift
//  HW_7
//
//  Created by Olga Novikova on 11.11.2020.
//

import UIKit

class VCitem1: UIViewController {

    @IBAction func buttonRed(_ sender: Any) { // переход на красный экран
        performSegue(withIdentifier: "ToRed", sender: nil)
    }
    
    @IBAction func buttonBlue(_ sender: Any) { // переход на синий экран
        performSegue(withIdentifier: "ToBlue", sender: nil)
    }
    
    @IBAction func buttonGreen(_ sender: Any) { // переход на зеленый экран
        performSegue(withIdentifier: "ToGreen", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

