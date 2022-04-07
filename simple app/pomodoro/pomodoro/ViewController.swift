//
//  ViewController.swift
//  pomodoro
//
//  Created by 김정태 on 2022/04/04.
//

import UIKit
import AudioToolbox // 알람소리 나게 하려고 import

enum TimerStatus {
    case start
    case pause
    case end
}

class ViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var prograssView: UIProgressView!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var toggleButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    var duration = 60
    var timerStatus: TimerStatus = .end
    var timer: DispatchSourceTimer?
    var currentSeconds = 0 // 현재 카운트되고 있는 시간을 초로 저장하는 프로퍼티
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureToggleButton()
        // Do any additional setup after loading the view.
    }

    //메소드가 실행되면 1초에 한번씩 핸들러에 있는 메소드가 실행
    func startTimer() {
        if self.timer == nil {
            self.timer = DispatchSource.makeTimerSource(flags: [], queue: .main)
            self.timer?.schedule(deadline: .now(), repeating: 1)//타이머가 시작되면 즉시 실행되게(3초후에 실행되게 하고싶으면 .now() +3 이런식으로 할당하면됨), 몇초마다 반복될지 설정
            self.timer?.setEventHandler(handler: { [weak self] in
                guard let self = self else { return }
                self.currentSeconds -= 1 //1초에 1씩 감소하게함
                let hour = self.currentSeconds / 3600
                let minutes = (self.currentSeconds % 3600) / 60
                let seconds = (self.currentSeconds % 3600) % 60
                self.timerLabel.text = String(format: "%02d:%02d:%02d", hour, minutes, seconds) // c언어에서 한거랑 비슷
                self.prograssView.progress = Float(self.currentSeconds) / Float(self.duration) //카운트 될때마다 prograss가 줄어들게됨
                UIView.animate(withDuration: 0.5, delay: 0, animations: {
                    self.imageView.transform = CGAffineTransform(rotationAngle: .pi) // 이미지뷰를 180도로 회전
                }) // delay : 애니매이션을 몇초뒤에 동작시킬지
                UIView.animate(withDuration: 0.5, delay: 0.5, animations: {
                    self.imageView.transform = CGAffineTransform(rotationAngle: .pi*2)
                })
                
                if self.currentSeconds <= 0 {
                    self.stopTimer()
                    AudioServicesPlaySystemSound(1005) //https://iphonedev.wiki/index.php/AudioServices 에서 확인가능
                }
            })
            self.timer?.resume()
        }
    }
    
    func stopTimer() {
        if self.timerStatus == .pause {
            self.timer?.resume() // resume을 해줘야지 에러 발생안함
        }
        self.timerStatus = .end
        self.cancelButton.isEnabled = false
        UIView.animate(withDuration: 0.5, animations: {
            self.timerLabel.alpha = 0
            self.prograssView.alpha = 0
            self.datePicker.alpha = 1
            self.imageView.transform = .identity // 정지를 누르면 이미지의 모양을 원상태로 바꿔줌
        })
        self.toggleButton.isSelected = false
        self.timer?.cancel()
        self.timer = nil // 타이머가끝나면 nil을 할당해서 메모리를 해제해줘야함
    }

    func setTimerInfoViewVisble(isHidden: Bool) {
        self.timerLabel.isHidden = isHidden
        self.prograssView.isHidden = isHidden
    }
    
    func configureToggleButton() {
        //버튼의 상태에 따라 변경
        self.toggleButton.setTitle("시작", for: .normal)
        self.toggleButton.setTitle("일시정지", for: .selected)
    }
    
    @IBAction func tapCancelButton(_ sender: UIButton) {
        switch self.timerStatus {
        case .start, .pause:
            
            self.stopTimer()
            
        default:
            break
        }
    }
    
    @IBAction func tapToggleButton(_ sender: UIButton) {
        self.duration = Int(self.datePicker.countDownDuration)
        
        switch self.timerStatus {
        case .end:
            self.currentSeconds = self.duration
            self.timerStatus = .start
            UIView.animate(withDuration: 0.5, animations: { //withDuration은 애니메이션을 몇초동안 지속할건지 설정
                self.timerLabel.alpha = 1
                self.prograssView.alpha = 1
                self.datePicker.alpha = 0
            })

            self.toggleButton.isSelected = true
            self.cancelButton.isEnabled = true
            self.startTimer()
            
        case .start:
            self.timerStatus = .pause
            self.toggleButton.isSelected = false
            self.timer?.suspend()
            
        case .pause:
            self.timerStatus = .start
            self.toggleButton.isSelected = true
            self.timer?.resume()
            
        default:
            break
        }
    }
}

