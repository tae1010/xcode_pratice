//
//  ViewController.swift
//  LEDBoard_pratice
//
//  Created by 김정태 on 2022/02/09.
//

import UIKit

protocol LEDSettingDelegate: AnyObject {
    func changeSetting(text: String?, textColor: UIColor, backgroundColor: UIColor)
}

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var orangeButton: UIButton!
    @IBOutlet weak var purpleButton: UIButton!
    @IBOutlet weak var yellowButton: UIButton!
    @IBOutlet weak var blackButton: UIButton!
    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var greenButton: UIButton!
    
    weak var LedBoardDelegate: LEDSettingDelegate?
    var textcolor: UIColor? = .orange
    var backgroundColor: UIColor? = .black
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func clickTextColorButton(_ sender: UIButton) {
        if sender == orangeButton {
            self.changeAlphaTextColor(color: .orange)
            self.textcolor = .orange
        } else if sender == purpleButton {
            self.changeAlphaTextColor(color: .purple)
            self.textcolor = .purple
        } else {
            self.changeAlphaTextColor(color: .yellow)
            self.textcolor = .yellow
        }
    }
    
    @IBAction func clickBacgroundColorButton(_ sender: UIButton) {
        if sender == self.blackButton {
            self.changeBackgroundColor(color: .black)
            self.backgroundColor = .black
        } else if sender == self.blueButton {
            self.changeBackgroundColor(color: .blue)
            self.backgroundColor = .blue
        } else {
            self.changeBackgroundColor(color: .green)
            self.backgroundColor = .green
        }
    }
    
    @IBAction func change(_ sender: UIButton) {
    }
    
    private func changeAlphaTextColor(color: UIColor) {
        self.orangeButton.alpha = color == .orange ? 1 : 0.2
        self.purpleButton.alpha = color == .purple ? 1 : 0.2
        self.yellowButton.alpha = color == .yellow ? 1 : 0.2
    }
    
    private func changeBackgroundColor(color: UIColor) {
        self.blackButton.alpha = color == .black ? 1 : 0.2
        self.blueButton.alpha = color == .blue ? 1 : 0.2
        self.greenButton.alpha = color == .green ? 1 : 0.2
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let showLabelViewController = segue.destination as? ShowLabelViewController {
            showLabelViewController.text = self.textField.text
            showLabelViewController.textColor = self.textcolor ?? .black
            showLabelViewController.view.backgroundColor = self.backgroundColor
        }
    }
    
    
}

