//
//  Model.swift
//  MemoApp
//
//  Created by 이민재 on 2/27/25.
//

import Foundation

enum Constant {
    
    // 추가버튼 SF Symbol 변수명
    static var ADD_BUTTON_NAME: String {
        return "square.and.pencil"
    }
    
    // 하단 탭바 높이
    static var TAB_BAR_HEIGHT: CGFloat {
        return 80
    }
    
    // 메모 셀 높이
    static var TABLEVIEW_CELL_HEIGHT: CGFloat {
        return 50
    }
    
    // Cell Label Constraint
    static var CELL_LABEL_CONSTRAINT: (top: CGFloat, bottom: CGFloat, leading: CGFloat, trailing: CGFloat) {
        return (top: 10, bottom: -10, leading: 20, trailing: -20)
    }
    
    // Custom Tabbar Label top Constraint
    static var TAB_BAR_LABEL_TOP_CONSTRAINT: CGFloat {
        return 10
    }
}

enum UserDefaultsKey: String {
    case memoList
}

struct MemoList: Codable {
    let detail: String
}

