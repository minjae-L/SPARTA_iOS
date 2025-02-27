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
        return lb
    }()
    
    private func addViews() {
        self.addSubview(label)
    }
    
    private func configureLayout() {
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            label.topAnchor.constraint(equalTo: self.topAnchor, constant: 10)
        ])
    }
    
    func fetchCount(count: Int) {
        self.label.text = "\(count) 개의 메모"
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        addViews()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
