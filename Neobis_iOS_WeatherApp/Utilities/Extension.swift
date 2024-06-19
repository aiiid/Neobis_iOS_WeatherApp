//
//  Extension.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Ai Hawok on 14/06/2024.
//

import UIKit

extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if hexSanitized.hasPrefix("#") {
            hexSanitized.remove(at: hexSanitized.startIndex)
        }
        
        var rgb: UInt64 = 0
        
        Scanner(string: hexSanitized).scanHexInt64(&rgb)
        
        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgb & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}

extension String {
    func toFormattedTime() -> String? {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        inputFormatter.timeZone = TimeZone(secondsFromGMT: 0)

        if let date = inputFormatter.date(from: self) {
            let outputFormatter = DateFormatter()
            outputFormatter.dateFormat = "HH.mm"
            outputFormatter.timeZone = TimeZone(secondsFromGMT: 0)
            return outputFormatter.string(from: date)
        }
        return nil
    }
    

        func toFormattedDay() -> String? {
            let inputFormatter = DateFormatter()
            inputFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            
            let ordinalFormatter = NumberFormatter()
            ordinalFormatter.numberStyle = .ordinal
            
            if let date = inputFormatter.date(from: self) {
                let calendar = Calendar.current
                let day = calendar.component(.day, from: date)
                let dayString = ordinalFormatter.string(from: NSNumber(value: day)) ?? "\(day)"
                
                let outputFormatter = DateFormatter()
                outputFormatter.dateFormat = "MMMM"
                let monthString = outputFormatter.string(from: date)
                
                return "\(dayString) \(monthString)"
            }
            return nil
        }
    
}
