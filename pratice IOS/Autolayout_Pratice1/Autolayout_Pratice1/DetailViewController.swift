//
//  DetailViewController.swift
//  Autolayout_Pratice1
//
//  Created by 김정태 on 2022/09/13.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // 뒤로가기
    @IBAction func backButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
