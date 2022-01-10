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
        label.text = "Add Some Groups"
        label.font = UIFont(name: "AlNile",size: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        self.navigationController?.navigationBar.tintColor = UIColor.systemBackground
        
        let button1 = UIBarButtonItem(image: UIImage(systemName: "plus.circle.fill"), style: .plain, target: self, action: Selector("action")) // action:#selector(Class.MethodName) for swift 3

        self.navigationItem.rightBarButtonItem  = button1

 

        
        
        view.addSubview(nameLabel)
        
        nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
    }
    
}
