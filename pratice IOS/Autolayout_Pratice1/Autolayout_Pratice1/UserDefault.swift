//
//  UserDefault.swift
//  Autolayout_Pratice1
//
//  Created by 김정태 on 2022/09/13.
//

import Foundation

class UserDefault {
    let popupUserDefaults = UserDefaults.standard
    
    // userdefault에 팝업창 띄우기 유무 저장
    func saveUserdefault(checkPopup: Bool) {
        popupUserDefaults.set(checkPopup, forKey: "checkPopup")
    }
    
    // Muserdefault 불러오기
    func loadUserDefault() -> Bool{
        // 저장된게 없으면 show하기
        guard let checkPopup = popupUserDefaults.object(forKey: "checkPopup") as? Bool else { return true }
        return checkPopup
    }
}
