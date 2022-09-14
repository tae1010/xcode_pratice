//
//  TagLabel.swift
//  SearchView_Pratice
//
//  Created by 김정태 on 2022/09/14.
//

import Foundation
import UIKit

class TagLabel: UILabel {

    var labelText: String = " "
    var padding = UIEdgeInsets(top: 5.0, left: 10.0, bottom: 5.0, right: 10.0)
    
    init(inputLabelText: String) {
        self.init()
        self.labelText = inputLabelText
        initializeLabel()
    }
    
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: padding))
    }
    
    override var intrinsicContentSize: CGSize {
        var contentSize = super.intrinsicContentSize
        contentSize.height += padding.top + padding.bottom
        contentSize.width += padding.left + padding.right
        
        return contentSize
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
        self.textAlignment = .center
        self.layer.cornerRadius = 8
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor(red: 0.883, green: 0.861, blue: 0.861, alpha: 1).cgColor
        self.layer.masksToBounds = true
    }
    
}
