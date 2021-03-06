//
//  AppDelegate.swift
//  Garden_App
//
//  Created by Alina Bikkinina on 27.02.2022.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let tabBarController = UITabBarController()
        
        tabBarController.viewControllers = [DayAssembly.assemble(), CalendarAssembly.assemble(), MyGardenAsssembly.assemble(), MyNotesAssembly.assemble()]
        tabBarController.tabBar.tintColor = .black
        
//        UITabBarItem(title: nil, image: <#T##UIImage?#>, selectedImage: <#T##UIImage?#>)
        guard let items = tabBarController.tabBar.items else { return false }
        
        items[0].image = UIImage(systemName: "scribble.variable")
        items[1].image = UIImage(systemName: "calendar")
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()  
        return true
    }
}

