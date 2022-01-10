//
//  TabBar.swift
//  HotTakes
//
//  Created by Noman Ahmad on 1/9/22.
//

import UIKit

class TabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .label
        // Do any additional setup after loading the view.
        setupViews()
    }
    
    
    
    func setupViews() {
        viewControllers = [
            createNavigationControllers(for: UserViewController(), title: "Home", image: UIImage(systemName: "house")!),
            createNavigationControllers(for: SettingsViewController(), title: "Settings", image: UIImage(systemName: "gear")!)
        ]
    }
    
    // function to setup a navigation controller
    fileprivate func createNavigationControllers(for rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navigationController = UINavigationController(rootViewController: rootViewController)
        navigationController.tabBarItem.title = title
        navigationController.tabBarItem.image = image
        rootViewController.navigationItem.title = title
        return navigationController
    }
    
    

}
