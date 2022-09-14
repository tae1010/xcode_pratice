//
//  ViewController.swift
//  SearchView_Pratice
//
//  Created by 김정태 on 2022/09/14.
//

import UIKit

class ViewController: UIViewController {
    
    let tagKeyward1 = ["빡코딩", "코딩", "오늘도 빡코딩", "할라피뇨"]
    let tagKeyward2 = ["코딩", "빡코딩", "버거킹", "돈까스"]
    let tagKeyward3 = ["치즈", "오므라이스", "핫도그", "아이스 아메리카노"]
    let popularWard = ["빡코딩", "오늘도 빡코딩", "버거킹", "오므라이스", "핫도그", "아이스크림", "치즈", "빡코딩", "빡코딩", "오늘도 빡코딩", "버거킹", "오므라이스", "핫도그"]
    let searchLabel = UILabel() //검색 label
    let searchBarView = UIView() // searchBar view
    let searchBarTextField = UITextField() // searchBar textField
    let searchBarImageView = UIImageView() // searchBar ImageView
    let recommandLabel = UILabel() // 추천 키워드 label
    let popularLabel = UILabel() // 인기 검색어 label
    
    // 추천 키워드 테그 첫번째 줄 (horizontalStackView)
    lazy var horizontalTagStackView1: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 9
        stackView.alignment = .fill
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    // 추천 키워드 테그 두번째 줄 (horizontal StackView)
    lazy var horizontalTagStackView2: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 9
        stackView.alignment = .fill
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    // 추천 키워드 테그 세번째 줄 (horizontal StackView)
    lazy var horizontalTagStackView3: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 9
        stackView.alignment = .fill
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    // 추천 키워드 테그 1,2,3줄 합친 vertical StackView
    lazy var recommandTagVerticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 9
        stackView.alignment = .leading
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // 인기 검색어 vertical StakView
    lazy var popularVerticalstackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 10
        stackView.alignment = .leading
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
}

// configure view
extension ViewController {
    // MARK: - 뷰 구성
    func configure() {
        configureSearchLabel()
        configureSearchbarView()
        configureSearchBarImageView()
        configureSearchBarTextField()
        configureRecommadLabel()
        configureHorizontalTagStackView()
        configureVerticalTagStackView()
        configurePopularLabel()
        configurePopularVerticalStackView()
    }
    
    // MARK: - 검색 Label구성
    func configureSearchLabel() {
        searchLabel.font = UIFont(name: "NanumGothicOTFBold", size: 24)
        searchLabel.text = "검색"
        self.view.addSubview(searchLabel)
        searchLabel.translatesAutoresizingMaskIntoConstraints = false
        searchLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant:30).isActive = true
        searchLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 15).isActive = true
    }
    
    // MARK: - searchbar 구성 (searchBar View)
    func configureSearchbarView() {
        searchBarView.backgroundColor = UIColor(red: 0.967, green: 0.967, blue: 0.967, alpha: 1)
        searchBarView.layer.cornerRadius = 6
        self.view.addSubview(searchBarView)
        searchBarView.translatesAutoresizingMaskIntoConstraints = false
        searchBarView.topAnchor.constraint(equalTo: self.searchLabel.bottomAnchor, constant: 16).isActive = true
        searchBarView.leadingAnchor.constraint(equalTo: self.searchLabel.leadingAnchor).isActive = true
        searchBarView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        searchBarView.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }
    
    // MARK: - searchbar 구성 (왼쪽에 돋보기 이미지)
    func configureSearchBarImageView() {
        searchBarImageView.image = UIImage(systemName: "magnifyingglass")
        searchBarImageView.contentMode = .scaleAspectFit
        searchBarImageView.tintColor = UIColor(red: 0.758, green: 0.758, blue: 0.758, alpha: 1)
    
        self.searchBarView.addSubview(searchBarImageView)
        self.searchBarImageView.translatesAutoresizingMaskIntoConstraints = false
        searchBarImageView.topAnchor.constraint(equalTo: self.searchBarView.topAnchor, constant: 12).isActive = true
        searchBarImageView.leadingAnchor.constraint(equalTo: searchBarView.leadingAnchor, constant: 13).isActive = true
        searchBarImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        searchBarImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    // MARK: - searchbar 구성 (textField)
    func configureSearchBarTextField() {
        self.searchBarTextField.placeholder = "아이템을 검색해 보세요"
        searchBarTextField.font = UIFont(name: "NanumGothicOTF", size: 14)
        self.searchBarView.addSubview(searchBarTextField)
        self.searchBarTextField.translatesAutoresizingMaskIntoConstraints = false
        searchBarTextField.centerYAnchor.constraint(equalTo: self.searchBarImageView.centerYAnchor).isActive = true
        searchBarTextField.leadingAnchor.constraint(equalTo: self.searchBarImageView.trailingAnchor, constant: 8.5).isActive = true
        searchBarTextField.trailingAnchor.constraint(equalTo: self.searchBarView.trailingAnchor, constant: -15).isActive = true
        searchBarTextField.heightAnchor.constraint(equalToConstant: 16).isActive = true
    }
    
    // MARK: - 추천키워드 label구성
    func configureRecommadLabel() {
        
        recommandLabel.font = UIFont(name: "NanumGothicOTFBold", size: 16)
        recommandLabel.text = "추천 키워드"
        self.view.addSubview(recommandLabel)
        recommandLabel.translatesAutoresizingMaskIntoConstraints = false
        recommandLabel.topAnchor.constraint(equalTo: self.searchBarView.bottomAnchor, constant: 24).isActive = true
        recommandLabel.leadingAnchor.constraint(equalTo: self.searchLabel.leadingAnchor).isActive = true
    }
    
    // MARK: - 추천 키워드 Horizontal StackView 구성
    // customLabel을 만들어 text값만 초기화 시켜주면 label구성 되게 만듬
    func configureHorizontalTagStackView() {
        tagKeyward1.forEach({
            self.horizontalTagStackView1.addArrangedSubview(TagLabel(inputLabelText: $0))
        })
        
        tagKeyward2.forEach({
            self.horizontalTagStackView2.addArrangedSubview(TagLabel(inputLabelText: $0))
        })
        
        tagKeyward3.forEach({
            self.horizontalTagStackView3.addArrangedSubview(TagLabel(inputLabelText: $0))
        })
    }
    
    // MARK: - 추천 키워드 Vertical StackView 구성
    func configureVerticalTagStackView() {
        self.view.addSubview(recommandTagVerticalStackView)
        self.recommandTagVerticalStackView.addArrangedSubview(horizontalTagStackView1)
        self.recommandTagVerticalStackView.addArrangedSubview(horizontalTagStackView2)
        self.recommandTagVerticalStackView.addArrangedSubview(horizontalTagStackView3)
        
        self.recommandTagVerticalStackView.translatesAutoresizingMaskIntoConstraints = false
        recommandTagVerticalStackView.topAnchor.constraint(equalTo: self.recommandLabel.bottomAnchor, constant: 16).isActive = true
        recommandTagVerticalStackView.leadingAnchor.constraint(equalTo: self.searchLabel.leadingAnchor).isActive = true
    }
    
    // MARK: - 인기검색어 label 구성
    func configurePopularLabel() {
        popularLabel.font = UIFont(name: "NanumGothicOTFBold", size: 16)
        popularLabel.text = "인기 검색어"
        self.view.addSubview(popularLabel)
        popularLabel.translatesAutoresizingMaskIntoConstraints = false
        popularLabel.topAnchor.constraint(equalTo: self.recommandTagVerticalStackView.bottomAnchor, constant: 25).isActive = true
        popularLabel.leadingAnchor.constraint(equalTo: self.searchLabel.leadingAnchor).isActive = true
    }
    
    // MARK: - 인기 검색어 verticalStackView 구성
    func configurePopularVerticalStackView() {
        self.view.addSubview(popularVerticalstackView)
        
        popularWard.forEach({
            self.popularVerticalstackView.addArrangedSubview(SearchLabel(inputLabelText: $0))
        })
        
        self.popularVerticalstackView.translatesAutoresizingMaskIntoConstraints = false
        popularVerticalstackView.topAnchor.constraint(equalTo: self.popularLabel.bottomAnchor, constant: 16).isActive = true
        popularVerticalstackView.leadingAnchor.constraint(equalTo: self.searchLabel.leadingAnchor).isActive = true
    }

}
