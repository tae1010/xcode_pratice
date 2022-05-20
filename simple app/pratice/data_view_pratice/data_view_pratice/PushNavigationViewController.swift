//
//  PushNavigationViewController.swift
//  data_view_pratice
//
//  Created by 김정태 on 2022/02/13.
//

import UIKit

class PushNavigationViewController: UIViewController {

    @IBOutlet weak var pushLabel: UILabel!
    var pushL: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let pushL = pushL {
            self.pushLabel.text = pushL
        }

        // Do any additional setup after loading the view.
    }

}
