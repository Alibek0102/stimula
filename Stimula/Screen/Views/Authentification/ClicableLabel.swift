//
//  ClicableLabel.swift
//  Stimula
//
//  Created by Алибек Аблайулы on 09.05.2024.
//

import UIKit

final class ClicableLabel: UILabel {
    
    var labelAction: (() -> Void)?
    
    init(title: String, color: UIColor = AppColors().darkGray) {
        super.init(frame: .zero)
        self.textColor = color
        self.text = title
        self.font = AppFonts.medium.createFont(size: 14)
        self.isUserInteractionEnabled = true
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapHandler))
        self.addGestureRecognizer(tapRecognizer)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    @objc private func tapHandler() {
        
        UIView.animate(withDuration: 0.2) {
            self.alpha = 0.5
        } completion: { _ in
            UIView.animate(withDuration: 0.2) {
                self.alpha = 1.0
            }
            self.labelAction?()
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
