//
//  SecondViewController.swift
//  data_view_pratice
//
//  Created by 김정태 on 2022/02/10.
//

import UIKit

class SegueSecondViewController: UIViewController {

    @IBOutlet weak var segueLabel: UILabel!
    var text: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        show()
        
    }
    private func show() {
        if let text = self.text {
            self.segueLabel.text = text
        }
    }
    

}
