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

    private lazy var dateLabel: UILabel = ViewService.configureLabel(text: "", font: .systemFont(ofSize: 14), color: .gray)
    private lazy var infoLabel = UILabel()
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
        
        dateLabel = ViewService.configureLabel(text: "Сегодня", font: .title, color: Colors.grayText)
        infoLabel = ViewService.configureNoteLabel(text: "Наиболее благоприятный день месяца для работы с растениями. В саду можно обработать деревья и кустарники медьсодержащими препаратами по спящим почкам", font: Fonts.text!, color: .white, backgroundColor: Colors.green)
        
        view.addSubview(dateLabel)
        
        view.addSubview(infoLabel)
        
        dateLabel.snp.makeConstraints { maker in
            maker.left.equalToSuperview().inset(100)
            maker.top.equalToSuperview().inset(100)
        }
        
        infoLabel.snp.makeConstraints { maker in
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
