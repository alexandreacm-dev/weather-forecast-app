//
//  Core+Extensions.swift
//  Weather App
//
//  Created by Alexandre Marques on 1/31/25.
//

import Foundation

extension Int {
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
        let date = Date(timeIntervalSince1970: TimeInterval(self)!)
        let hour = Calendar.current.component(.hour, from: date)
        
        let dayStartHour = 6
        let dayEndHour = 18
        
        return hour >= dayStartHour && hour < dayEndHour
    }
    
    func toFormattDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .short
    
        let diffHours2  = self.split(separator: ":")[0]
        let diffMinutes2  = self.split(separator: ":")[1]
        
        
        return dateFormatter.string(from: Date())
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
