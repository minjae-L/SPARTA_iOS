//
//  ViewController.swift
//  MemoApp
//
//  Created by 이민재 on 2/26/25.
//

import UIKit

final class ViewController: UIViewController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.tabbar = CustomTabbar()
        self.viewModel = ViewModel()
        viewModel.delegate = self
        self.tabbar.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private var viewModel: ViewModel!
    private var tabbar: CustomTabbar!
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var tableView: UITableView = {
        let tb = UITableView()
        tb.delegate = self
        tb.dataSource = self
        tb.translatesAutoresizingMaskIntoConstraints = false
        tb.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        return tb
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
        
        let alertController = UIAlertController(title: "추가",
                                                message: nil,
                                                preferredStyle: .alert)
        alertController.addTextField { textField in
            textField.placeholder = "입력"
            textField.textAlignment = .center
        }
        
        let okAction = UIAlertAction(title: "추가하기",
                                     style: .default) { [weak self] done in
            guard let text = alertController.textFields?[0].text else { return  }
            self?.viewModel.addMemo(detail: text)
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
        return viewModel.memoCount
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constant.TABLEVIEW_CELL_HEIGHT
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier,
                                                       for: indexPath) as? CustomTableViewCell
        else { return UITableViewCell() }
        
        cell.configure(model: viewModel.memoList[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .normal,
                                        title: "삭제") { [weak self] (action, view, completion) in
            print("삭제")
            self?.viewModel.removeMemo(index: indexPath.row)
            completion(true)
        }
        action.backgroundColor = .red
        return UISwipeActionsConfiguration(actions: [action])
    }
    
}


extension ViewController: ViewModelDelegate {
    
    func didUpdatedMemoList() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
            guard let count = self?.viewModel.memoCount else { return }
            self?.tabbar.fetchCount(count: count)
        }
    }
    
}
