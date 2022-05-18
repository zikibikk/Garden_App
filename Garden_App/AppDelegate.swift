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

  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      window = UIWindow()
      window?.rootViewController = UsersAssembly.assemble()
      window?.makeKeyAndVisible()
      return true
    }
}

