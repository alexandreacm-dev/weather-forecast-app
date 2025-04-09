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
    func isDay() -> Bool {
//        let date = Date(timeIntervalSince1970: TimeInterval(self)!)
        let dateFormatter = DateFormatter();
        
        let date = dateFormatter.date(from: self) ?? Date()
        let hour = Calendar.current.component(.hour, from: date)
        
        let dayStartHour = 6
        let dayEndHour = 18
        
        return hour >= dayStartHour && hour < dayEndHour
    }
    
    func formatTime() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
            
        let date = dateFormatter.date(from: self) ?? Date()
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .short
        dateFormatter.locale = Locale(identifier: "pt-PT")
        
        let hour = Calendar.current.component(.hour, from: date)
        let min = Calendar.current.component(.minute, from: date)
        
//        print(dateFormatter.string(from: date).split(separator: ":")[0])
        let formattedTime = min == 0 ?  "\(hour):\(min)0" : "\(hour):\(min)"
        
        return formattedTime
    }
    
    func formattDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        
        let today = dateFormatter.date(from: self)
    
        dateFormatter.dateFormat = "EEE"
        dateFormatter.locale = Locale(identifier: "pt-PT")
    

        let weekDay = dateFormatter.string(from: today ?? Date()).replacingOccurrences(of: ".", with: "").uppercased()
        return weekDay
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
