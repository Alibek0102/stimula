//
//  StackProtocol.swift
//  Stimula
//
//  Created by Алибек Аблайулы on 11.05.2024.
//

import UIKit

enum NavigationType {
    case taskDetail(id: Int)
    case createTask
}

typealias navigationClosure = (NavigationType) -> ()

protocol StackProtocol {
    var showAnotherScreen: navigationClosure? { get set }
}

