//
//  NoteViewController.swift
//  Garden_App
//
//  Created by Alina Bikkinina on 24.04.2022.
//

import SnapKit

class PreviousDayViewController: UIViewController {
    private var presenter: PreviousDayPresenter
    
    private lazy var verticalView: UIStackView = {
        let hv = UIStackView()
        hv.axis = .vertical
        hv.spacing = 30
        return hv
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .title
        return label
    }()
    
    lazy var adviceView = GreenView()
    lazy var noteStatus: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .buttonTitle
        label.text = "Заметка"
        return label
    }()
    
    lazy var noteView: GreenView = {
        let gv = GreenView()
        gv.makeLightBackground()
        return gv
    }()
    
    lazy var reminderStatus: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .buttonTitle
        label.text = "Напоминаний нет"
        return label
    }()
    
    init(presenter: PreviousDayPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
}

extension PreviousDayViewController {
    func initialize () {
        view.addSubview(verticalView)
        view.backgroundColor = .white
        presenter.initialize()
        verticalView.addArrangedSubview(dateLabel)
        verticalView.addArrangedSubview(adviceView)
        verticalView.addArrangedSubview(noteStatus)
        verticalView.addArrangedSubview(noteView)
        verticalView.addArrangedSubview(reminderStatus)
        
        verticalView.snp.makeConstraints { maker in
            maker.right
                .left
                .equalToSuperview()
                .inset(Constraints.side)
            maker.top.equalToSuperview().inset(60)
        }
    }
}
