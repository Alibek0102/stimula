//
//  BackButton.swift
//  Stimula
//
//  Created by Алибек Аблайулы on 09.05.2024.
//

import UIKit

final class BackButton: UIButton {
    
    var buttonAction: (() -> Void)?
    
    private lazy var backIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .backArrow
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 19).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 19).isActive = true
        return imageView
    }()
    
    init() {
        super.init(frame: .zero)
        
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 12
        self.layer.borderColor = AppColors().lightSilver2.cgColor
        
        self.setupIcon()
        self.addTarget(self, action: #selector(buttonHandler), for: .touchUpInside)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalToConstant: 41).isActive = true
        self.heightAnchor.constraint(equalToConstant: 41).isActive = true
    }
    
    @objc private func buttonHandler() {
        
        UIView.animate(withDuration: 0.2) {
            self.alpha = 0.5
        } completion: { _ in
            UIView.animate(withDuration: 0.2) {
                self.alpha = 1.0
            }
            
            self.buttonAction?()
        }
        
    }
    
    private func setupIcon() {
        self.addSubview(backIcon)
        
        NSLayoutConstraint.activate([
            backIcon.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            backIcon.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
