//
//  ViewController.swift
//  Web_pratice
//
//  Created by 김정태 on 2021/09/28.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet var WebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let filePath = Bundle.main.path(forResource: "htmlView", ofType: "html")
        let myUrl = URL(fileURLWithPath: filePath!)
        let myRequest = URLRequest(url: myUrl)
        WebView.load(myRequest)
    }
    func loadWebPage(_ url: String){
        let myUrl = URL(string: url)
        let myRequest = URLRequest(url: myUrl!)
        WebView.load(myRequest)
    }


}

