//
//  TaskDetailViewController.swift
//  Stimula
//
//  Created by Алибек Аблайулы on 11.05.2024.
//

import UIKit

class TaskDetailViewController: UIViewController {
    
    lazy var backButton = BackButton()
    
    lazy var typeIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .taskIcon
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        return imageView
    }()
    
    lazy var typeLabel: UILabel = {
        let label = UILabel()
        label.text = "Задача"
        label.textColor = AppColors().darkGray2
        label.font = AppFonts.medium.createFont(size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var taskTypeStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 9
        stackView.addArrangedSubview(typeIcon)
        stackView.addArrangedSubview(typeLabel)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var finishDate: UILabel = {
        let label = UILabel()
        label.font = AppFonts.regular.createFont(size: 16)
        label.textColor = AppColors().darkGray2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var finishButton = LoginButton(title: "Завершить задачу")
    
    lazy var taskText: UILabel = {
        let label = UILabel()
        label.font = AppFonts.regular.createFont(size: 17)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        self.setupElements()
        backButton.buttonAction = self.goBackHandler
        
        self.finishButton.backgroundColor = AppColors().blue
        
        finishDate.text = "Срок выполнения задачи: 12.02.2025"
        
        taskText.text = "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised"
    }
    
    func setupElements() {
        view.addSubview(backButton)
        view.addSubview(taskTypeStackView)
        view.addSubview(finishDate)
        view.addSubview(taskText)
        view.addSubview(finishButton)
        
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 27),
            backButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 21),
            
            taskTypeStackView.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 21),
            taskTypeStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 21),
            taskTypeStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -21),
            
            finishDate.topAnchor.constraint(equalTo: taskTypeStackView.bottomAnchor, constant: 14),
            finishDate.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 21),
            finishDate.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -21),
            
            taskText.topAnchor.constraint(equalTo: finishDate.bottomAnchor, constant: 27),
            taskText.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 21),
            taskText.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -21),
            
            finishButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 21),
            finishButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -21),
            finishButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -34)
        ])
    }
    
    func goBackHandler() {
        navigationController?.popViewController(animated: true)
    }
}
