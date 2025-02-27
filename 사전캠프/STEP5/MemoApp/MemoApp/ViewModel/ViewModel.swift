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
    
    private(set) var memoList: [MemoList] {
        didSet {
            delegate?.didUpdatedMemoList()
            saveMemoToUserDefaults()
        }
    }
    
    // ViewModel 생성시 UserDefaults에서 저장된 값이 있는지 검사하고 불러오기
    init() {
        if let data = UserDefaults.standard.value(forKey: UserDefaultsKey.memoList.rawValue) as? Data {
            let arr = try! PropertyListDecoder().decode(Array<MemoList>.self, from: data)
            self.memoList = arr
        } else {
            self.memoList = []
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
    
    // UserDefaults로 구조체배열 인코딩 후 저장
    private func saveMemoToUserDefaults() {
        UserDefaults.standard.setValue(try? PropertyListEncoder().encode(self.memoList),
                                       forKey: UserDefaultsKey.memoList.rawValue)
    }
}
