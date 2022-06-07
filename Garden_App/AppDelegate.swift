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

        guard let items = tabBarController.tabBar.items else { return false }
        
        items[0].image = UIImage(systemName: "sparkle")
        items[1].image = UIImage(systemName: "calendar")
        items[2].image = UIImage(systemName: "leaf.fill")
        items[3].image = UIImage(systemName: "square.and.pencil")
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()  
        return true
    }
}

