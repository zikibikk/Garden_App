//
//  colors.swift
//  Garden_App
//
//  Created by Alina Bikkinina on 01.04.2022.
//

import UIKit

extension UIColor {
    private static func devide(a: CGFloat) -> CGFloat { return a/255 }
}

extension UIColor {
    
    static var deepGreen: UIColor {
        return UIColor(red: devide(a: 78), green: devide(a: 161), blue: devide(a: 101), alpha: 1)
    }
    
    static var lightGreen: UIColor {
        return UIColor(red: devide(a: 78), green: devide(a: 161), blue: devide(a: 101), alpha: 0.29)
    }
    
    static var gray: UIColor {
        return UIColor(red: devide(a: 67), green: devide(a: 67), blue: devide(a: 67), alpha: 1)
    }
}
