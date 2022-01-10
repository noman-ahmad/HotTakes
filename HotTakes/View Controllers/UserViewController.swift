//
//  UserViewController.swift
//  HotTakes
//
//  Created by Noman Ahmad on 1/9/22.
//

import UIKit
import FirebaseAuth

class UserViewController: UIViewController {
    
    private let nameLabel : UILabel = {
        let label = UILabel()
        label.text = "Placeholder"
        label.font = UIFont(name: "AlNile",size: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        // check for user
        if let user = Auth.auth().currentUser {
            nameLabel.text = user.email
        }
        
        view.addSubview(nameLabel)
        
        nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
    }
    
}
