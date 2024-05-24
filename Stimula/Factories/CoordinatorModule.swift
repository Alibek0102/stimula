//
//  CoordinatorModule.swift
//  Stimula
//
//  Created by Алибек Аблайулы on 09.05.2024.
//

import UIKit

final class CoordinatorModule {
    
    func createAppCoordinator(navigationController: UINavigationController?) -> AppCoordinator {
        let coordinator = AppCoordinator()
        coordinator.navigationController = navigationController
        return coordinator
    }

    func createAuthCoordinator(navigationController: UINavigationController?) -> AuthCoordinator {
        let coordinator = AuthCoordinator()
        coordinator.navigationController = navigationController
        return coordinator
    }
    
    func createMainCoordinator(navigationController: UINavigationController?) -> MainCoordinator {
        let coordinator = MainCoordinator()
        coordinator.navigationController = navigationController
        return coordinator
    }
}


