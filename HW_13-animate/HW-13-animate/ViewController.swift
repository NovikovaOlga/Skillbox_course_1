
import UIKit

class ViewController: UIViewController {
    
    var taskIndex = 0 // переменная для записи индекса в любом случае
    
    let task = ["0 - Изменение цвета фона квадрата на жёлтый",
                "1 - Перемещение в правый верхний угол экрана",
                "2 - Закругление краёв, чтобы квадрат выглядел как круг",
                "3 - Поворот на 180 градусов",
                "4 - Исчезание»",
                "5 - Сначала увеличение в два раза, потом анимированное уменьшение обратно",
                "6 - Бесконечную анимацию поворота"]
    
    @IBOutlet weak var redBox: UIView!
    @IBOutlet weak var numberQuests: UILabel! // номер
    @IBOutlet weak var descriptionQuests: UILabel! // описание
    
    @IBAction func forthStep(_ sender: Any) {
        if taskIndex + 1 != 7 {
            taskIndex += 1
            eggDuck()
            numberQuests.text = String (taskIndex + 1)
            print(taskIndex)
        }
    }
    
    @IBAction func backStep(_ sender: Any)  {
        if taskIndex != 0 {
            taskIndex -= 1
            eggDuck()
            numberQuests.text = String (taskIndex + 1)
            print(taskIndex)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redBox.backgroundColor = UIColor.red
        numberQuests.text = String (taskIndex + 1)
        eggDuck()
    }
    
    func eggDuck(){ // можно оставить в перечислении само исполнение, но мне удобнее вынести
        descriptionQuests.text = task[taskIndex]
        switch taskIndex {
        case 0: case0()
        case 1: case1()
        case 2: case2()
        case 3: case3()
        case 4: case4()
        case 5: case5()
        case 6: case6()
        default: print("ой")
        }
    }
    
    func case0() {
        UIView.animate(withDuration: 2, animations: {
            self.redBox.backgroundColor = UIColor.yellow
        }) {(isCompeted) in // вернем в исходное состояние
            self.redBox.backgroundColor = UIColor.red
        }
    }
    
    func case1() {
        UIView.animate(withDuration: 2, animations: {
            self.redBox.transform = CGAffineTransform(translationX: -157, y: -99)
        }) {(isCompeted) in
            self.redBox.transform = CGAffineTransform(translationX: 0, y: 0)
            //  self.redBox.frame = CGRect(x: 157, y: 99, width: 100, height: 100 )
        }
    }
    
    func case2() {
        UIView.animate(withDuration: 2, animations: {
            self.redBox.layer.cornerRadius = 50
        }) {(isCompeted) in
            self.redBox.layer.cornerRadius = 0
        }
    }
    
    func case3() {
        UIView.animate(withDuration: 2, animations: {
            self.redBox.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        }) {(isCompeted) in
            self.redBox.transform = CGAffineTransform(rotationAngle: CGFloat.pi/360)
        }
    }
    
    func case4() {
        UIView.animate(withDuration: 2, animations: {
            self.redBox.alpha = 0.0
        }) {(isCompeted) in
            self.redBox.alpha = 1.0
        }
    }
    
    func case5() {
        UIView.animate(withDuration: 2, animations: {
            self.redBox.transform = CGAffineTransform(scaleX: 2, y: 2)
            
        }) {(isCompeted) in
            UIView.animate(withDuration: 2, animations: {
                self.redBox.transform = CGAffineTransform(scaleX: 1, y: 1)
            })
        }
    }
    
    func case6() {
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        animation.toValue = CGFloat.pi * 2 // полный круг
        animation.duration = 1.5
        animation.repeatCount = .infinity
        redBox.layer.add(animation, forKey: nil)
        
    
        //            UIView.animate(withDuration: 0.5, delay: 0, options: .repeat, animations: {
        //                self.redBox.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        //            })
    }
}

