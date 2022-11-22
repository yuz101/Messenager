//
//  RegisterViewController.swift
//  Messenger
//
//  Created by Yuru Zhou on 11/21/22.
//

import UIKit

class SignUpViewController: UIViewController {
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.clipsToBounds = true
        return scrollView
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = imageView.frame.size.width / 2.0
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.lightGray.cgColor
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let firstNameField: UITextField = {
       let textField = UITextField()
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.returnKeyType = .continue
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.placeholder = "First Name..."
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        textField.leftViewMode = .always
        textField.backgroundColor = .white
        return textField
    }()
    
    private let lastNameField: UITextField = {
       let textField = UITextField()
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.returnKeyType = .continue
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.placeholder = "Last Name..."
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        textField.leftViewMode = .always
        textField.backgroundColor = .white
        return textField
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
        button.setTitle("Sign Up", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Sign Up"
        view.backgroundColor = .white
        
        //Add Image Tap Gesture
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapProfilePic))
        gesture.numberOfTapsRequired = 1
        imageView.addGestureRecognizer(gesture)
        imageView.isUserInteractionEnabled = true
        
        //Add Login Button Action
        loginButton.addTarget(self, action: #selector(didTapLogin), for: .touchUpInside)
        
        //Add Subviews
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        firstNameField.translatesAutoresizingMaskIntoConstraints = false
        lastNameField.translatesAutoresizingMaskIntoConstraints = false
        emailField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.addSubview(imageView)
        scrollView.addSubview(firstNameField)
        scrollView.addSubview(lastNameField)
        scrollView.addSubview(emailField)
        scrollView.addSubview(passwordField)
        scrollView.addSubview(loginButton)
        
        view.addSubview(scrollView)
        
        //Set up constraints
        setupConstraints()
    }
    
    @objc func didTapProfilePic() {
        presentPhotoActionSheet()
    }
    
    @objc func didTapLogin() {
        guard let email = emailField.text,
              let password = passwordField.text,
              let firstName = firstNameField.text,
              let lastName = lastNameField.text,
              !email.isEmpty,
              !password.isEmpty,
              !firstName.isEmpty,
              !lastName.isEmpty,
              password.count >= 6
        else {
            alertUserLoginError()
            return
        }
    }
    
    func alertUserLoginError() {
        let alert = UIAlertController(title: "Login Failed", message: "Please enter all information.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel))
        present(alert, animated: true)
    }
    
    @objc func didTapRegister() {
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
            firstNameField.heightAnchor.constraint(equalToConstant: 52),
            firstNameField.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            firstNameField.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            firstNameField.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            firstNameField.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
            
        ])
        
        NSLayoutConstraint.activate([
            lastNameField.heightAnchor.constraint(equalToConstant: 52),
            lastNameField.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            lastNameField.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            lastNameField.topAnchor.constraint(equalTo: firstNameField.bottomAnchor, constant: 10),
            lastNameField.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
            
        ])
        
        NSLayoutConstraint.activate([
            emailField.heightAnchor.constraint(equalToConstant: 52),
            emailField.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            emailField.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            emailField.topAnchor.constraint(equalTo: lastNameField.bottomAnchor, constant: 10),
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

extension SignUpViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func presentPhotoActionSheet() {
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Take Photo", style: .default, handler: { _ in
            self.presentCamera()
        }))
        actionSheet.addAction(UIAlertAction(title: "Choose from Album", style: .default, handler: { _ in
            self.presentImagePicker()
        }))
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(actionSheet, animated: true)
    }
    
    func presentCamera() {
        let cameraPicker = UIImagePickerController()
        cameraPicker.sourceType = .camera
        cameraPicker.allowsEditing = true
        cameraPicker.delegate = self
        present(cameraPicker, animated: true)
    }
    
    func presentImagePicker() {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
        present(imagePicker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            self.imageView.image = selectedImage
        }
        picker.dismiss(animated: true)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
}
