//
//  APICallerService.swift
//  Garden_App
//
//  Created by Лилия Комиссарова on 25.04.2022.
//

import Foundation

class CalendarPaginationService {
    private var howManyMore = 0
    private var howManyLess = 1
    func fetchNextMonths() -> [Date] { // TODO: (r.akhmadeev) Отступ
        var nextYearsMonths = [Date]()
        var dateComponents = DateComponents()
        
        for month in 1...12 {
            dateComponents.year = 2022 + self.howManyMore
            dateComponents.month = month
            guard let date = Calendar.current.date(from: dateComponents) else { break }
            nextYearsMonths.append(date)
        }
        
        self.howManyMore = self.howManyMore + 1
        return nextYearsMonths
    }
    
    func fetchPrevMonths() -> [Date] {
        var prevYearsMonths = [Date]()
        var dateComponents = DateComponents()
        
        for month in 1...12 {
            dateComponents.year = 2022 - self.howManyLess
            dateComponents.month = month
            guard let date = Calendar.current.date(from: dateComponents) else { break }
            prevYearsMonths.append(date)
        }
        
        self.howManyLess = self.howManyLess + 1
        return prevYearsMonths
    }
}
