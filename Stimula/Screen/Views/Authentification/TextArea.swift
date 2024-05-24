//
//  TextArea.swift
//  Stimula
//
//  Created by Алибек Аблайулы on 08.05.2024.
//

import UIKit

final class TextArea: UITextField {
    
    init(placeholder: String, secret: Bool = false) {
        super.init(frame: .zero)
        
        self.isSecureTextEntry = secret
        self.placeholder = placeholder
        self.backgroundColor = AppColors().lightSilver
        self.layer.borderWidth = 1
        self.layer.borderColor = AppColors().silver.cgColor
        self.leftViewMode = .always
        self.rightViewMode = .always
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        self.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        self.layer.cornerRadius = 8
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalToConstant: 56).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
