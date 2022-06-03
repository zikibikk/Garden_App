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
        let myNotesVC = MyNotesViewController()
        let myNotesNavVC = UINavigationController()
        myNotesNavVC.navigationBar.tintColor = .black
        myNotesNavVC.viewControllers = [myNotesVC]
        return myNotesNavVC
    }
}
