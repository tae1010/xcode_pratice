//
//  ViewController.swift
//  data_view_pratice
//
//  Created by 김정태 on 2022/02/10.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var segueTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let segueSecondViewController = segue.destination as? SegueSecondViewController {
            if let text = segueTextField.text {
                segueSecondViewController.text = text
            }
        }
    }
    
    
    @IBAction func pushNavigationButton(_ sender: UIButton) {
        guard let pushnavigationviewcontroller = self.storyboard?.instantiateViewController(withIdentifier: "PushNavigationViewController") as? PushNavigationViewController else {return}
        pushnavigationviewcontroller.pushL = "잘갔나?"
        
        self.navigationController?.pushViewController(pushnavigationviewcontroller, animated: true)
    }
    
    
    @IBAction func presentCode(_ sender: UIButton) {
        guard let presentcode = self.storyboard?.instantiateViewController(withIdentifier: "PresentCodeViewController") else {return}
        
        self.present(presentcode, animated: true, completion: nil)
    }
    

}

