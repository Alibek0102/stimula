//
//  AppTabBar.swift
//  Stimula
//
//  Created by Алибек Аблайулы on 10.05.2024.
//

import UIKit



class AppTabBar: UITabBarController, StackProtocol {
    var showAnotherScreen: navigationClosure?
    
    private let module = AppModule()
    
    typealias tabBarViewController = UIViewController & TabBarViewControllersProtocol
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        self.tabBar.backgroundColor = .white
        self.tabBar.tintColor = .black
        self.tabBar.unselectedItemTintColor = .systemGray2
        self.createTabBar()
        
        if let items = tabBar.items {
            for item in items {
                item.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
                item.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 5)
            }
        }
    }
    
    
    private func createTabBar() {
        let taskList = self.createViewController(
            module.createTasksViewController(),
            title: "Задачи",
            image: UIImage(systemName: "list.bullet.clipboard")!, 
            activeImage: UIImage(systemName: "list.clipboard.fill")!)
        
        let historyList = self.createViewController(
            module.createHistoryListViewController(),
            title: "История",
            image: UIImage(systemName: "clock")!,
            activeImage: UIImage(systemName: "clock.fill")!)
        
        let profile = self.createViewController(
            module.createProfileViewController(),
            title: "Профиль",
            image: UIImage(systemName: "person.crop.circle")!,
            activeImage: UIImage(systemName: "person.crop.circle.fill")!)
        
        self.viewControllers = [taskList, historyList, profile]
    }
    
    private func createViewController(_ vc: tabBarViewController, title: String, image: UIImage, activeImage: UIImage) -> UINavigationController {
        var viewController = vc
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        viewController.tabBarItem.selectedImage = activeImage
        viewController.tabBarDelegate = self
        
        let navigationController = UINavigationController(rootViewController: viewController)
        return navigationController
    }
}
