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
        return "Наиболее благоприятный день месяца для работы с растениями. В саду можно обработать деревья и кустарники медьсодержащими препаратами по спящим почкам"
    }
}
