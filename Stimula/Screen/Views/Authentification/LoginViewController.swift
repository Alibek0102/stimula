//
//  LoginViewController.swift
//  Stimula
//
//  Created by Алибек Аблайулы on 08.05.2024.
//

import UIKit

final class LoginViewController: UIViewController, AuthentificationScreen {
    
    var navigationHandler: authEventClosure?
    
    lazy var loginTitle = LoginTitle(title: "Добро пожаловать!\nРад тебя видеть, Снова!", font: .bold, fontSize: 30)
    var emailTextArea = TextArea(placeholder: "Введите свой email")
    var passwordTextArea = TextArea(placeholder: "Введите пароль", secret: true)
    lazy var loginButton = LoginButton(title: "Войти")
    lazy var forgotPasswordLabel = ClicableLabel(title: "Забыли пароль?")
    lazy var createAccountLabel = ClicableLabel(title: "Зарегистрироваться", color: AppColors().blue)

    let labelDesc: UILabel = {
        let label = UILabel()
        label.text = "У вас нет учетной записи?"
        label.font = AppFonts.medium.createFont(size: 14)
        label.textColor = AppColors().darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var createAccountStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 5
        
        stackView.addArrangedSubview(labelDesc)
        stackView.addArrangedSubview(createAccountLabel)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        
        self.forgotPasswordLabel.labelAction = self.forgotPasswordAction
        self.createAccountLabel.labelAction = self.createAccountScreen
        
        self.emailTextArea.tag = 11
        self.passwordTextArea.tag = 12
        
        setupLoginViewElements()
    }
    
    private func setupLoginViewElements() {
        view.addSubview(loginTitle)
        view.addSubview(emailTextArea)
        view.addSubview(passwordTextArea)
        view.addSubview(forgotPasswordLabel)
        view.addSubview(loginButton)
        view.addSubview(createAccountStackView)
        
        NSLayoutConstraint.activate([
            loginTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            loginTitle.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 21),
            loginTitle.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -21),
            
            emailTextArea.topAnchor.constraint(equalTo: loginTitle.bottomAnchor, constant: 57),
            emailTextArea.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 21),
            emailTextArea.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -21),
            
            passwordTextArea.topAnchor.constraint(equalTo: emailTextArea.bottomAnchor, constant: 15),
            passwordTextArea.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 21),
            passwordTextArea.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -21),
            
            forgotPasswordLabel.topAnchor.constraint(equalTo: passwordTextArea.bottomAnchor, constant: 5),
            forgotPasswordLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -21),
            
            loginButton.topAnchor.constraint(equalTo: forgotPasswordLabel.bottomAnchor, constant: 68),
            loginButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 21),
            loginButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -21),
            
            createAccountStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -34),
            createAccountStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func forgotPasswordAction() {
        print("forgot password")
    }
    
    
    func createAccountScreen() {
        self.navigationHandler?(.register)
    }
    
}

