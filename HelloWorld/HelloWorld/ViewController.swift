//
//  ViewController.swift
//  HelloWorld
//
//  Created by 김정태 on 2021/05/08.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var lblHello: UILabel!
    @IBOutlet var txtName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func btnSend(_ sender: UIButton) {
        lblHello.text = "Hello, " + txtName.text! + "!!"
    }
}

