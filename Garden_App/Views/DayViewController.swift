//
//  DayViewController.swift
//  Garden_App
//
//  Created by Alina Bikkinina on 01.04.2022.
//

import SnapKit

class DayViewController: UIViewController {
    
    private lazy var dateLabel: UILabel = UILabel()
    private lazy var infoView: UIView = {
        let view = DeepGreenView()
        view.text = "Наиболее благоприятный день месяца для работы с растениями. В саду можно обработать деревья и кустарники медьсодержащими препаратами по спящим почкам"
        return view
    }()
    private lazy var addNoteButton: UIButton = UIButton()
    private lazy var addReminderButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
}

extension DayViewController {
    
    private func initialize() {
        view.backgroundColor = .white
        view.addSubview(infoView)
        
        infoView.snp.makeConstraints { maker in
            maker.left.equalToSuperview().inset(Constraints.side)
            maker.right.equalToSuperview().inset(Constraints.side)
            maker.top.equalToSuperview().inset(100)
        }
    }
}
