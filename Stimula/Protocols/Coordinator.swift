//
//  Coordinator.swift
//  Stimula
//
//  Created by Алибек Аблайулы on 09.05.2024.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController? { get set }
    func start()
}
