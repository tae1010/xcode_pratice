//
//  ViewController.swift
//  QuotesGenerator
//
//  Created by 김정태 on 2022/01/13.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    let quotes = [
        Quote(contents: "명언1", name: "김"),
        Quote(contents: "명언2", name: "나"),
        Quote(contents: "명언3", name: "박")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tabQuoteGeneratorButton(_ sender: UIButton) {
        let randomNum = Int.random(in: 0..<3)
        let quote = quotes[randomNum]
        self.quoteLabel.text = quote.contents
        self.nameLabel.text = quote.name
    }
    
}

