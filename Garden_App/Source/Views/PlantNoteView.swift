//
//  PlantNoteView.swift
//  Garden_App
//
//  Created by Лилия Комиссарова on 05.06.2022.
//

import Foundation
import UIKit

protocol ViewDelegate: AnyObject {
    func view(_ view: UIView, didSelectCellBy date: Date)
}

class PlantNoteView: UIView {
    weak var delegate: ViewDelegate?
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .clear
        tableView.isScrollEnabled = false
        tableView.separatorInset = UIEdgeInsets.init(top: 0, left: 13, bottom: 0, right: 13)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "\(UITableViewCell.self)")
        return tableView
    }()
    
    private var notes: [NoteStruct] = []
    
    override init(frame: CGRect){
        super.init(frame: frame)
        configureTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureTableView() {
        addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.right.left.bottom.equalToSuperview().inset(0)
        }
    }
}

extension PlantNoteView: PlantInputForNoteView {
    func getPlantNotes(plant: PlantStruct) {
        self.notes = plant.plantsNotes.map {
            Array($0)
        } ?? []
    }
}

extension PlantNoteView: PlantViewSizeDelegate {
    func plantViewContentSize(_ view: UIView) {
        view.snp.updateConstraints { make in
            make.height.equalTo(tableView.contentSize)
        }
    }
}

extension PlantNoteView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(UITableViewCell.self)") else { return UITableViewCell() }
        let note = notes[indexPath.row]
        let backgroundView = UIView()
        backgroundView.backgroundColor = .deepGreen
        cell.selectedBackgroundView = backgroundView
        cell.textLabel?.text = note.noteText
        cell.textLabel?.textColor = .gray
        cell.backgroundColor = .clear
        return cell
    }
}

extension PlantNoteView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let note = notes[indexPath.row]
        delegate?.view(self, didSelectCellBy: note.noteDate)
    }
}

