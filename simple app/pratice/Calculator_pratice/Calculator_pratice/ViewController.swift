//
//  ViewController.swift
//  Calculator_pratice
//
//  Created by 김정태 on 2022/01/26.
//

import UIKit

enum Operation {
    case add
    case minus
    case mul
    case divide
    case unknown
}

class ViewController: UIViewController {

    @IBOutlet weak var numberScreen: UILabel!
    var displayNum = ""
    var firstNum = ""
    var secondNum = ""
    var answer = ""
    var currentOperation: Operation = .unknown
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func acButton(_ sender: UIButton) {
        self.firstNum = ""
        self.secondNum = ""
        self.answer = ""
        self.displayNum = ""
        self.numberScreen.text = "0"
        self.currentOperation = .unknown
        
    }
    
    @IBAction func numberButton(_ sender: UIButton) {
        guard let numberValue = sender.titleLabel?.text else {return}
        if displayNum.count < 10{
            self.displayNum += numberValue
            self.numberScreen.text = self.displayNum
        }
    }
    
    @IBAction func dotButton(_ sender: UIButton) {
        if !self.displayNum.contains(".") {
            self.displayNum += self.displayNum.isEmpty ? "0." : "."
            self.numberScreen.text = self.displayNum
        }
    }
    
    @IBAction func divide(_ sender: UIButton) {
        self.operation(.divide)
    }
    
    @IBAction func mul(_ sender: UIButton) {
        self.operation(.mul)
    }
 
    
    @IBAction func minus(_ sender: UIButton) {
        self.operation(.minus)
    }
    
    
    @IBAction func plus(_ sender: UIButton) {
        self.operation(.add)
    }
    
    @IBAction func equal(_ sender: UIButton) {
        self.operation(self.currentOperation)
    }
    
    func operation(_ operation: Operation) {
        if currentOperation != .unknown {
            if !displayNum.isEmpty {
                self.secondNum = self.displayNum
                self.displayNum = ""
                
                guard let firstNum = Double(self.firstNum) else {return}
                guard let secondNum = Double(self.secondNum) else {return}
                
                switch self.currentOperation {
                case .add:
                    self.answer = "\(firstNum + secondNum)"
                case .minus:
                    self.answer = "\(firstNum - secondNum)"
                case .mul:
                    self.answer = "\(firstNum * secondNum)"
                case .divide:
                    self.answer = "\(firstNum / secondNum)"
                default:
                    break
                }
                
                // ex) 27/3 = 9.0으로 뜨는것을 막기 위해 쓴 if문
                if let answer = Double(self.answer), answer.truncatingRemainder(dividingBy: 1) == 0 {
                    self.answer = "\(Int(answer))"
                }
                
                self.firstNum = self.answer
                self.numberScreen.text = self.answer
            }
            self.currentOperation = operation
            
            
        } else {
            self.firstNum = self.displayNum
            self.displayNum = ""
            self.currentOperation = operation
        }
    }
}

