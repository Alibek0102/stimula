//
//  UITableView+Extension.swift
//  Stimula
//
//  Created by Алибек Аблайулы on 13.05.2024.
//

import UIKit

extension UITableView {
    func setEmptyView() {
        let emptyView = UIView(frame: CGRect(x: self.center.x, y: self.center.y, width: self.bounds.size.width, height: self.bounds.size.height))
        
        let emptyIconView: UIImageView = {
            let imageView = UIImageView()
            imageView.image = .empty
            imageView.contentMode = .scaleAspectFit
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
            imageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
            return imageView
        }()
        
        let titleLabel: UILabel = {
            let label = UILabel()
            label.textAlignment = .center
            label.numberOfLines = 0
            label.font = AppFonts.medium.createFont(size: 14)
            label.text = "Этот список\nзадач пока пуст."
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        emptyView.addSubview(emptyIconView)
        emptyView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            emptyIconView.topAnchor.constraint(equalTo: emptyView.topAnchor, constant: 160),
            emptyIconView.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: emptyIconView.bottomAnchor),
            titleLabel.leftAnchor.constraint(equalTo: emptyView.leftAnchor, constant: 21),
            titleLabel.rightAnchor.constraint(equalTo: emptyView.rightAnchor, constant: -21)
        ])
        
        self.backgroundView = emptyView
    }
}
