//
//  MyGardenRouter.swift
//  Garden_App
//
//  Created by Лилия Комиссарова on 06.06.2022.
//

import Foundation
import UIKit

class MyGardenRouter: IGardenRouter {
    weak var view: UIViewController?
    
    func openPlantVC(plant: PlantStruct, router: IDayRouter, notesService: INotesService, reminderService: IReminderService) {
        let presenter = PlantPresenter(plant: plant, router: router, notesService: notesService, reminderService: reminderService)
        let vc = PlantViewController(presenter: presenter)
        
        view?.navigationController?.pushViewController(vc, animated: true)
    }
}
