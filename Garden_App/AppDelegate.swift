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
        let previousPresenter = PreviousDayPresenter()
        let dayNavC = UINavigationController()
        let previousDayNavC = UINavigationController()
        let tabBarController = UITabBarController()
        let currentDayVC = DayViewController(presenter: presenter)
        let previousDayVC = PreviousDayViewController(presenter: previousPresenter)

        presenter.dayView = currentDayVC
        previousPresenter.dayView = previousDayVC
        dayNavC.isNavigationBarHidden = true
        dayNavC.viewControllers = [currentDayVC]
        previousDayNavC.navigationBar.prefersLargeTitles = true
        previousDayNavC.viewControllers = [MyGardenViewController()]
        previousDayNavC.navigationBar.tintColor = .black
        previousDayNavC.navigationBar.barTintColor = UIColor(red: 231/255, green: 240/255, blue: 231/255, alpha: 5)
        tabBarController.viewControllers = [dayNavC, previousDayNavC, UIViewController(), UIViewController()]
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

