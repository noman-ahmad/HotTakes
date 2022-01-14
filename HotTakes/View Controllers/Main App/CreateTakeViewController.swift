//
//  CreateTakeViewController.swift
//  HotTakes
//
//  Created by Noman Ahmad on 1/13/22.
//

import UIKit

class CreateTakeViewController: UIViewController {
    
    private let promptTextField : UITextField = {
        let textField = UITextField()
        textField.autocapitalizationType = .none
        
        textField.backgroundColor = .secondarySystemBackground
        textField.textAlignment = .center
        textField.placeholder = "Enter Question"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let firstChoiceTextField : UITextField = {
        let textField = UITextField()
        textField.autocapitalizationType = .none
        textField.placeholder = "Choose Option 1"
        textField.backgroundColor = .secondarySystemBackground
        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = 10
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let secondChoiceTextField : UITextField = {
        let textField = UITextField()
        textField.autocapitalizationType = .none
        
        textField.backgroundColor = .secondarySystemBackground
        textField.placeholder = "Choose Option 2"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let thirdChoiceTextField : UITextField = {
        let textField = UITextField()
        textField.autocapitalizationType = .none
        
        textField.backgroundColor = .secondarySystemBackground
        textField.placeholder = "Choose Option 3"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let fourthChoiceTextField : UITextField = {
        let textField = UITextField()
        textField.autocapitalizationType = .none
        
        textField.backgroundColor = .secondarySystemBackground
        textField.placeholder = "Choose Option 4"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let contentView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let dismissButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .clear
        button.setImage(UIImage(systemName: "x.circle.fill"), for: .normal)
        button.tintColor = .black
        button.titleLabel?.textAlignment = .center
        button.addTarget(self, action: #selector(dismissButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let submitButton : UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemOrange
        //button.setTitle("Complete", for: .normal)
        button.frame = CGRect(x: 160, y: 100, width: 75, height: 75)
        button.tintColor = .secondarySystemBackground
        button.clipsToBounds = true
        button.setTitle("Submit", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.addTarget(self, action: #selector(submitButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func dismissButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func submitButtonTapped() {
        
        
        if let prompt = promptTextField.text, let q1 = firstChoiceTextField.text, let q2 = secondChoiceTextField.text, let q3 = thirdChoiceTextField.text, let q4 = fourthChoiceTextField.text {
            let userID = FirebaseAuthManager.shared.getUserID()
            FirestoreManager.shared.addTake(userID: userID, prompt: prompt, q1: q1, q2: q2, q3: q3, q4: q4)
            dismiss(animated: true, completion: nil)
        } else {
            print("Not all fields have been inputted")
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupSubviews()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        view.addSubview(promptTextField)
        view.addSubview(firstChoiceTextField)
        view.addSubview(secondChoiceTextField)
        view.addSubview(thirdChoiceTextField)
        view.addSubview(fourthChoiceTextField)
        view.addSubview(submitButton)
        //contentView.addSubview(dismissButton)
        
        //view.addSubview(contentView)
        view.addSubview(dismissButton)
        
        setupInitialConstraints()
        
        
        
        
    }
    
    func setupInitialConstraints() {
        dismissButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        dismissButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
        dismissButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    
        
        promptTextField.topAnchor.constraint(equalTo: dismissButton.bottomAnchor, constant: 120).isActive = true
        promptTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        promptTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        promptTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        promptTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        firstChoiceTextField.topAnchor.constraint(equalTo: promptTextField.bottomAnchor, constant: 30).isActive = true
        firstChoiceTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        firstChoiceTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        firstChoiceTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50).isActive = true
        
        secondChoiceTextField.topAnchor.constraint(equalTo: firstChoiceTextField.bottomAnchor, constant: 10).isActive = true
        secondChoiceTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        secondChoiceTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        secondChoiceTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50).isActive = true
        
        thirdChoiceTextField.topAnchor.constraint(equalTo: secondChoiceTextField.bottomAnchor, constant: 10).isActive = true
        thirdChoiceTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        thirdChoiceTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        thirdChoiceTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50).isActive = true
        
        fourthChoiceTextField.topAnchor.constraint(equalTo: thirdChoiceTextField.bottomAnchor, constant: 10).isActive = true
        fourthChoiceTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        fourthChoiceTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        fourthChoiceTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50).isActive = true
        
        submitButton.topAnchor.constraint(equalTo: fourthChoiceTextField.bottomAnchor, constant: 40).isActive = true
        submitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        submitButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
        submitButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
    }

    
    func setupSubviews() {
        let gradientLayer = CAGradientLayer()
        // Set the size of the layer to be equal to size of the display.
        gradientLayer.frame = view.bounds
        // Set an array of Core Graphics colors (.cgColor) to create the gradient.
        // This example uses a Color Literal and a UIColor from RGB values.
        gradientLayer.colors = [UIColor(red: 66/255, green: 39/255, blue: 90/255, alpha: 1).cgColor, UIColor(red: 115/255, green: 75/255, blue: 109/255, alpha: 1).cgColor]
        // Rasterize this static layer to improve app performance.
        gradientLayer.shouldRasterize = true
        // Apply the gradient to the backgroundGradientView.
        submitButton.layer.cornerRadius = 0.5 * submitButton.frame.height
        view.layer.addSublayer(gradientLayer)
        view.bringSubviewToFront(promptTextField)
        view.bringSubviewToFront(dismissButton)
        view.bringSubviewToFront(firstChoiceTextField)
        view.bringSubviewToFront(secondChoiceTextField)
        view.bringSubviewToFront(thirdChoiceTextField)
        view.bringSubviewToFront(fourthChoiceTextField)
        view.bringSubviewToFront(submitButton)
    }
    
    
    

}
