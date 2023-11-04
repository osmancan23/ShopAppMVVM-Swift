//
//  MainTabBarController.swift
//  ShopAppMVVM-Swift
//
//  Created by Osmancan Akagündüz on 27.07.2023.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .gray
                
        let v1 = UINavigationController(rootViewController: HomeViewController())
        let v2 = UINavigationController(rootViewController: SearchViewController())
        let v3 = UINavigationController(rootViewController: BasketViewController())
               

        v1.tabBarItem.image = UIImage(systemName: "house")
        v1.tabBarItem.selectedImage = UIImage(systemName: "house.fill")
                
        v2.tabBarItem.image = UIImage(systemName: "magnifyingglass")
                
        v3.tabBarItem.image = UIImage(systemName: "basket")
        v3.tabBarItem.selectedImage = UIImage(systemName: "basket.fill")
                
               
                
        setViewControllers([v1,v2,v3], animated: true)
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
