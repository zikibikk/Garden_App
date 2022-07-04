//
//  DateService.swift
//  Garden_App
//
//  Created by Alina Bikkinina on 01.06.2022.
//

import Foundation


extension Date {
    init(dateString: String) {
        let dateStringFormatter = DateFormatter()
        dateStringFormatter.dateFormat = "dd.MM.yy"
        dateStringFormatter.locale = NSLocale(localeIdentifier: "ru_RU_POSIX") as Locale
        let date = dateStringFormatter.date(from: dateString)!
        self.init(timeInterval: 0, since: date)
    }
}

// TODO: (r.akhmadeev) Согласно документации, создание нового DateFormatter
// - дорогая операция (сильно нагружает систему)
// В этом файле он создается каждый раз, когда вам нужно получить какие-то строки
// Лучше сохранять их в виде свойства внутри класса и переиспользовать.

// TODO: (r.akhmadeev) Для каждого вида типа dateFormat создать отдельный DateFormatter
class DateService {
    
    func getTime(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: date)
    }
    
    func getDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMMM"
        return dateFormatter.string(from: date)
    }
    
    func getDateWithYear(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMMM yyyy"
        return dateFormatter.string(from: date)
    }
    
    func getDecimalDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yy"
        return dateFormatter.string(from: date)
    }
}
