//
//  WriteDiaryViewController.swift
//  Diary
//
//  Created by 김정태 on 2022/03/28.
//

import UIKit

enum DiaryEditorMode {
    case new
    case edit(IndexPath, Diary)
}

protocol WriteDiaryViewDelegate: AnyObject {
    func didSelectRegister(diary: Diary)
}

class WriteDiaryViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentsTextView: UITextView!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var confirmButton: UIBarButtonItem!
    
    private let datePicker = UIDatePicker()
    private var diaryDate: Date?
    
    weak var delegate: WriteDiaryViewDelegate?
    
    var diaryEditorMode: DiaryEditorMode = .new
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureContentsTextView()
        self.configureDatePicker()
        self.configureInputField()
        self.configureEditMode()
        self.confirmButton.isEnabled = false // 등록버튼 비활성화상태로 해둠
    }
    
    private func configureEditMode() {
        switch self.diaryEditorMode {
        case let .edit(_, diary):
            self.titleTextField.text = diary.title
            self.contentsTextView.text = diary.contents
            self.dateTextField.text = self.dateToString(date: diary.date)
            self.confirmButton.title = "수정"
            
        default:
            break
        }
    }
    
    private func dateToString(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yy년 MM월 dd일(EEEEE)"
        formatter.locale = Locale(identifier: "ko_KR")
        return formatter.string(from: date)
    }
    
    private func configureInputField() {
        self.contentsTextView.delegate = self
        self.titleTextField.addTarget(self, action: #selector(titleTextFieldDidChange(_:)), for: .editingChanged)
        self.dateTextField.addTarget(self, action: #selector(dateTextFieldDidChange(_:)), for: .editingChanged)
    }
    
    @objc private func titleTextFieldDidChange(_ textField: UITextField) {
        self.validateInputField()
    }
    
    @objc private func dateTextFieldDidChange(_ textField: UITextField) {
        self.validateInputField()
    }
    
    //텍스트뷰의 테두리색을 조정
    private func configureContentsTextView() {
        let borderColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1.0)
        self.contentsTextView.layer.borderColor = borderColor.cgColor
        self.contentsTextView.layer.borderWidth = 0.5
        self.contentsTextView.layer.cornerRadius = 5.0
    }
    
    //텍스트뷰를 눌렀을때 datepicer를 띄우게 하려는 함수
    private func configureDatePicker() {
        self.datePicker.datePickerMode = .date
        self.datePicker.preferredDatePickerStyle = .wheels
        
        //1. 타켓설정(해당 뷰 컨트롤러에서 처리하므로 self로 설정, 2. 이벤트가 발생할때 호출될 메소드를 셀렉터로 지정, 3. 이벤트가 일어났을때 정의한 메소드가 일어날지 정해줌(valuechanged : 값이 변경될때))
        self.datePicker.addTarget(self, action: #selector(datePickerValueDidChange(_:)), for: .valueChanged)
        self.dateTextField.inputView = self.datePicker // 텍스트뷰를 클릭시 datepicker가 뜸
        
    }
    
    @objc private func datePickerValueDidChange(_ datePicker: UIDatePicker) {
        let formmater = DateFormatter()
        formmater.dateFormat = "yyyy년 MM월 dd일(EEEEE)"
        formmater.locale = Locale(identifier: "ko_KR")
        self.diaryDate = datePicker.date
        self.dateTextField.text = formmater.string(from: datePicker.date)
        self.dateTextField.sendActions(for: .editingChanged)
    }
    
    //유저가 화면을 터치하면 실행되는 메소드(빈화면을 누르면 키보드나 데이트피커가 사라지게함)
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    //delegate패턴으로 등록버튼을 눌렀을때 collectionview생성
    @IBAction func tabConfirmButton(_ sender: UIBarButtonItem) {
        guard let title = self.titleTextField.text else { return }
        guard let contents = self.contentsTextView.text else { return }
        guard let date = self.diaryDate else { return }
        
        
        switch self.diaryEditorMode {
        case .new:
            let diary = Diary(uuidString: UUID().uuidString, title: title, contents: contents, date: date, isStar: false)
            self.delegate?.didSelectRegister(diary: diary)
            
        case let .edit(indexPath, diary):
            let diary = Diary(uuidString: UUID().uuidString, title: title, contents: contents, date: date, isStar: diary.isStar)
            NotificationCenter.default.post(name: NSNotification.Name("editDiary"), object: diary, userInfo: nil)
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    //라벨에 값이 들어가 있는지 안들어가 있는지 판단해서 버튼 활성화
    private func validateInputField() {
        self.confirmButton.isEnabled = !(self.titleTextField.text?.isEmpty ?? true) && !(self.dateTextField.text?.isEmpty ?? true) && !self.contentsTextView.text.isEmpty
    }
    
}

extension WriteDiaryViewController: UITextViewDelegate {
    
    //라벨에 내용을 적을떄마다 불려지는 함수
    func textViewDidChange(_ textView: UITextView) {
        self.validateInputField()
    }
}
