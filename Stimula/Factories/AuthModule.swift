//
//  AuthModule.swift
//  Stimula
//
//  Created by Алибек Аблайулы on 09.05.2024.
//

import Foundation

final class AuthModule {
    func createLoginScreen() -> LoginViewController {
        let viewController = LoginViewController()
        return viewController
    }
    
    func createRegisterScreen() -> RegisterViewController {
        let viewController = RegisterViewController()
        return viewController
    }
}
