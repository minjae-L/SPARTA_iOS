//
//  ViewController.swift
//  CounterApp
//
//  Created by 이민재 on 2/18/25.
//

import UIKit

class ViewController: UIViewController {
    
    var total = 0 {
        didSet {
            totalLabel.text = "\(total)"
            checkRange(num: total)
        }
    }
    private lazy var StackViewHeight: CGFloat = view.frame.height / 10
    
    private let totalLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "0"
        return lb
    }()
    
    private lazy var plusButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "plus"), for: .normal)
        btn.tintColor = .white
        btn.backgroundColor = .systemBlue
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)
        return btn
    }()
    
    private lazy var minusButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "minus"), for: .normal)
        btn.tintColor = .white
        btn.backgroundColor = .systemRed
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(minusButtonTapped), for: .touchUpInside)
        return btn
    }()
    
    private lazy var resetButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("RESET", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .systemGray
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(resetButtonTapped), for: .touchUpInside)
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
    
    @objc func plusButtonTapped() {
        total += 1
    }
    
    @objc func minusButtonTapped() {
        total -= 1
    }
    
    @objc func resetButtonTapped() {
        total = 0
    }
    
    private func checkRange(num: Int) {
        if num == 10 {
            self.plusButton.isEnabled = false
        } else if num == -10 {
            self.minusButton.isEnabled = false
        } else {
            self.plusButton.isEnabled = true
            self.minusButton.isEnabled = true
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        addViews()
        configureLayout()
    }
    
}

