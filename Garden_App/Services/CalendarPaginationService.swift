//
//  APICallerService.swift
//  Garden_App
//
//  Created by Лилия Комиссарова on 25.04.2022.
//

import Foundation

class CalendarPaginationService {
    private var howMany = 1
    func fetchData() -> [Date] {
        var nextYearsMonths = [Date]()
        var dateComponents = DateComponents()
        
        for month in 1...12 {
            dateComponents.year = 2022 + self.howMany
            dateComponents.month = month
            guard let date = Calendar.current.date(from: dateComponents) else { break }
            nextYearsMonths.append(date)
        }
        
        self.howMany = self.howMany + 1
        return nextYearsMonths
    }
}
