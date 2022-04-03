//
//  DayViewController.swift
//  Garden_App
//
//  Created by Alina Bikkinina on 01.04.2022.
//

import SnapKit
import UIKit

protocol IDayPresenter {}

final class DayPresenter: IDayPresenter {}

class DayViewController: UIViewController {
    private let presenter: IDayPresenter

    private lazy var dateLabel: UILabel = UILabel()
    private lazy var infoView: UIView = DeepGreenView()
    private lazy var addNoteButton: UIButton = .roundedButton()
    private lazy var addReminderButton = UIButton()

    init(presenter: IDayPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        // Do any additional setup after loading the view.
    }

}

//TODO: дописать приколюхи с констрейнтами и текст убрать хардкод. для шаблонных фраз можно завести файл, длинные сводки пока доставать каким-нибудь сервисом

extension DayViewController {
    
    private func initialize() {
        
        view.backgroundColor = .white
        
        view.addSubview(dateLabel)
        
        view.addSubview(infoView)
        
        infoView.snp.makeConstraints { maker in
            maker.left.equalToSuperview().inset(100)
            maker.right.equalToSuperview().inset(100)
            maker.top.equalToSuperview().inset(200)
        }
    }
}

extension UIButton {

    static func roundedButton() -> UIButton {
        let button = UIButton()
        // configure

        return button
    }
}
