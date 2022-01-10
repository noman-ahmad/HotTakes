//
//  ProfileSetupViewController.swift
//  HotTakes
//
//  Created by Noman Ahmad on 1/9/22.
//

import UIKit


class ProfileSetupViewController: UIViewController{
    
    
    private let titleLabel : UIView = {
        let label = UILabel()
        label.textColor = AppColors.shared.primaryPurple
        label.text = "Complete Your Profile"
        label.font = UIFont(name: "Verdana",size: 28)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private let profilesetupContentView : UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // setup subviews
    private let firstnameTextField : UITextField = {
        let textField = UITextField()
        textField.autocapitalizationType = .none
        
        textField.backgroundColor = .secondarySystemBackground
        textField.placeholder = "First Name"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let lastnameTextField : UITextField = {
        let textField = UITextField()
        textField.autocapitalizationType = .none
        
        textField.backgroundColor = .secondarySystemBackground
        textField.placeholder = "Last Name"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let profileImage : UIImageView = {
        let imageView = UIImageView()
        imageView.layer.borderWidth = 3
        imageView.layer.masksToBounds = false
        imageView.layer.borderColor = AppColors.shared.primaryPurple.cgColor
        imageView.layer.cornerRadius = (imageView.frame.height/2)
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "profile")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let photoselectButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Select Photo", for: .normal)
        button.tintColor = AppColors.shared.primaryPurple
        button.titleLabel?.textAlignment = .center
        button.addTarget(self, action: #selector(photobuttonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let finishButton:UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = AppColors.shared.primaryPurple
        button.setTitle("Complete", for: .normal)
        button.tintColor = .secondarySystemBackground
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        button.titleLabel?.textAlignment = .center
        button.addTarget(self, action: #selector(finishbuttonTapped), for: .allEvents)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        profilesetupContentView.addSubview(titleLabel)
        profilesetupContentView.addSubview(firstnameTextField)
        profilesetupContentView.addSubview(lastnameTextField)
        profilesetupContentView.addSubview(profileImage)
        profilesetupContentView.addSubview(photoselectButton)
        profilesetupContentView.addSubview(finishButton)
        view.addSubview(profilesetupContentView)
        
        
        
        profilesetupContentView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        profilesetupContentView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        profilesetupContentView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        profilesetupContentView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        
        profileImage.centerYAnchor.constraint(equalTo: profilesetupContentView.centerYAnchor, constant: -85).isActive = true
        profileImage.centerXAnchor.constraint(equalTo: profilesetupContentView.centerXAnchor).isActive = true
        profileImage.heightAnchor.constraint(equalToConstant: 150).isActive = true
        profileImage.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        photoselectButton.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 10).isActive = true
        photoselectButton.centerXAnchor.constraint(equalTo: profilesetupContentView.centerXAnchor).isActive = true
        photoselectButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        firstnameTextField.topAnchor.constraint(equalTo: photoselectButton.bottomAnchor, constant: 10).isActive = true
        firstnameTextField.leftAnchor.constraint(equalTo: profilesetupContentView.leftAnchor, constant: 50).isActive = true
        firstnameTextField.rightAnchor.constraint(equalTo: profilesetupContentView.rightAnchor, constant: -50).isActive = true
        
        
        lastnameTextField.topAnchor.constraint(equalTo: firstnameTextField.bottomAnchor, constant: 10).isActive = true
        lastnameTextField.leftAnchor.constraint(equalTo: profilesetupContentView.leftAnchor, constant: 50).isActive = true
        lastnameTextField.rightAnchor.constraint(equalTo: profilesetupContentView.rightAnchor, constant: -50).isActive = true
        
        finishButton.topAnchor.constraint(equalTo: lastnameTextField.bottomAnchor, constant: 10).isActive = true
        finishButton.leftAnchor.constraint(equalTo: profilesetupContentView.leftAnchor, constant: 50).isActive = true
        finishButton.rightAnchor.constraint(equalTo: profilesetupContentView.rightAnchor, constant: -50).isActive = true
        
        titleLabel.centerXAnchor.constraint(equalTo: profilesetupContentView.centerXAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: profileImage.topAnchor, constant: -25).isActive = true
        
        
        
    }
    
    
    @objc func photobuttonTapped() {
        
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
    
    @objc func finishbuttonTapped() {
        print("Tapped")
        if let firstName = firstnameTextField.text, let lastName = lastnameTextField.text {
            let uniqueImageID = UUID().uuidString
            let email = FirebaseAuthManager.shared.getUserEmail()
            let userID = FirebaseAuthManager.shared.getUserID()
            FirestoreManager.shared.addUserProfile(first_name: firstName, last_name: lastName, email: email, userID: userID, imageID: uniqueImageID)
            // upload image
            FirebaseStorageManager.shared.uploadImage(image: profileImage.image!, imageID: uniqueImageID)
            present(TabBar(), animated: true, completion: nil)

            dismiss(animated: true, completion: nil)
        }
    }
}

extension ProfileSetupViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            profileImage.image = pickedImage
        }

        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
}
