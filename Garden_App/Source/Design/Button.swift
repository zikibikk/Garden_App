//
//  Button.swift
//  Garden_App
//
//  Created by Alina Bikkinina on 04.04.2022.
//

import SnapKit
import Darwin

class AddNoteButton: UIButton {
    
    private lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .buttonTitle
        button.setTitle("Добавить заметку", for: .normal)
        button.addTarget(self, action: #selector(pressNote), for: .touchUpInside)
        return button
    }()
    
    private lazy var backgroundView: UIView = {
        let view = UIView()
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 25
        view.backgroundColor = .deepGreen
        return view
    }()
    
    private var isPressed = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AddNoteButton {
    
    private func setup() {
        addSubview(backgroundView)
        backgroundView.addSubview(button)
        
        backgroundView.snp.makeConstraints { maker in
            maker.top
                .left
                .right
                .equalToSuperview()
        }
        
        button.snp.makeConstraints { maker in
            maker.left.equalToSuperview().inset(15)
            maker.top.equalToSuperview().inset(4)
            maker.bottom.equalToSuperview().inset(9)
        }
    }
}

extension AddNoteButton {
    @objc func pressNote() {
        var newFrame = self.backgroundView.frame
        var animator: UIViewPropertyAnimator
        if (!isPressed) {
            newFrame.size.height += 200
            animator = UIViewPropertyAnimator(duration: 1, curve: .linear) { [self] in
                self.backgroundView.snp.makeConstraints({
                    $0.bottom.equalToSuperview().offset(200)
                })
                self.backgroundView.frame = newFrame
            }
        }
        else {
            newFrame.size.height -= 200
            animator = UIViewPropertyAnimator(duration: 1, curve: .linear) { [self] in
                self.backgroundView.snp.makeConstraints({
                    $0.bottom.equalToSuperview().inset(200)
                })
                self.backgroundView.frame = newFrame
            }
        }

        animator.startAnimation()
        isPressed = !isPressed
    }
}
