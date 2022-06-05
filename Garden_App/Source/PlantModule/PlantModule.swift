//
//  PlantModule.swift
//  Garden_App
//
//  Created by Лилия Комиссарова on 04.06.2022.
//

import Foundation

protocol PlantInput: AnyObject {
    func getPlant(plant: PlantStruct)
}
protocol PlantOutput: AnyObject {
    func viewDidLoad()
    func savePlant(plant: PlantStruct)
}
