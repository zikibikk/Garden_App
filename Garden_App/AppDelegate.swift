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
        let presenter = DayPresenter()
        let navigationController = UINavigationController()
        let tabBarController = UITabBarController()
        let dayView = DayViewController(presenter: presenter)
        dayView.title = "Сегодня"
        presenter.dayView = dayView
        navigationController.isNavigationBarHidden = true
        navigationController.viewControllers = [dayView]
        tabBarController.viewControllers = [navigationController, UIViewController(), UIViewController(), UIViewController()]
        tabBarController.tabBar.tintColor = .black
        guard let items = tabBarController.tabBar.items else { return false }
        items[0].image = UIImage(systemName: "scribble.variable")
        items[1].image = UIImage(systemName: "calendar")
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()  
        return true
    }
}

