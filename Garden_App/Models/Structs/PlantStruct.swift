//
//  PlantStruct.swift
//  Garden_App
//
//  Created by Alina Bikkinina on 30.03.2022.
//

import Foundation
struct PlantStruct {
    let plantDate: Date?
    let plantName: String
    let plantTags: Set<TagEntity>?
    let plantsReminders: Set<ReminderEntity>?
}
