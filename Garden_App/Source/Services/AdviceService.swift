//
//  AdviceService.swift
//  Garden_App
//
//  Created by Alina Bikkinina on 08.04.2022.
//

import Foundation

protocol IAdviceService {
    func getAdvice() -> String
}

class AdviceService: IAdviceService {
    func getAdvice() -> String {
        return "Продолжается самый благоприятный период месяца для посадки, пересадки и деления многолетников. Кроме того, в эти дни можно подсеять газон и высадить деревья и кустарники с ЗКС."
    }
}
