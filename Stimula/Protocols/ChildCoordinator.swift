//
//  ChildCoordinators.swift
//  Stimula
//
//  Created by Алибек Аблайулы on 09.05.2024.
//

import UIKit

typealias closureType = (() -> Void)

protocol ChildCoordinator: Coordinator {
    var finishFLow: closureType? { get set }
}
