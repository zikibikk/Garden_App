//
//  CalendarRouter.swift
//  Garden_App
//
//  Created by Лилия Комиссарова on 03.06.2022.
//

import Foundation
import UIKit

class CalendarRouter {
    weak var view: UIViewController?
    
    func openDayVC(title: String) {
        let vc = PreviousDayViewController()
        vc.title = title
        view?.navigationController?.pushViewController(vc, animated: true)
    }
}
