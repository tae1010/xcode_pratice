//
//  ViewController.swift
//  TodoList
//
//  Created by 김정태 on 2022/03/03.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var editButton: UIBarButtonItem!
    var doneButton: UIBarButtonItem?
    
    var tasks = [Task]() {
        didSet {
            self.saveTasks()
        }
    } //할 일을 저장하는 배열
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonTap))
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.loadTasks()
        // Do any additional setup after loading the view.
    }
    
    //selector 안에 넣어줄 함수
    @objc func doneButtonTap() {
        //편집모드인 상태에서 done버튼을 누르면 edit버튼으로 바뀌고 편집모드를 빠져나옴
        self.navigationItem.leftBarButtonItem = self.editButton
        self.tableView.setEditing(false, animated: true)
    }

    @IBAction func tapEditButton(_ sender: UIBarButtonItem) {
        guard !self.tasks.isEmpty else { return } //편집모드(edit)는 테이블뷰가 비어있으면 의미가 없기떄문
        self.navigationItem.leftBarButtonItem = self.doneButton // 바 버튼을 바꾸는 구문
        self.tableView.setEditing(true, animated: true) //편집모드 실행
    }
    
    @IBAction func tapAddButton(_ sender: UIBarButtonItem) {
        //alert 설정
        let alert = UIAlertController(title: "할일 등록", message: nil, preferredStyle: .alert)
        
        //alert에 버튼 정의(handler는 alert 버튼을 눌렀을떄 실행되는 기능)
        let registerButton = UIAlertAction(title: "등록", style: .default, handler: { [weak self] _ in
            guard let title = alert.textFields?[0].text else { return }//alert창에 첫번째 textfield에 있는 값을 title 변수에 저장
            let task = Task(title: title, done: false)
            self?.tasks.append(task)
            self?.tableView.reloadData() //테이블뷰를 업데이트(전체적으로 업데이트하기 때문에 시간이 오래걸릴수도 있음)
        })
        
        //취소버튼(취소 버튼이기떄문에 스타일은 캔슬, 별다른 할일은 없기떄문에 핸들러는nil)
        let cancelButton = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alert.addAction(cancelButton)
        alert.addAction(registerButton)
       
        alert.addTextField(configurationHandler: { textfield in
            textfield.placeholder = "할 일을 입력해주세요"
        })
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func saveTasks() {
        let data = self.tasks.map {
            [
                "title": $0.title,
                "done": $0.done
            ]
        }
        let userDefaults = UserDefaults.standard
        userDefaults.set(data, forKey: "tasks")
    }
    
    func loadTasks() {
        let userDefaults = UserDefaults.standard
        guard let data = userDefaults.object(forKey: "tasks") as? [[String: Any]] else {return}
        self.tasks = data.compactMap {
            guard let title = $0["title"] as? String else { return nil }
            guard let done = $0["done"] as? Bool else { return nil }
            return Task(title: title, done: done)
        }
    }
}

extension ViewController : UITableViewDataSource {
    
    //각 세션에 표시할 행의 갯수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //행의 갯수는 tasks 배열에 저장되어있는 갯수로 지정
        return self.tasks.count
    }
    
    //특정 세션에 n번째 로우를 그리는데 필요한 셀을 반환하는 함수
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //queue를 사용해서 셀을 재사용(만약 테이블뷰에 100개의 셀이 있으면 100개를 메모리에 할당할 수 없음 그래서 셀을 재사용해야함(화면에 보이는 셀만 표시해줌))
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let task = self.tasks[indexPath.row]
        cell.textLabel?.text = task.title
        
        // 체크표시를 해주는 if-else문
        if task.done {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        return cell
    }
    
    //편집모드에서 삭제버튼을 누를떄 어떤셀인지 알려주는 메서드
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        self.tasks.remove(at: indexPath.row)
        //편집모드에서 삭제할수 있고 편집모드를 들어가지 않아도 스와이프로 삭제가능
        tableView.deleteRows(at: [indexPath], with: .automatic)

        //모든셀이 삭제되면 편집모드에서 빠져나오게 설정
        if self.tasks.isEmpty {
            self.doneButtonTap()
        }
    }
    
    //편집모드에서 할일의 순서를 변경하는 메소드(canmoverowat, moverowat)
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    //sourceindexpath는 셀이 원래 있었던 위치, destinationindexpath는 셀이 이동한 위치
    //셀의 위치가 바뀌면 배열의 순서도 바꿔줘야함
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        var tasks = self.tasks
        let task = tasks[sourceIndexPath.row]
        tasks.remove(at: sourceIndexPath.row)
        tasks.insert(task, at: destinationIndexPath.row)
        self.tasks = tasks
    }
    
}

extension ViewController : UITableViewDelegate {
    
    //셀을 선택했을때 나타나는 이벤트(task 배열에 있는 done이 true false바뀌게 하는 메소드를 구현)
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var task = self.tasks[indexPath.row]
        task.done = !task.done
        self.tasks[indexPath.row] = task
        
        //선택된 셀만 reload되게함
        //at : 선택된 셀의 인덱스 정보를 넘기고, with : 행이 업데이트 될떄 어떤 애니메이션 효과를 보여줄지 정해줌(automatic은 시스템이 알아서 하게 설정)
        self.tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}
