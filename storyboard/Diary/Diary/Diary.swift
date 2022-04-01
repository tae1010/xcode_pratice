//
//  Diary.swift
//  Diary
//
//  Created by 김정태 on 2022/03/28.
//

import Foundation

struct Diary {
    var uuidString: String // 일기를 생성할때마다 일기 id값을 지정
    var title: String
    var contents: String
    var date: Date
    var isStar: Bool
}
