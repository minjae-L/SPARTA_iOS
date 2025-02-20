//
//  ViewController.swift
//  CounterApp
//
//  Created by 이민재 on 2/18/25.
//

import UIKit

class ViewController: UIViewController {
    
    var total = 0
    private lazy var StackViewHeight: CGFloat = view.frame.height / 10
    
    private let totalLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Hello"
        return lb
    }()
    
    private let plusButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "plus"), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private let minusButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "minus"), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private let resetButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("RESET", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private lazy var innerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 0
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.addArrangedSubview(self.plusButton)
        stackView.addArrangedSubview(self.minusButton)
        stackView.backgroundColor = .blue
        return stackView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 0
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.addArrangedSubview(self.innerStackView)
        stackView.addArrangedSubview(self.resetButton)
        stackView.backgroundColor = .red
        return stackView
    }()
    
    private func addViews() {
        view.addSubview(totalLabel)
        view.addSubview(stackView)
    }
    
    private func configureLayout() {
        NSLayoutConstraint.activate([
            totalLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            totalLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
            stackView.heightAnchor.constraint(equalToConstant: StackViewHeight)
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        addViews()
        configureLayout()
    }
    
}

