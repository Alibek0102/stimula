//
//  TaskListViewController.swift
//  Stimula
//
//  Created by Алибек Аблайулы on 10.05.2024.
//

import UIKit

//remove after add network service
enum Task {
    case task(title: String, text: String)
    case story(title: String, text: String)
}
//--------------------------------

final class TaskListViewController: UIViewController, TabBarViewControllersProtocol {
    
    static let tasksId: String = "tasksId"
    static let addTaskId: String = "addTaskId"
    var tabBarDelegate: StackProtocol?
    
    var testItems: [Task] = [
        Task.task(title: "What is Lorem Ipsum?", text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."),
        Task.task(title: "Why do we use it?", text: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English."),
        Task.story(title: "Where can I get some?", text: "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.")
    ]
    
    let notificationButton: UIButton = {
        let button = UIButton()
        button.setImage(.notifications, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 30).isActive = true
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
        return button
    }()
    
    let segmentedView: UISegmentedControl = {
        let segmentedView = UISegmentedControl()
        segmentedView.insertSegment(withTitle: "Все", at: 0, animated: false)
        segmentedView.insertSegment(withTitle: "Задача", at: 1, animated: false)
        segmentedView.insertSegment(withTitle: "Сюжет", at: 2, animated: false)
        segmentedView.translatesAutoresizingMaskIntoConstraints = false
        return segmentedView
    }()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        self.navigationController?.navigationBar.prefersLargeTitles = true
        title = "Главная"
        
        self.segmentedView.selectedSegmentIndex = 0
        self.segmentedView.addTarget(self, action: #selector(segmentedControlHandler(_:)), for: .valueChanged)
        
        self.setupNotificationButton()
        self.setupElements()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(ItemCell.self, forCellReuseIdentifier: TaskListViewController.tasksId)
        self.tableView.register(AddNewTaskCell.self, forCellReuseIdentifier: TaskListViewController.addTaskId)
    }
    
    private func setupNotificationButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: notificationButton)
    }
    
    private func setupElements() {
        view.addSubview(segmentedView)
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            segmentedView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            segmentedView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 21),
            segmentedView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -21),
            segmentedView.heightAnchor.constraint(equalToConstant: 32),
            
            tableView.topAnchor.constraint(equalTo: segmentedView.bottomAnchor, constant: 10),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    @objc private func segmentedControlHandler(_ sender: UISegmentedControl) {
        print(sender.selectedSegmentIndex)
    }
}

extension TaskListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.estimatedRowHeight
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testItems.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row != testItems.count {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TaskListViewController.tasksId, for: indexPath) as? ItemCell else { return UITableViewCell() }
            
            let item = testItems[indexPath.row]
            
            switch(item) {
            case .task(_, let text):
                cell.showTaskItem(text: text)
                break
            case .story(_, let text):
                cell.showStoryItem(text: text)
                break
            }
            
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TaskListViewController.addTaskId, for: indexPath) as? AddNewTaskCell else { return UITableViewCell() }
            
            return cell
        }
    }
    
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        tableView.beginUpdates()
        testItems.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
        tableView.endUpdates()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == testItems.count {
            self.tabBarDelegate?.showAnotherScreen?(.createTask)
            return
        }
        
        self.tabBarDelegate?.showAnotherScreen?(.taskDetail(id: 1))
    }
}
