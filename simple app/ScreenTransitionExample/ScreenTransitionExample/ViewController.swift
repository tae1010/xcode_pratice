//
//  ViewController.swift
//  ScreenTransitionExample
//
//  Created by 김정태 on 2022/01/14.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    @IBAction func tapCodePushButton(_ sender: UIButton) {
        guard let viewController = self.storyboard?.instantiateViewController(identifier: "CodePushViewController") as? CodePushViewController else {return}
        
        viewController.name = "kjt"
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    
    @IBAction func tabCodePresentButton(_ sender: UIButton) {
        guard let viewController = self.storyboard?.instantiateViewController(identifier: "CodePresentViewController") as? CodePresentViewController else {return}
        viewController.modalPresentationStyle = .fullScreen
        
        viewController.delegate = self
        self.present(viewController, animated: true, completion: nil)
    }
    
    
    
    //segue에서 쓰는 값전달 방식
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? SeguePushViewController {
            viewController.name = "KJTTTT"
            print("push")
        }
        
        if let seguepresentvc = segue.destination as? SeguePresentViewController {
            seguepresentvc.test = "test"
            print("present")
        }
    }
    
    
}

extension ViewController: SendDataDelegate {
    
    func sendData(name: String) {
        self.nameLabel.text = name
        self.nameLabel.sizeToFit()
    }
}
