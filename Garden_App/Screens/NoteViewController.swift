//
//  NoteViewController.swift
//  Garden_App
//
//  Created by Alina Bikkinina on 24.04.2022.
//
import SnapKit

class NoteViewController: UIViewController {
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .buttonTitle
        return label
    }()
    lazy var noteView = EditableGreenView()
    private var presenter: DayPresenter
    
    override func viewDidLoad() {
        initialize()
        super.viewDidLoad()
    }
    
    init(presenter: DayPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension NoteViewController {
    private func initialize() {
        self.view.backgroundColor = .white
        view.addSubview(dateLabel)
        view.addSubview(noteView)
        presenter.initializeNoteVC()
        
        dateLabel.snp.makeConstraints { maker in
            maker.top.equalToSuperview().inset(60)
            maker.left.equalTo(Constraints.side)
            maker.height.equalTo(40)
        }
        noteView.snp.makeConstraints { maker in
            maker.top.equalTo(dateLabel.snp.bottom).offset(12)
            maker.left
                .right
                .equalToSuperview()
                .inset(Constraints.side)
            
        }
    }
}
