//
//  ViewController.swift
//  QuotesGenerator_pratice
//
//  Created by 김정태 on 2022/01/25.
//

import UIKit

class ViewController: UIViewController {
    
    //Quote 구조체 타입을 가진 배열
    let quote = [
        Quote(contents: "명언1", person: "사람1"),
        Quote(contents: "명언2", person: "사람2"),
        Quote(contents: "명언3", person: "사람3"),
        Quote(contents: "명언4", person: "사람4")
    ]

    @IBOutlet weak var QuoteLabel: UILabel!
    @IBOutlet weak var QuotepersonLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func makeQuote(_ sender: UIButton) {
        let randomNum: Int = Int.random(in: 0..<4)
        self.QuoteLabel.text = quote[randomNum].contents
        self.QuotepersonLabel.text = quote[randomNum].person
    }
    
}

