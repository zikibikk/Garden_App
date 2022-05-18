//
//  UsersApi.swift
//  Garden_App
//
//  Created by Alina Bikkinina on 18.05.2022.
//

import Foundation

protocol IUsersApi {
    func getAllUsers(completion: @escaping (_ users: [User]) -> Void)
}

final class UsersApi: IUsersApi {
    func getAllUsers(completion: @escaping (_ users: [User]) -> Void) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 3) {
            let users: [User] = .init(
                repeating: User(firstName: "firstName", secondName: "secondName"),
                count: 30
            )
            
            DispatchQueue.main.async {
                completion(users)
            }
            
        }
    }
}
