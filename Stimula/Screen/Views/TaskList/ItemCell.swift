//
//  ItemCell.swift
//  Stimula
//
//  Created by Алибек Аблайулы on 11.05.2024.
//

import UIKit

final class ItemCell: UITableViewCell {
    
    lazy var iconView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        return imageView
    }()
    
    lazy var taskType: UILabel = {
        let typeLabel = UILabel()
        typeLabel.font = AppFonts.medium.createFont(size: 12)
        typeLabel.textColor = AppColors().darkGray
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        return typeLabel
    }()
    
    lazy var taskText: UILabel = {
        let taskLabel = UILabel()
        taskLabel.numberOfLines = 2
        taskLabel.translatesAutoresizingMaskIntoConstraints = false
        return taskLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .clear
        self.selectionStyle = .none
        self.setupElements()
    }
    
    private func setupElements() {
        self.contentView.addSubview(iconView)
        self.contentView.addSubview(taskType)
        self.contentView.addSubview(taskText)
        
        NSLayoutConstraint.activate([
            iconView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 21),
            iconView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            
            taskType.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -9),
            taskType.leftAnchor.constraint(equalTo: iconView.rightAnchor, constant: 8),
            
            taskText.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8),
            taskText.bottomAnchor.constraint(equalTo: taskType.topAnchor, constant: -5),
            taskText.leftAnchor.constraint(equalTo: iconView.rightAnchor, constant: 8),
            taskText.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -21)
        ])
    }
    
    func showTaskItem(text: String) {
        self.iconView.image = .taskIcon
        self.taskType.text = "Задача"
        self.taskText.text = text
    }
    
    func showStoryItem(text: String) {
        self.iconView.image = .storyIcon
        self.taskType.text = "Сюжет"
        self.taskText.text = text
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
