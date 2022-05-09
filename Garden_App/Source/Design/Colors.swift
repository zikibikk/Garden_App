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
    
    static var backgroundGreen: UIColor {
        return UIColor(red: devide(a: 231), green: devide(a: 240), blue: devide(a: 231), alpha: 1)
    }
    
    static var gray: UIColor {
        return UIColor(red: devide(a: 67), green: devide(a: 67), blue: devide(a: 67), alpha: 1)
    }
    
    //colors for tags
    static var torange: UIColor {
        return UIColor(red: devide(a: 227), green: devide(a: 199), blue: devide(a: 172), alpha: 1)
    }
    
    static var tgreen: UIColor {
        return UIColor(red: devide(a: 210), green: devide(a: 237), blue: devide(a: 211), alpha: 1)
    }
    
    static var tpink: UIColor {
        return UIColor(red: devide(a: 237), green: devide(a: 210), blue: devide(a: 210), alpha: 1)
    }
    
    static var tyellow: UIColor {
        return UIColor(red: devide(a: 236), green: devide(a: 237), blue: devide(a: 210), alpha: 1)
    }
}
