//
//  CreateTaskViewController.swift
//  Stimula
//
//  Created by Алибек Аблайулы on 12.05.2024.
//

import UIKit

class CreateTaskViewController: UIViewController {
    
    lazy var closeButton = CloseButton()
    lazy var saveButton = LoginButton(title: "Создать задачу")
    
    lazy var viewTitle: UILabel = {
        let viewTitle = UILabel()
        viewTitle.text = "Создать задачу"
        viewTitle.font = AppFonts.bold.createFont(size: 18)
        viewTitle.translatesAutoresizingMaskIntoConstraints = false
        return viewTitle
    }()
    
    lazy var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.tintColor = AppColors().darkGray
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        return datePicker
    }()
    
    lazy var taskTextArea: UITextView = {
        let textArea = UITextView()
        textArea.backgroundColor = AppColors().lightSilver
        textArea.layer.cornerRadius = 8
        textArea.textContainerInset = UIEdgeInsets(top: 20, left: 10, bottom: 20, right: 10)
        textArea.font = AppFonts.regular.createFont(size: 14)
        textArea.translatesAutoresizingMaskIntoConstraints = false
        return textArea
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        self.datePicker.datePickerMode = .date
        
        self.setupElements()
        
        self.closeButton.buttonAction = self.closeButtonHandler
    }
    
    private func setupElements() {
        view.addSubview(closeButton)
        view.addSubview(datePicker)
        view.addSubview(taskTextArea)
        view.addSubview(viewTitle)
        view.addSubview(saveButton)
        
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 27),
            closeButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -21),
            
            datePicker.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 21),
            datePicker.bottomAnchor.constraint(equalTo: view.keyboardLayoutGuide.topAnchor, constant: -12),
            datePicker.widthAnchor.constraint(equalToConstant: 100),
            datePicker.heightAnchor.constraint(equalToConstant: 30),
            
            taskTextArea.topAnchor.constraint(equalTo: closeButton.bottomAnchor, constant: 21),
            taskTextArea.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 21),
            taskTextArea.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -21),
            taskTextArea.bottomAnchor.constraint(equalTo: datePicker.topAnchor, constant: -15),
            
            viewTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 27 + 9),
            viewTitle.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 21),
            
            saveButton.widthAnchor.constraint(equalToConstant: 150),
            saveButton.heightAnchor.constraint(equalToConstant: 30),
            saveButton.bottomAnchor.constraint(equalTo: view.keyboardLayoutGuide.topAnchor, constant: -12),
            saveButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -21)
        ])
    }
    
    func closeButtonHandler() {
        self.dismiss(animated: true)
    }
    
    
}
