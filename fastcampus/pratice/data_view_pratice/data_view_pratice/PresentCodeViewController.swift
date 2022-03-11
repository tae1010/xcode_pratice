//
//  PresentCodeViewController.swift
//  data_view_pratice
//
//  Created by 김정태 on 2022/02/13.
//

import UIKit

class PresentCodeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func dismissButton(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)

    }
    

}
