//
//  AppFonts.swift
//  Stimula
//
//  Created by Алибек Аблайулы on 08.05.2024.
//

import UIKit

enum AppFonts {
    case regular, medium, bold
    
    func createFont(size: CGFloat) -> UIFont {
        switch self {
        case .regular:
            return UIFont(name: "Roboto-Regular", size: size) ?? UIFont.systemFont(ofSize: 14)
        case .medium:
            return UIFont(name: "Roboto-Medium", size: size) ?? UIFont.systemFont(ofSize: 14)
        case .bold:
            return UIFont(name: "Roboto-Medium", size: size) ?? UIFont.systemFont(ofSize: 14)
        }
    }
}
