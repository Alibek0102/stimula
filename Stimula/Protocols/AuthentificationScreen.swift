//
//  Authentification.swift
//  Stimula
//
//  Created by Алибек Аблайулы on 09.05.2024.
//

import UIKit

typealias authEventClosure = (AuthNavigationEvent) -> Void

protocol AuthentificationScreen: AnyObject {
    var navigationHandler: authEventClosure? { get set }
}
