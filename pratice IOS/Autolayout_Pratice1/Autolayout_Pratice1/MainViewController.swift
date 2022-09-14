//
//  MainViewController.swift
//  Autolayout_Pratice1
//
//  Created by 김정태 on 2022/09/13.
//

import UIKit

class MainViewController: UIViewController {
    
    
    @IBOutlet weak var popupStatusLabel: UILabel!
    
    var checkPopup: Bool = UserDefault().loadUserdefault() // popup 상태
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(changeLabel), name: .changeLabel, object: nil)
        self.popupStatusLabel.text = String(self.checkPopup)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        checkPopup 확인후 popup창 띄우기
//        if checkPopup == true {
//            showPopup()
//        }
    }
    
    // MARK: - Action함수
    
    // 팝업 보여주기 버튼 클릭
    @IBAction func showPopupButton(_ sender: UIButton) {
        self.showPopup()
    }
    
    // popup 상태 바꾸기
    @IBAction func changePopupStatus(_ sender: UIButton) {
        self.checkPopup = UserDefault().loadUserdefault()
        self.checkPopup.toggle()
        UserDefault().saveUserdefault(checkPopup: self.checkPopup)
    }
    
    // MARK: - 팝업창 띄우기
    func showPopup() {
        guard let popUpViewController = storyboard?.instantiateViewController(withIdentifier: "PopUpViewController") as? PopUpViewController else { return }
        popUpViewController.modalPresentationStyle = .overCurrentContext
        popUpViewController.modalTransitionStyle = .crossDissolve
        self.present(popUpViewController, animated: true, completion: nil)
    }
    
    // MARK: - selector
    
    // label text 바꾸기
    @objc func changeLabel() {
        var changeLabel = String(UserDefault().loadUserdefault())
        print("changeLabel", changeLabel)
        self.popupStatusLabel.text = changeLabel
    }
    
}


// MARK: - notification을 사용해서 userDefault값이 바뀌면 실행
extension Notification.Name {
    static let changeLabel = Notification.Name("changeLabel")
}
