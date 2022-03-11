//
//  ViewController.swift
//  AutoLayOutExample
//
//  Created by 김정태 on 2022/01/13.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var colorView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tabChangeColorButton(_ sender: UIButton) {
        self.colorView.backgroundColor = UIColor.blue
    }
    
}

