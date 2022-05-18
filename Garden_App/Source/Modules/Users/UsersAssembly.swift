//
//  UsersAssembly.swift
//  Garden_App
//
//  Created by Alina Bikkinina on 18.05.2022.
//

import Foundation
import UIKit

enum UsersAssembly {
    static func assemble() -> UIViewController {
        let api = UsersApi()
        let router = UsersRouter()
        let presenter = UsersPresenter(usersApi: api, router: router)
        let viewController = UsersViewController(presenter: presenter)
        presenter.view = viewController
        router.view = viewController
        
        return viewController
    }
}
