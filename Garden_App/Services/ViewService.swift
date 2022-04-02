//
//  DesignService.swift
//  Garden_App
//
//  Created by Alina Bikkinina on 02.04.2022.
//

import UIKit
import Foundation

class ViewService {
    
    static func configureLabel(text: String, font: UIFont, color: UIColor) -> UILabel {
        let resultLabel = UILabel()
        resultLabel.text = text
        resultLabel.font = font
        resultLabel.textColor = color
        return resultLabel
    }
    
    //TODO: рамки по периметру текста, чтобы граница цета начиналась раньше, чем текст
    static func configureNoteLabel(text: String, font: UIFont, color: UIColor, backgroundColor: UIColor) -> UILabel {
        let resultLabel = UILabel()
        resultLabel.text = text
        resultLabel.font = font
        resultLabel.textColor = color
        
        resultLabel.backgroundColor = backgroundColor
        resultLabel.layer.masksToBounds = true
        resultLabel.layer.cornerRadius = 15.0
        resultLabel.numberOfLines = 0
        return resultLabel
    }
    
    static func configureTextView(text: String, font: UIFont, color: UIColor) -> UITextView {
        let resultTextView = UITextView()
        resultTextView.text = text
        resultTextView.font = font
        resultTextView.textColor = color
        return resultTextView
    }
    
}
