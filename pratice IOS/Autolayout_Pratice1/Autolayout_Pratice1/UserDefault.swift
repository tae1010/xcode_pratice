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
        NotificationCenter.default.post(name: .changeLabel, object: nil, userInfo: nil) // 값이 바뀌고 저장하면 chaneLabel함수 실행
        
    }
    
    // Muserdefault 불러오기
    func loadUserdefault() -> Bool{
        // 저장된게 없으면 show하기
        print("loadUserdefault")
        guard let checkPopup = popupUserDefaults.object(forKey: "checkPopup") as? Bool else { return true }
        
        return checkPopup
    }
}
