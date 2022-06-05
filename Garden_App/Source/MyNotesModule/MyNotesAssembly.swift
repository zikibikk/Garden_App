//
//  MyNotesAssembly.swift
//  Garden_App
//
//  Created by Лилия Комиссарова on 04.06.2022.
//

import Foundation
import UIKit

enum MyNotesAssembly {
    static func assemble() -> UIViewController {
        let router = MyNotesRouter()
        let myNotesVC = MyNotesViewController(router: router)
        let myNotesNavVC = UINavigationController()
        myNotesNavVC.navigationBar.tintColor = .black
        myNotesNavVC.viewControllers = [myNotesVC]
        router.view = myNotesVC
        return myNotesNavVC
    }
}
