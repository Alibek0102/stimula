//
//  AppCoordinator.swift
//  Stimula
//
//  Created by Алибек Аблайулы on 09.05.2024.
//

import UIKit

final class AppCoordinator: Coordinator {
    var navigationController: UINavigationController?
    
    var isAuth: Bool = true
    
    var module = CoordinatorModule()
    
    func start() {
        if isAuth == true {
            self.showMainFlow()
        } else {
            self.showAuthFlow()
        }
    }
    
    func showAuthFlow() {
        let coordinator = module.createAuthCoordinator(navigationController: navigationController)
        coordinator.start()
    }
    
    func showMainFlow() {
        let coordinator = module.createMainCoordinator(navigationController: navigationController)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        coordinator.start()
    }
    
}
