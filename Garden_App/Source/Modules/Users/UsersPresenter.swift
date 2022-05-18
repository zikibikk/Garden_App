//
//  UsersPresenter.swift
//  Garden_App
//
//  Created by Alina Bikkinina on 18.05.2022.
//

import Foundation

final class UsersPresenter: UsersViewOutput {
    weak var view: UsersViewInput?
    private let router: IUsersRouter
    private let usersApi: IUsersApi
    
    init(usersApi: IUsersApi, router: IUsersRouter) {
        self.usersApi = usersApi
        self.router = router
    }
    
    func viewDidLoad() {
        view?.showLoader()
        
        usersApi.getAllUsers { [weak self] users in
            self?.view?.hideLoader()
            self?.view?.show(users: users)
        }
    }
    
    func viewDidSelect(user: User) {
        router.openDetails(of: user)
    }
}
