//
//  UsersModule.swift
//  Garden_App
//
//  Created by Alina Bikkinina on 18.05.2022.
//

import Foundation

struct User {
    let firstName: String
    let secondName: String
}

protocol UsersViewInput: AnyObject {
    func show(users: [User])
    func showLoader()
    func hideLoader()
}

protocol UsersViewOutput {
    func viewDidLoad()
    func viewDidSelect(user: User)
}

protocol IUsersRouter {
    func openDetails(of user: User)
}
