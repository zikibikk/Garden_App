//
//  PlantNoteView.swift
//  Garden_App
//
//  Created by Лилия Комиссарова on 05.06.2022.
//

import Foundation
import UIKit

class PlantNoteView: UIView {
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.isScrollEnabled = false
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
            make.edges.equalToSuperview().inset(10)
        }
    }
}

extension PlantNoteView: PlantInput {
    func getPlant(plant: PlantStruct) {
        self.notes = plant.plantsNotes.map {
            Array($0)
        } ?? []
    }
}

extension PlantNoteView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(UITableViewCell.self)") else { return UITableViewCell() }
        let note = notes[indexPath.row]
        cell.textLabel?.text = note.noteText
        return cell
    }
}

