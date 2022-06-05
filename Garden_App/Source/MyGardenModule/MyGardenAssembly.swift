//
//  MyGardenAssembly.swift
//  Garden_App
//
//  Created by Лилия Комиссарова on 04.06.2022.
//

import Foundation
import UIKit

enum MyGardenAsssembly {
    static func assemble() -> UIViewController {
        let myGardenVC = MyGardenViewController()
        let myGardenNavVC = UINavigationController()
        myGardenVC.navigationItem.largeTitleDisplayMode = .always
        myGardenVC.navigationItem.title = "Мой сад"
        myGardenNavVC.isNavigationBarHidden = false
        myGardenNavVC.navigationBar.prefersLargeTitles = true
        myGardenNavVC.navigationBar.barTintColor = UIColor(red: 231/255, green: 240/255, blue: 231/255, alpha: 5)
        myGardenNavVC.viewControllers = [myGardenVC]
        return myGardenNavVC
    }
}
