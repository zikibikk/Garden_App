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
        hv.spacing = 15
        return hv
    }()
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .title
        return label
    }()
    lazy var adviceView = GreenView()
    lazy var noteView: GreenView = {
        let gv = GreenView()
        gv.makeLightBackground()
        return gv
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
        presenter.viewDidLoad()
    }
}

extension PreviousDayViewController {
    func initialize () {
        view.addSubview(verticalView)
        verticalView.addArrangedSubview(dateLabel)
        verticalView.addArrangedSubview(adviceView)
        verticalView.addArrangedSubview(noteView)
    }
}
