//
//  APICallerService.swift
//  Garden_App
//
//  Created by Лилия Комиссарова on 25.04.2022.
//

import Foundation

class CalendarPaginationService {
    private var howMany = 1
    var isPaginating = false
    func fetchData(pagination: Bool = false, completion: @escaping (Result<[Date], Error>) -> Void) {
        if pagination {
            self.isPaginating = true
        }
        DispatchQueue.global().asyncAfter(deadline: .now() + (pagination ? 3 : 2) , execute: {
            var nextYearsMonths = [Date]()
            var dateComponents = DateComponents()
            for month in 1...12 {
                dateComponents.year = 2022 + self.howMany
                dateComponents.month = month
                guard let date = Calendar.current.date(from: dateComponents) else { return }
                nextYearsMonths.append(date)
            }
            self.howMany = self.howMany + 1
            completion(.success(nextYearsMonths))
            if pagination {
                self.isPaginating = false
            }
        })
    }
}
