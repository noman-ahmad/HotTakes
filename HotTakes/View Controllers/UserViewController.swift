//
//  UserViewController.swift
//  HotTakes
//
//  Created by Noman Ahmad on 1/9/22.
//

import UIKit
import FirebaseAuth

class UserViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private var allTakes : [TakeModel] = []
    private var  tableView = UITableView()
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allTakes.count
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = allTakes[indexPath.row].prompt
        return cell
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.contentView.layer.masksToBounds = true
        let radius = cell.contentView.layer.cornerRadius
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: radius).cgPath
    }
    
    
    private let nameLabel : UILabel = {
        let label = UILabel()
        label.text = "Add Some Groups"
        label.font = UIFont(name: "AlNile",size: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let newButton : UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = AppColors.shared.primaryPurple
        //button.setTitle("Complete", for: .normal)
        button.frame = CGRect(x: 160, y: 100, width: 75, height: 75)
        button.tintColor = .secondarySystemBackground
        button.clipsToBounds = true
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.titleLabel?.textAlignment = .center
        button.addTarget(self, action: #selector(newButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    private let statusView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        // Create a gradient layer.
        return view
    }()
    
    private let profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.image = UIImage(named: "profile")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var changedView = false
    
    
    override func viewDidLayoutSubviews() {
        let gradientLayer = CAGradientLayer()
        // Set the size of the layer to be equal to size of the display.
        gradientLayer.frame = statusView.bounds
        // Set an array of Core Graphics colors (.cgColor) to create the gradient.
        // This example uses a Color Literal and a UIColor from RGB values.
        gradientLayer.colors = [UIColor(red: 100/255, green: 125/255, blue: 238/255, alpha: 1).cgColor, UIColor(red: 127/255, green: 83/255, blue: 172/255, alpha: 1).cgColor]
        // Rasterize this static layer to improve app performance.
        gradientLayer.shouldRasterize = true
        // Apply the gradient to the backgroundGradientView.
        statusView.layer.addSublayer(gradientLayer)
        newButton.layer.cornerRadius = 0.5 * newButton.frame.height
        profileImage.heightAnchor.constraint(equalToConstant: statusView.bounds.height * 0.35).isActive = true
        profileImage.widthAnchor.constraint(equalToConstant: statusView.bounds.width * 0.20).isActive = true
        statusView.bringSubviewToFront(profileImage)
    }

    
    @objc func newButtonTapped() {
        changedView = true
        let vc = CreateTakeViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if changedView {
            //view.backgroundColor = .systemRed
            FirestoreManager.shared.getAllUserTakes(userID: FirebaseAuthManager.shared.getUserID(), completed: { (takes) -> Void in
                print(takes)
                self.allTakes = takes
                self.tableView.reloadData()
            })
            changedView = false
        } else {
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        FirestoreManager.shared.getAllUserTakes(userID: FirebaseAuthManager.shared.getUserID(), completed: { (takes) -> Void in
            print(takes)
            self.allTakes = takes
            self.tableView.reloadData()
        })
              
        statusView.addSubview(profileImage)
        view.addSubview(tableView)
        view.addSubview(nameLabel)
        view.addSubview(newButton)
        view.addSubview(statusView)

        statusView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        statusView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        statusView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.20).isActive = true
        statusView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.90).isActive = true
//
//
//
//
        profileImage.topAnchor.constraint(equalTo: statusView.topAnchor, constant: 10).isActive = true
        profileImage.leftAnchor.constraint(equalTo: statusView.leftAnchor, constant: 10).isActive = true
        
//        nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        nameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        tableView.translatesAutoresizingMaskIntoConstraints = false

        tableView.topAnchor.constraint(equalTo: statusView.bottomAnchor, constant: 15).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
//
//
        newButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -35).isActive = true
        newButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -85).isActive = true
        newButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        newButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
}
