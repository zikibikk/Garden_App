//
//  UsersRouter.swift
//  Garden_App
//
//  Created by Alina Bikkinina on 18.05.2022.
//

import UIKit

final class UsersRouter: IUsersRouter {
    weak var view: UIViewController?
    
    func openDetails(of user: User) {
        let viewController = UserDetailsViewController(user: user)
        view?.present(viewController, animated: true)
    }
}

