//
//  NoteViewController.swift
//  Garden_App
//
//  Created by Alina Bikkinina on 24.04.2022.
//
import SnapKit
import UIKit

class NoteViewController: UIViewController {
    var tags: [TagView]?
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .buttonTitle
        return label
    }()
    lazy var noteView = EditableGreenView()
    private lazy var tagInscription: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .buttonTitle
        label.text = "Теги"
        return label
    }()
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: 25, height: 125)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()
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
        view.addSubview(tagInscription)
        view.addSubview(collectionView)
        presenter.initializeNoteVC()
        
        let tag = TagView()
        tag.color = .tpink
        tag.text = "томат"
        tags = [tag]
        //collectionView.addSubview(tag)
        
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
            maker.height.equalTo(300)
        }
        tagInscription.snp.makeConstraints { maker in
            maker.top.equalTo(noteView.snp.bottom).offset(44)
            maker.left.equalToSuperview().inset(Constraints.side)
        }
        collectionView.snp.makeConstraints { maker in
            maker.top.equalTo(noteView.snp.bottom).offset(85)
            maker.left
                .right
                .equalToSuperview()
                .inset(52)
        }
        //for demonstration
        view.addSubview(tag)
        tag.snp.makeConstraints { maker in
            maker.left.equalToSuperview().inset(52)
            maker.top.equalTo(noteView.snp.bottom).offset(85)
        }
    }
}

extension NoteViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        tags?.count ?? 0
    }
}

extension NoteViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath)
        cell.addSubview(tags?[indexPath.row] ?? UIView())
        return cell
    }
}
