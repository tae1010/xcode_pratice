//
//  ShowLabelViewController.swift
//  LEDBoard_pratice
//
//  Created by 김정태 on 2022/02/09.
//

import UIKit

class ShowLabelViewController: UIViewController, LEDSettingDelegate {
    
    @IBOutlet weak var textLabel: UILabel!
    var text: String? = "라벨"
    var textColor: UIColor = .black
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let text = self.text {
            self.textLabel.text = text
        }
        self.textLabel.textColor = self.textColor
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewcontroller = segue.destination as? ViewController {
            viewcontroller.LedBoardDelegate = self
        }
    }
    
    func changeSetting(text: String?, textColor: UIColor, backgroundColor: UIColor) {
        if let text = text {
            self.textLabel?.text = text
        }
        self.textLabel?.textColor = textColor
        self.view.backgroundColor = backgroundColor
    }
    
}
