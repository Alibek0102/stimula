//
//  AuthCoordinator.swift
//  Stimula
//
//  Created by Алибек Аблайулы on 09.05.2024.
//

import UIKit

enum AuthNavigationEvent {
    case login
    case register
    case finish
}

final class AuthCoordinator: ChildCoordinator {
    var finishFLow: closureType?
    var navigationController: UINavigationController?
    var module = AuthModule()
    
    func start() {
        showLoginScreen()
    }
    
    func byEvent(event: AuthNavigationEvent) {
        switch event {
        case .login:
            showLoginScreen()
            break
        case .register:
            showRegisterScreen()
            break
        case .finish:
            finishFLow?()
            break
        }
    }
    
    func showLoginScreen() {
        let viewController = module.createLoginScreen()
        viewController.navigationHandler = { type in
            self.byEvent(event: type)
        }
        navigationController?.setViewControllers([viewController], animated: true)
    }
    
    func showRegisterScreen() {
        let viewController = module.createRegisterScreen()
        viewController.navigationHandler = { type in
            self.byEvent(event: type)
        }
        navigationController?.pushViewController(viewController, animated: true)
    }
}
