//
//  Work3viewController.swift
//  HW_8
//
//  Created by Olga Novikova on 15.11.2020.
//

import UIKit

//3. Разберитесь с UISegmentedControl: пусть она имеет три сегмента и в зависимости от выбранного сегмента под ним показывается:
//    первый сегмент — зелёная view с двумя текстовыми полями;
//    второй сегмент — синяя view с двумя кнопками;
//    третий сегмент — фиолетовая view с двумя картинками.
class Work3viewController: UIViewController {

    @IBOutlet weak var segmented: UISegmentedControl!
    @IBOutlet weak var viewWork3: UIView!
    
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    
    @IBAction func segmentedChange(_ sender: UISegmentedControl) {
        switch segmented.selectedSegmentIndex {
        case 0:
            viewWork3.backgroundColor = .green
            viewWork3.isHidden = false
            textField1.isHidden = false
            textField2.isHidden = false
            button1.isHidden = true
            button2.isHidden = true
            image1.isHidden = true
            image2.isHidden = true
        case 1:
            viewWork3.backgroundColor = .blue
            viewWork3.isHidden = false
            textField1.isHidden = true
            textField2.isHidden = true
            button1.isHidden = false
            button2.isHidden = false
            image1.isHidden = true
            image2.isHidden = true
        case 2:
            viewWork3.backgroundColor = .purple
            viewWork3.isHidden = false
            textField1.isHidden = true
            textField2.isHidden = true
            button1.isHidden = true
            button2.isHidden = true
            image1.isHidden = false
            image2.isHidden = false
        default:
            print("break down")
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewWork3.backgroundColor = .green
        viewWork3.isHidden = false
        textField1.isHidden = false
        textField2.isHidden = false
        button1.isHidden = true
        button2.isHidden = true
        image1.isHidden = true
        image2.isHidden = true
    }
}
