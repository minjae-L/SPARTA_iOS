//
//  ViewController.swift
//  MemoApp
//
//  Created by 이민재 on 2/26/25.
//

import UIKit

enum Constant {
    static var ADD_BUTTON_NAME: String {
        return "square.and.pencil"
    }
    static var TAB_BAR_HEIGHT: CGFloat {
        return 80
    }
}

class ViewController: UIViewController {
    
    private lazy var tableView: UITableView = {
        let tb = UITableView()
        tb.delegate = self
        tb.dataSource = self
        tb.translatesAutoresizingMaskIntoConstraints = false
        return tb
    }()
    
    private lazy var tabbar: UITabBar = {
        let tbb = UITabBar()
        tbb.frame = .zero
        tbb.backgroundColor = .red
        tbb.translatesAutoresizingMaskIntoConstraints = false
        return tbb
    }()
    
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        super.viewDidLoad()
        addViews()
        configureLayout()
        configureNavigationBar()
    }
    
    private func configureNavigationBar() {
        self.navigationItem.title = "메모"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: Constant.ADD_BUTTON_NAME),
                                                                 style: .done,
                                                                 target: self,
                                                                 action: #selector(addButtonTapped))
    }
    
    @objc func addButtonTapped() {
        let alertController = UIAlertController(title: "추가", message: nil, preferredStyle: .alert)
        alertController.addTextField { textField in
            textField.placeholder = "입력"
            textField.textAlignment = .center
            textField.addConstraint(textField.heightAnchor.constraint(equalToConstant: 100))
        }
        
        let okAction = UIAlertAction(title: "추가하기",
                                     style: .default) { done in
            print(alertController.textFields?[0].text ?? "")
        }
        let cancelAction = UIAlertAction(title: "취소",
                                         style: .cancel)
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    private func addViews() {
        view.addSubview(tableView)
        view.addSubview(tabbar)
    }
    
    private func configureLayout() {
        NSLayoutConstraint.activate([
            tabbar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tabbar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tabbar.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tabbar.heightAnchor.constraint(equalToConstant: Constant.TAB_BAR_HEIGHT),
            tableView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
            
        ])
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
}
