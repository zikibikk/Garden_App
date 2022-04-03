//
//  colors.swift
//  Garden_App
//
//  Created by Alina Bikkinina on 01.04.2022.
//

import Foundation
import UIKit

class Colors {
    
    private static func devide(a: CGFloat) -> CGFloat { return a/255 }
    
    static let green = UIColor(red: devide(a: 78), green: devide(a: 161), blue: devide(a: 101), alpha: 1)
    
    static let lightGreen = UIColor(red: devide(a: 78), green: devide(a: 161), blue: devide(a: 101), alpha: 0.29)
    
    static let grayText = UIColor(red: devide(a: 67), green: devide(a: 67), blue: devide(a: 67), alpha: 1)
    
}

extension UIColor {

}
