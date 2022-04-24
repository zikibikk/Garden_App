//
//  CollectionViewCell.swift
//  Garden_App
//
//  Created by Alina Bikkinina on 25.04.2022.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    static let identifier = "CollectionViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "CollectionViewCell", bundle: nil)
    }
    
}
