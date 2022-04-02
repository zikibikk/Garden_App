//
//  DayViewController.swift
//  Garden_App
//
//  Created by Alina Bikkinina on 01.04.2022.
//

import SnapKit
import UIKit

class DayViewController: UIViewController {
    
    var dateLabel = UILabel()
    var infoLabel = UILabel()
    var addNoteButton = UIButton()
    var addReminderButton = UIButton()

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
        
        dateLabel = ViewService.configureLabel(text: "Сегодня", font: Fonts.title!, color: Colors.grayText)
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
