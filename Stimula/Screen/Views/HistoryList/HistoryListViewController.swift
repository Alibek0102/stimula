//
//  HistoryListViewController.swift
//  Stimula
//
//  Created by Алибек Аблайулы on 10.05.2024.
//

import UIKit

final class HistoryListViewController: UITableViewController, TabBarViewControllersProtocol {
    var tabBarDelegate: StackProtocol?
    
    let historyListId: String = "historyListId";
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: historyListId)
        
        self.title = "История"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: historyListId, for: indexPath)
        return cell
    }
    
}

