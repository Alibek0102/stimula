//
//  SceneDelegate.swift
//  Stimula
//
//  Created by Алибек Аблайулы on 28.04.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let module = CoordinatorModule()
        
        let navigationController = UINavigationController()
        let coordinator = module.createAppCoordinator(navigationController: navigationController)
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        coordinator.start()
    }

}

