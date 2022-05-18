//
//  AddTagViewController.swift
//  Garden_App
//
//  Created by Alina Bikkinina on 18.05.2022.
//

import SnapKit

class AddTagController: UIViewController {
    public var presenter: DayPresenter?
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .buttonTitle
        label.text = "Создать тег"
        label.textAlignment = .center
        return label
    }()
    
    private lazy var textField: UITextField = {
       let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.keyboardType = .default
        tf.enablesReturnKeyAutomatically = true
        return tf
    }()
    
//    private lazy var collectionView: UICollectionView = {
//    }()
    
    private lazy var addButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Сохранить", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 15
        button.titleLabel?.font = .buttonTitle
        button.backgroundColor = .lightGreen
        return button
    }()
    
    private lazy var verticalView: UIStackView = {
        let hv = UIStackView()
        hv.axis = .vertical
        hv.spacing = 12
        return hv
    }()
    
    private lazy var tagGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(addReminder(_:)))
    
    override func viewDidLoad() {
        setup()
        super.viewDidLoad()
    }
}

extension AddTagController {
    func setup() {
        self.view.backgroundColor = .white
        self.view.addSubview(verticalView)
        
        addButton.snp.makeConstraints({ $0.height.equalTo(Constraints.fieldHeight)})
        
        verticalView.snp.makeConstraints { maker in
            maker.left
                .right
                .equalToSuperview()
                .inset(Constraints.side)
            maker.top.equalToSuperview()
                .inset(30)
        }
        
        verticalView.addArrangedSubview(titleLabel)
        verticalView.addArrangedSubview(textField)
        verticalView.addArrangedSubview(addButton)
        addButton.addGestureRecognizer(tagGestureRecognizer)
        self.view.snp.makeConstraints({$0.bottom.equalTo(verticalView).offset(25)})
    }
}

extension AddTagController {
    @objc func addReminder(_ sender:UITapGestureRecognizer) {
        print("added tag")
        textField.endEditing(true)
        presenter?.addReminder()
     }
}
