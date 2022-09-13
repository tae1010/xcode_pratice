//
//  MainViewController.swift
//  Autolayout_Pratice1
//
//  Created by 김정태 on 2022/09/13.
//

import UIKit

class MainViewController: UIViewController {
    
    
    @IBOutlet weak var popupStatusLabel: UILabel!
    
    var checkPopup: Bool = true // popup 상태
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.checkPopup = UserDefault().loadUserDefault()
        showPopupStatus()
        print("앱을 실행할때 checkPopup 상태", self.checkPopup)
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
        self.checkPopup.toggle()
        UserDefault().saveUserdefault(checkPopup: checkPopup)
        showPopupStatus()
    }

    // MARK: - 현재 팝업상태 보여주기
    func showPopupStatus() {
        popupStatusLabel.text = String(checkPopup)
    }
    
    // MARK: - 팝업창 띄우기
    func showPopup() {
        
        guard let popUpViewController = storyboard?.instantiateViewController(withIdentifier: "PopUpViewController") as? PopUpViewController else { return }
        popUpViewController.delegate = self

        popUpViewController.modalPresentationStyle = .overCurrentContext
        popUpViewController.modalTransitionStyle = .crossDissolve
        self.present(popUpViewController, animated: true, completion: nil)
    }
    
}

extension MainViewController: CheckPopupDelegate {
    
    func checkPopupDelegate(checkPopup: Bool) {
        print("delegate 실행 후 현재 Popup 상태체크 \(checkPopup)")
        self.checkPopup = checkPopup
        showPopupStatus()
    }

}
