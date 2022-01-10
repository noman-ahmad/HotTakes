//
//  SettingsViewController.swift
//  HotTakes
//
//  Created by Noman Ahmad on 1/9/22.
//

import UIKit

class SettingsViewController: UIViewController {
    
    
    
    private let profileContentView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
            return view
    }()
    
    private let profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.image = UIImage(named: "profile")
        return imageView
    }()
    
    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = AppColors.shared.primaryPurple
        label.text = "Full Name"
        label.font = UIFont(name: "Verdana",size: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.textColor = AppColors.shared.primaryPurple
        label.text = FirebaseAuthManager.shared.getUserEmail()
        label.font = UIFont(name: "Verdana-Italic",size: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    private let signoutButton:UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = AppColors.shared.primaryPurple
        button.setTitle("Sign Out", for: .normal)
        button.tintColor = .secondarySystemBackground
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        button.titleLabel?.textAlignment = .center
        button.addTarget(self, action: #selector(signoutButtonTapped), for: .allEvents)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        profileContentView.addSubview(profileImage)
        profileContentView.addSubview(userNameLabel)
        //profileContentView.addSubview(emailLabel)
        
        view.addSubview(profileContentView)
        view.addSubview(signoutButton)
        
        
        profileContentView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        profileContentView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        profileContentView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        profileContentView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        
        profileImage.topAnchor.constraint(equalTo: profileContentView.topAnchor, constant: 10).isActive = true
        profileImage.centerXAnchor.constraint(equalTo: profileContentView.centerXAnchor).isActive = true
        profileImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
        profileImage.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        userNameLabel.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 10).isActive = true
        userNameLabel.centerXAnchor.constraint(equalTo: profileContentView.centerXAnchor).isActive = true
        
//        emailLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 5).isActive = true
//        emailLabel.leftAnchor.constraint(equalTo: userNameLabel.leftAnchor).isActive = true
//        emailLabel.rightAnchor.constraint(equalTo: profileContentView.rightAnchor, constant: -10).isActive = true
        
        
        
        signoutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        signoutButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        signoutButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        signoutButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        

        // Do any additional setup after loading the view.
    }
    
    
    @objc func signoutButtonTapped() {
        let authManager = FirebaseAuthManager.shared
        authManager.signoutUser()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
