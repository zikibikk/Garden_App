//
//  CalendarAssembly.swift
//  Garden_App
//
//  Created by Лилия Комиссарова on 03.06.2022.
//

import Foundation
import UIKit

enum CalendarAssembly {
    static func assemble() -> UIViewController {
        
        let router = CalendarRouter()
        let calendarVC = CalendarViewController(router: router)
        
        router.view = calendarVC
        return calendarVC
    }
}
