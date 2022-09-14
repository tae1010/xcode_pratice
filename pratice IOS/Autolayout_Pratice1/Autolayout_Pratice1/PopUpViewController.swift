//
//  ViewController.swift
//  Autolayout_Pratice1
//
//  Created by 김정태 on 2022/09/13.
//

import UIKit

class PopUpViewController: UIViewController {

    @IBOutlet var backgroundView: UIView! // backgroundView
    @IBOutlet weak var contentView: UIView! // 이미지뷰, 자세히보기 버튼, 다시보지않기 버튼, 닫기 버튼으로 구성
    @IBOutlet weak var detailButton: UIButton! // 자세히보기 버튼

    var checkPopup: Bool = true // popup창 상태
    
    override func viewDidLoad() {
        print("popup viewdidload")
        super.viewDidLoad()
        
        self.tabBackgroundView()
        self.configureContentView()
        self.configureDetailButton()
    }

    // MARK: - Action함수
    // 자세히보기 버튼 클릭
    @IBAction func detailButton(_ sender: UIButton) {
        
        guard let detailViewController = storyboard?.instantiateViewController(withIdentifier: "detailViewController") as? DetailViewController else { return }

        self.present(detailViewController, animated: true, completion: nil)
    }
    
    // 다시보지않기 버튼클릭
    @IBAction func neverSeeButton(_ sender: UIButton) {
        print("다시보지않기 버튼클릭")
        self.checkPopup = false
        UserDefault().saveUserdefault(checkPopup: self.checkPopup)
        self.dismiss(animated: true)
    }

    // 닫기 버튼클릭
    @IBAction func closeButton(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    // backgroundView 클릭시 팝업창 닫기
    private func tabBackgroundView() {
        let tabBackgroundView = UITapGestureRecognizer(target: self, action: #selector(tabBackgroundSelector))
        self.backgroundView.addGestureRecognizer(tabBackgroundView)
        self.backgroundView.isUserInteractionEnabled = true
    }
    
    // MARK: - selector
    // backgroundView 클릭 selector
    @objc func tabBackgroundSelector(sender: UITapGestureRecognizer) {
        self.dismiss(animated: true)
    }
    
}

// MARK: - configure View
extension PopUpViewController {
    
    // contentView configure
    private func configureContentView() {
        self.contentView.clipsToBounds = true
        self.contentView.layer.cornerRadius = 8
    }
    
    // 자세히보기 버튼 configure
    private func configureDetailButton() {
        self.detailButton.clipsToBounds = true
        self.detailButton.layer.cornerRadius = 20
    }
    
}
