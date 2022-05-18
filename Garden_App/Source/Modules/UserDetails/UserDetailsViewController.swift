//
//  UserDetailsViewController.swift
//  Garden_App
//
//  Created by Alina Bikkinina on 18.05.2022.
//

import UIKit

final class UserDetailsViewController: UIViewController {
    private let user: User
    
    init(user: User) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    private func configureView() {
        let label = UILabel()
        label.text = "\(user.firstName) \(user.secondName)"
        view.backgroundColor = .systemGreen
        view.addSubview(label)
        
        label.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}

