//
//  ViewModel.swift
//  MemoApp
//
//  Created by 이민재 on 2/27/25.
//

import Foundation

protocol ViewModelDelegate: AnyObject {
    func didUpdatedMemoList()
}

final class ViewModel {
    
    weak var delegate: ViewModelDelegate?
    
    private(set) var memoList: [MemoList] = [] {
        didSet {
            delegate?.didUpdatedMemoList()
        }
    }
    
    var memoCount: Int {
        return memoList.count
    }
    
    func addMemo(detail: String) {
        guard detail != "" else { return }
        memoList.append(MemoList(detail: detail))
    }
    
    func removeMemo(index: Int) {
        guard memoList.count > index else { return }
        memoList.remove(at: index)
    }
}
