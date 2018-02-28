//
//  ViewController.swift
//  Count20180228
//
//  Created by 伊藤 遥 on 2018/02/28.
//  Copyright © 2018年 Haruka Ito. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var label: UILabel!
    @IBOutlet var plusButton: UIButton!
    @IBOutlet var minusButton: UIButton!
    var count: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func plus() {
        count += 1
        label.text = String(count)
        
        textColor()
        buttonMuko()
        
        if count == 0 {
            plusButton.shake()
        }
    }
    
    @IBAction func minus() {
        count -= 1
        label.text = String(count)
        
        textColor()
        buttonMuko()
        
        if count == 0 {
            minusButton.shake()
        }
    }
    
    func textColor() {
        if count <= -10 {
            label.textColor = UIColor.blue
        } else if count >= 10 {
            label.textColor = UIColor.red
        } else {
            label.textColor = UIColor.black
        }
    }
    
    func buttonMuko() {
        if count <= -20 {
            minusButton.isEnabled = false
        } else if count >= 20 {
            plusButton.isEnabled = false
        } else {
            minusButton.isEnabled = true
            plusButton.isEnabled = true
        }
    }
    
    func yureru() {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension UIButton {

    func shake() {
        
        let shake = CABasicAnimation(keyPath: "position")
        shake.duration = 0.1
        shake.repeatCount = 2
        shake.autoreverses = true
        
        let fromPoint = CGPoint(x: center.x - 5, y: center.y)
        let fromValue = NSValue(cgPoint: fromPoint)
        
        let toPoint = CGPoint(x: center.x + 5, y: center.y)
        let toValue = NSValue(cgPoint: toPoint)
        
        shake.fromValue = fromValue
        shake.toValue = toValue
        
        layer.add(shake, forKey: "position")
    }
}



