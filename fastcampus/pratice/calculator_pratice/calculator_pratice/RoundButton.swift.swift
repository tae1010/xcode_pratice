//
//  RoundButton.swift.swift
//  Calculator_pratice
//
//  Created by 김정태 on 2022/01/26.
//

import UIKit

@IBDesignable //실시간으로 스토리보드에서 바뀜
class RoundButton: UIButton {
    @IBInspectable var isRound: Bool = false {
        didSet{
            if isRound {
                self.layer.cornerRadius = self.frame.height / 2
            }
        }
    }
}
