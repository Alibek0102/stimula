//
//  RegisterViewController.swift
//  Stimula
//
//  Created by Алибек Аблайулы on 08.05.2024.
//

import UIKit

final class RegisterViewController: UIViewController, AuthentificationScreen {
    
    var navigationHandler: authEventClosure?
    
    lazy var backButton = BackButton()
    lazy var loginTitle = LoginTitle(title: "Добро пожаловать!\nРад тебя видеть, Снова!", font: .bold, fontSize: 30)
    var usernameTextArea = TextArea(placeholder: "Введите ФИО")
    var emailTextArea = TextArea(placeholder: "Введите свой email")
    var passwordTextArea = TextArea(placeholder: "Придумайте пароль", secret: true)
    var confirmPasswordTextArea = TextArea(placeholder: "Подтвердите пароль", secret: true)
    var registerButton = LoginButton(title: "Согласитесь и зарегистрируйтесь")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
        
        self.backButton.buttonAction = self.loginUser
        
        self.setupElements()
    }
    
    private func setupElements() {
        view.addSubview(backButton)
        view.addSubview(loginTitle)
        view.addSubview(usernameTextArea)
        view.addSubview(emailTextArea)
        view.addSubview(passwordTextArea)
        view.addSubview(confirmPasswordTextArea)
        view.addSubview(registerButton)
        
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 27),
            backButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 36),
            
            loginTitle.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 33),
            loginTitle.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 21),
            loginTitle.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -21),
            
            usernameTextArea.topAnchor.constraint(equalTo: loginTitle.bottomAnchor, constant: 57),
            usernameTextArea.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 21),
            usernameTextArea.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -21),
            
            emailTextArea.topAnchor.constraint(equalTo: usernameTextArea.bottomAnchor, constant: 15),
            emailTextArea.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 21),
            emailTextArea.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -21),
            
            passwordTextArea.topAnchor.constraint(equalTo: emailTextArea.bottomAnchor, constant: 15),
            passwordTextArea.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 21),
            passwordTextArea.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -21),
            
            confirmPasswordTextArea.topAnchor.constraint(equalTo: passwordTextArea.bottomAnchor, constant: 15),
            confirmPasswordTextArea.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 21),
            confirmPasswordTextArea.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -21),
            
            registerButton.topAnchor.constraint(equalTo: confirmPasswordTextArea.bottomAnchor, constant: 15),
            registerButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 21),
            registerButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -21),
        ])
    }
    
    
    private func loginUser() {
        navigationController?.popViewController(animated: true)
    }
    
}
