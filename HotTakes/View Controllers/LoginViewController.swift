//
//  LoginViewController.swift
//  HotTakes
//
//  Created by Noman Ahmad on 1/8/22.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    // subview initialization
    private let loginContentView:UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let usernameTextField:UITextField = {
        let textField = UITextField()
        // configure left image
        
        let padding = 8
        let size = 24
        
        let outerView = UIView(frame: CGRect(x: 0, y: 0, width: (size+padding), height: size))
        let iconView = UIImageView(frame: CGRect(x: padding, y: 0, width: size, height: size))
        iconView.image = UIImage(systemName: "envelope.fill")
        iconView.tintColor = .systemGray
        outerView.addSubview(iconView)
        
        textField.leftView = outerView
        textField.leftViewMode = .always
        
        textField.autocapitalizationType = .none
        
        textField.backgroundColor = .secondarySystemBackground
        textField.placeholder = "Email"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let passwordTextField:UITextField = {
        let textField = UITextField()
        // configure left image
        let padding = 8
        let size = 24
        
        let outerView = UIView(frame: CGRect(x: 0, y: 0, width: (size+padding), height: size))
        let iconView = UIImageView(frame: CGRect(x: padding, y: 0, width: size, height: size))
        iconView.image = UIImage(systemName: "key.fill")
        iconView.tintColor = .systemGray
        outerView.addSubview(iconView)
        
        textField.leftView = outerView
        textField.leftViewMode = .always
        
        textField.autocapitalizationType = .none
        
        textField.backgroundColor = .secondarySystemBackground
        textField.placeholder = "Password"
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let loginButton:UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = AppColors.shared.primaryPurple
        button.setTitle("Sign In", for: .normal)
        button.tintColor = .secondarySystemBackground
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        button.titleLabel?.textAlignment = .center
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let signupButton:UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = AppColors.shared.primaryPurple
        button.setTitle("Register", for: .normal)
        button.tintColor = .secondarySystemBackground
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        button.titleLabel?.textAlignment = .center
        button.addTarget(self, action: #selector(signupButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let titleText:UILabel = {
        let label = UILabel()
        label.textColor = AppColors.shared.primaryPurple
        label.text = "Hot Takes"
        label.font = UIFont(name: "Verdana-Italic",size: 35)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    

    override func viewDidLoad() {
        
        
        // add subviews
        loginContentView.addSubview(usernameTextField)
        loginContentView.addSubview(passwordTextField)
        loginContentView.addSubview(loginButton)
        loginContentView.addSubview(signupButton)
        
        view.addSubview(titleText)
        view.addSubview(loginContentView)
        
        
        self.addContraints()
        
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    
    
    
    func addContraints() {
        // constraints
        
        
        loginContentView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        loginContentView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        loginContentView.heightAnchor.constraint(equalToConstant: view.frame.height/3).isActive = true
        loginContentView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        usernameTextField.topAnchor.constraint(equalTo: loginContentView.topAnchor, constant: 50).isActive = true
        usernameTextField.leftAnchor.constraint(equalTo: loginContentView.leftAnchor, constant: 20).isActive = true
        usernameTextField.rightAnchor.constraint(equalTo: loginContentView.rightAnchor, constant: -20).isActive = true
        usernameTextField.heightAnchor.constraint(equalToConstant: 55).isActive = true
        
        passwordTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 10).isActive = true
        passwordTextField.leftAnchor.constraint(equalTo: loginContentView.leftAnchor, constant: 20).isActive = true
        passwordTextField.rightAnchor.constraint(equalTo: loginContentView.rightAnchor, constant: -20).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 55).isActive = true
        
        loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 10).isActive = true
        loginButton.leftAnchor.constraint(equalTo: loginContentView.leftAnchor, constant: 20).isActive = true
        loginButton.rightAnchor.constraint(equalTo: loginContentView.rightAnchor, constant: -20).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        loginButton.centerXAnchor.constraint(equalTo: loginContentView.centerXAnchor).isActive = true
        
        signupButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 10).isActive = true
        signupButton.leftAnchor.constraint(equalTo: loginContentView.leftAnchor, constant: 20).isActive = true
        signupButton.rightAnchor.constraint(equalTo: loginContentView.rightAnchor, constant: -20).isActive = true
        signupButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        signupButton.centerXAnchor.constraint(equalTo: loginContentView.centerXAnchor).isActive = true
        
        titleText.bottomAnchor.constraint(equalTo: loginContentView.topAnchor, constant: 50).isActive = true
        titleText.heightAnchor.constraint(equalToConstant: 125).isActive = true
        titleText.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    
    @objc func signupButtonTapped() {
        let signupManager = FirebaseAuthManager.shared
        if let email = usernameTextField.text, let password = passwordTextField.text {
            signupManager.createUser(email: email, password: password) {
                [weak self] (success) in
                guard let strongSelf = self else {return}
                if (success) {
                    print("User was successfully created")
                } else {
                    print("There was an error signing up")
                }
            }
            
        }
    }
    
    @objc func loginButtonTapped() {
        let loginManager = FirebaseAuthManager.shared
        guard let email = usernameTextField.text, let password = passwordTextField.text else { return }
        loginManager.loginUser(email: email, password: password) { [weak self] (success) in
            guard let strongSelf = self else {return}
            if(success) {
                print("User logged in successfully")
            } else {
                print("There was an error logging in")
            }
        }
    }
    

}
