//
//  DayViewController.swift
//  Garden_App
//
//  Created by Alina Bikkinina on 01.04.2022.
//

import SnapKit

class DayViewController: UIViewController {
    lazy var infoView = DeepGreenView()
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .title
        return label
    }()
    private var presenter: DayPresenter
    private var isSelected = false
    private lazy var addNoteButton = AddNoteView()
    private lazy var addReminderButton = AddReminderView()
    private lazy var gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(animateView(_:)))
    
    init(presenter: DayPresenter) {
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

extension DayViewController {
    private func initialize() {
        view.backgroundColor = .white
        view.addSubview(dateLabel)
        view.addSubview(infoView)
        view.addSubview(addNoteButton)
        view.addSubview(addReminderButton)
        presenter.initialize()
        
        addNoteButton.addGestureRecognizer(gestureRecognizer)
        
        dateLabel.snp.makeConstraints { maker in
            maker.left
                .right
                .equalToSuperview()
                .inset(Constraints.side)
            maker.top.equalToSuperview().inset(90)
        }
        
        infoView.snp.makeConstraints { maker in
            maker.left
                .right
                .equalToSuperview()
                .inset(Constraints.side)
            maker.top.equalTo(dateLabel.snp.bottom).offset(30)
        }
        
        addNoteButton.snp.makeConstraints { maker in
            maker.right
                .left
                .equalToSuperview()
                .inset(Constraints.side)
            maker.top.equalTo(infoView.snp.bottom).offset(35)
        }
        
        addReminderButton.snp.makeConstraints { maker in
            maker.right
                .left
                .equalToSuperview()
                .inset(Constraints.side)
            maker.top.equalTo(addNoteButton.snp.bottom).offset(15)
        }
    }
}

extension DayViewController {
    @objc func animateView(_ sender:UITapGestureRecognizer) {
        
        let animator = UIViewPropertyAnimator(duration:0, curve: .linear) { [self] in
            if(!isSelected) {
                addNoteButton.snp.makeConstraints { maker in
                    maker.height.equalTo(220)
                }
            } else {
                addNoteButton.snp.makeConstraints { maker in
                    maker.height.equalTo(Constraints.fieldHeight)
                }
            }
            isSelected = !isSelected
            addNoteButton.updateConstraints()
            addNoteButton.layoutIfNeeded()
         }
         animator.startAnimation()
     }
}
