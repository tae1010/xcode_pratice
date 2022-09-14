//
//  SearchLabel.swift
//  SearchView_Pratice
//
//  Created by 김정태 on 2022/09/14.
//

import Foundation
import UIKit

class SearchLabel: UILabel {

    var labelText: String = " "
    
    init(inputLabelText: String) {
        self.init()
        self.labelText = inputLabelText
        initializeLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func initializeLabel() {
        self.text = self.labelText
        self.textColor = UIColor(red: 0.425, green: 0.391, blue: 0.391, alpha: 1)
        self.font = UIFont(name: "NanumGothicOTF", size: 12)
        self.textAlignment = .left
    }
    
}

