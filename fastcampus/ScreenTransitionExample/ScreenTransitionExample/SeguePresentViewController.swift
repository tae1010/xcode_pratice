//
//  SeguePresentViewController.swift
//  ScreenTransitionExample
//
//  Created by 김정태 on 2022/01/14.
//

import UIKit

class SeguePresentViewController: UIViewController {
    
    @IBOutlet weak var testLabel: UILabel!
    var test: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let test = self.test {
            self.testLabel.text = test
        }

    }
    
    @IBAction func tapBackButton(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    
}
