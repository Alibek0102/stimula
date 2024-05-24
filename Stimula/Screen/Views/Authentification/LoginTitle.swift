//
//  LoginTitle.swift
//  Stimula
//
//  Created by Алибек Аблайулы on 08.05.2024.
//

import UIKit

final class LoginTitle: UILabel {
    
    init(title: String, font: AppFonts, fontSize: CGFloat) {
        super.init(frame: .zero)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.text = title
        self.numberOfLines = 0
        self.font = font.createFont(size: fontSize)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
