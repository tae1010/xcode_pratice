//
//  CodePushViewController.swift
//  ScreenTransitionExample
//
//  Created by 김정태 on 2022/01/14.
//

import UIKit

class CodePushViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    var name: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let name = name{
            self.nameLabel.text = name
        }
    }
    
    @IBAction func tapCodePushButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
