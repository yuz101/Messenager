//
//  LoginViewController.swift
//  Messenger
//
//  Created by Yuru Zhou on 11/21/22.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.clipsToBounds = true
        return scrollView
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let emailField: UITextField = {
       let textField = UITextField()
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.returnKeyType = .continue
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.placeholder = "Email Address..."
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        textField.leftViewMode = .always
        textField.backgroundColor = .white
        return textField
    }()
    
    private let passwordField: UITextField = {
       let textField = UITextField()
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.returnKeyType = .done
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.placeholder = "Password..."
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        textField.leftViewMode = .always
        textField.backgroundColor = .white
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log In", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Log In"
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sign Up", style: .done, target: self, action: #selector(didTapSignUp))
        loginButton.addTarget(self, action: #selector(didTapLogin), for: .touchUpInside)
        // Do any additional setup after loading the view.
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        emailField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.addSubview(imageView)
        scrollView.addSubview(emailField)
        scrollView.addSubview(passwordField)
        scrollView.addSubview(loginButton)
        
        view.addSubview(scrollView)
        setupConstraints()
    }
    
    @objc func didTapLogin() {
        guard let email = emailField.text, let password = passwordField.text, !email.isEmpty, !password.isEmpty, password.count >= 6 else {
            alertUserLoginError()
            return
        }
        
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                self?.navigationController?.dismiss(animated: true)
            }
        }
    }
    
    func alertUserLoginError() {
        let alert = UIAlertController(title: "Login Failed", message: "Please enter all information.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel))
        present(alert, animated: true)
    }
    
    @objc func didTapSignUp() {
        let vc = SignUpViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
        
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 120),
            imageView.widthAnchor.constraint(equalToConstant: 120),
            imageView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20),
            imageView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            emailField.heightAnchor.constraint(equalToConstant: 52),
            emailField.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            emailField.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            emailField.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            emailField.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
            
        ])
        
        NSLayoutConstraint.activate([
            passwordField.heightAnchor.constraint(equalToConstant: 52),
            passwordField.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            passwordField.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 10),
            passwordField.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
            
        ])
        
        NSLayoutConstraint.activate([
            loginButton.heightAnchor.constraint(equalToConstant: 46),
            loginButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            loginButton.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            loginButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 10),
            loginButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
            
        ])
    }
    

}
