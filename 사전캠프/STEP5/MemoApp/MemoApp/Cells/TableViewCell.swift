//
//  CustomTableViewCell.swift
//  MemoApp
//
//  Created by 이민재 on 2/27/25.
//

import UIKit

final class CustomTableViewCell: UITableViewCell {
    
    static let identifier = "CustomTableViewCell"
    
    private var titleLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.textAlignment = .left
        lb.numberOfLines = 0
        return lb
    }()
    
    private func addViews() {
        contentView.addSubview(titleLabel)
    }
    
    private func configureLayout() {
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constant.CELL_LABEL_CONSTRAINT.leading),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: Constant.CELL_LABEL_CONSTRAINT.trailing),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constant.CELL_LABEL_CONSTRAINT.top),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: Constant.CELL_LABEL_CONSTRAINT.bottom)
            
        ])
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(model: MemoList) {
        self.titleLabel.text = model.detail
    }
}
