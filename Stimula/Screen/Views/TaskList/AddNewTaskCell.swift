//
//  AddNewTaskCell.swift
//  Stimula
//
//  Created by Алибек Аблайулы on 11.05.2024.
//

import UIKit

class AddNewTaskCell: UITableViewCell {
    
    private var buttonTitle: UILabel = {
        let label = UILabel()
        label.text = "Создать задачу +"
        label.font = AppFonts.regular.createFont(size: 14)
        label.textColor = AppColors().blue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.backgroundColor = .clear
        
        self.setupElements()
        
        self.selectionStyle = .none
    }
    
    func setupElements() {
        self.addSubview(buttonTitle)
        NSLayoutConstraint.activate([
            buttonTitle.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 21),
            buttonTitle.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
