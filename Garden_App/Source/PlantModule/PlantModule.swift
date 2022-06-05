//
//  PlantModule.swift
//  Garden_App
//
//  Created by Лилия Комиссарова on 04.06.2022.
//

import Foundation

protocol PlantViewInput: AnyObject {
    func getPlantInfo(plant: PlantStruct)
}
protocol PlantViewOutput: AnyObject {
    func viewDidLoad()
}
