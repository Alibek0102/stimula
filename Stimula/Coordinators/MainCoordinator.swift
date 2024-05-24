//
//  MainCoordinator.swift
//  Stimula
//
//  Created by Алибек Аблайулы on 10.05.2024.
//

import UIKit

final class MainCoordinator: Coordinator {
    var navigationController: UINavigationController?
    
    private var module = AppModule()
    
    func start() {
        self.showTabBar()
    }
    
    func openByType(type: NavigationType) {
        switch type {
        case .taskDetail(let id):
            self.showTaskDetail()
            break
        case .createTask:
            self.showCreateTaskView()
            break
        }
    }
    
    private func showTabBar(){
        let viewController = module.createTabBar()
        viewController.showAnotherScreen = { type in
            self.openByType(type: type)
        }
        navigationController?.setViewControllers([viewController], animated: true)
    }
    
    private func showTaskDetail() {
        let viewController = module.createTaskDetailViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    private func showCreateTaskView() {
        let viewController = module.createCreateTaskViewController()
        navigationController?.present(viewController, animated: true)
    }
}
