//
//  LoginButton.swift
//  Stimula
//
//  Created by Алибек Аблайулы on 09.05.2024.
//

import UIKit

final class LoginButton: UIButton {
    
    var buttonAction: (() -> Void)?
    
    init(title: String) {
        super.init(frame: .zero)
        
        self.backgroundColor = AppColors().darkBlue
        self.setTitle(title, for: .normal)
        self.layer.cornerRadius = 8
        self.titleLabel?.font = AppFonts.bold.createFont(size: 15)
        self.addTarget(self, action: #selector(buttonHandler), for: .touchUpInside)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalToConstant: 56).isActive = true
    }
    
    @objc private func buttonHandler() {
        
        UIView.animate(withDuration: 0.2) {
            self.alpha = 0.5
        } completion: { _ in
            UIView.animate(withDuration: 0.2) {
                self.alpha = 1.0
            }
        }
        
        self.buttonAction?()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
