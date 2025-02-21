//
//  Core+Extensions.swift
//  Weather App
//
//  Created by Alexandre Marques on 1/31/25.
//

import Foundation

extension Int {
    func toMillimeters () -> String {
         "\(Int(self)) mm"
    }

    func toWeekdayName() -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(self))
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EE" // "EE" represents the full weekday name
        
        return dateFormatter.string(from: date)
    }
    
    func toHourFormat() -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(self))
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm" // "HH:mm" represents the 24-hour format
        
        return dateFormatter.string(from: date)
    }
    
    func isDayTime() -> Bool {
        let date = Date(timeIntervalSince1970: TimeInterval(self))
        let hour = Calendar.current.component(.hour, from: date)
        
        let dayStartHour = 6
        let dayEndHour = 18
        
        return hour >= dayStartHour && hour < dayEndHour
    }
}

extension String {
    func isDayTime() -> Bool {
//        let date = Date(timeIntervalSince1970: TimeInterval(self)!)
        let dateFormatter = DateFormatter();
        
        let date = dateFormatter.date(from: self) ?? Date()
        let hour = Calendar.current.component(.hour, from: date)
        
        let dayStartHour = 6
        let dayEndHour = 18
        
        return hour >= dayStartHour && hour < dayEndHour
    }
    
    func formattDate() -> String {
        let dateFormatter = DateFormatter()
        let stringDate = self
        
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.dateStyle = .medium
        
        let date = dateFormatter.date(from: stringDate) ?? Date()
        let formattedDate = dateFormatter.string(from: date)
        
        print(formattedDate)
        return formattedDate
    }
    
    func getDate() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale.current
        
        let date = dateFormatter.date(from: self) ?? Date()
        
        return dateFormatter.string(from: date)// replace Date String
    }
}

extension Double {
    func toCelsius () -> String {
        "\(Int(self))°C"
    }
    
    func toMillimeters () -> String {
         "\(Int(self)) mm"
    }
    
    func toKm() -> String {
         "\(Int(self)) km/h"
    }
}
