//
//  CollectionViewCell.swift
//  Garden_App
//
//  Created by Alina Bikkinina on 25.04.2022.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    // TODO: (r.akhmadeev) Что зачем почему?
    static let identifier = "CollectionViewCell"
    // TODO: (r.akhmadeev) У вас проекте нет XIB файлов. Это явно тут лишнее
    static func nib() -> UINib {
        return UINib(nibName: "CollectionViewCell", bundle: nil)
    }
    
}
