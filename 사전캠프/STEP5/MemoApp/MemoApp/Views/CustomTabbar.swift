//
//  CustomTabbar.swift
//  MemoApp
//
//  Created by 이민재 on 2/27/25.
//

import UIKit

class CustomTabbar: UIView {
    
    private var label: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "0 개의 메모"
        return lb
    }()
    
    private func addViews() {
        self.addSubview(label)
    }
    
    private func configureLayout() {
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            label.topAnchor.constraint(equalTo: self.topAnchor, constant: Constant.TAB_BAR_LABEL_TOP_CONSTRAINT)
        ])
    }
    
    func fetchCount(count: Int) {
        self.label.text = "\(count) 개의 메모"
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.backgroundColor = .white
        addViews()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
