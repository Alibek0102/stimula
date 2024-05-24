//
//  AppModule.swift
//  Stimula
//
//  Created by Алибек Аблайулы on 10.05.2024.
//

import UIKit

class AppModule {
    func createTabBar() -> AppTabBar {
        let viewController = AppTabBar()
        return viewController
    }
    
    func createTasksViewController() -> TaskListViewController {
        let viewController = TaskListViewController()
        return viewController
    }
    
    func createHistoryListViewController() -> HistoryListViewController {
        let viewController = HistoryListViewController()
        return viewController
    }
    
    func createProfileViewController() -> ProfileViewController {
        let viewController = ProfileViewController()
        return viewController
    }
    
    func createTaskDetailViewController() -> TaskDetailViewController {
        let viewController = TaskDetailViewController()
        return viewController
    }
    
    func createCreateTaskViewController() -> CreateTaskViewController {
        let viewController = CreateTaskViewController()
        return viewController
    }
}
