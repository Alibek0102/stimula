//
//  ProfileViewController.swift
//  Stimula
//
//  Created by Алибек Аблайулы on 10.05.2024.
//

import UIKit

final class ProfileViewController: UIViewController, TabBarViewControllersProtocol {
    var tabBarDelegate: StackProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
    }
}
