//
//  NoteViewController.swift
//  Garden_App
//
//  Created by Alina Bikkinina on 24.04.2022.
//
import SnapKit
import UIKit

class NoteViewController: UIViewController, NoteInput {
    
    private let presenter: NoteOutput
    
    private var tags: [TagView]?
    
    private lazy var scrollView = UIScrollView()
    
    private lazy var noteView = EditableGreenView()
    
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
    
    override func viewDidLoad() {
        initialize()
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    
    init(presenter: NoteOutput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension NoteViewController {
    
    func getNote(note: NoteStruct?) {
        //self.tags =
        self.noteView.text = note?.noteText
    }
}

extension NoteViewController {
    private func initialize() {
        navigationController?.navigationBar.tintColor = .black
        
        self.view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.addSubview(noteView)
        scrollView.addSubview(tagInscription)
        scrollView.addSubview(collectionView)
        scrollView.alwaysBounceVertical = true
        
        scrollView.snp.makeConstraints { maker in
            maker.left
                .equalToSuperview()
                .inset(Constraints.side)
            maker.right
                .equalTo(view.safeAreaLayoutGuide.snp.right)
                .inset(Constraints.side)
            maker.width
                .equalTo(view.safeAreaLayoutGuide.snp.width)
                .inset(Constraints.side)
            maker.top
                .equalToSuperview()
            maker.bottom
                .equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        
        noteView.snp.makeConstraints { maker in
            maker.top.equalToSuperview()
            maker.left
                .right
                .equalToSuperview()
            maker.height.equalTo(300)
            maker.width.equalToSuperview()
        }
        tagInscription.snp.makeConstraints { maker in
            maker.top.equalTo(noteView.snp.bottom).offset(44)
            maker.left.equalToSuperview()
            maker.width.equalToSuperview()
        }
        collectionView.snp.makeConstraints { maker in
            maker.top.equalTo(noteView.snp.bottom).offset(85)
            maker.left
                .right
                .equalToSuperview()
                .inset(22)
            maker.width.equalToSuperview()
                .inset(44)
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
