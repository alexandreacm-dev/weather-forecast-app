import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let forecastResponse = try? JSONDecoder().decode(ForecastResponse.self, from: jsonData)

struct City {
    let lat: String
    let lon: String
    let name: String
}

class Service {
    
    private let baseURL = "https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline"
    private let apiKey = "LESV8J4TKMSU66V26T53Y39BM"
    private let jsonDecoder = JSONDecoder()
    
    func fecthData(city: City, _ completion: @escaping (ForecastResponse?) -> Void) {
        
        let urlString = "\(baseURL)/\(city.lat),\(city.lon)?unitGroup=metric&key=\(apiKey)&contentType=json"
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data else {
                completion(nil)
                return
            }
            
    
            do {
                
                let forecastResponse = try self.jsonDecoder.decode(ForecastResponse.self, from: data)
                completion(forecastResponse)
            } catch {
                print(error)
                completion(nil)
            }
        }
        
        task.resume()
             
    }
    
}

// MARK: - ForecastResponse
struct ForecastResponse: Codable {
    let queryCost: Int
    let latitude, longitude: Double
    let resolvedAddress, address, timezone: String
    let tzoffset: Int
    let days: [CurrentConditions]
//    let stations: [String: Station]
    let currentConditions: CurrentConditions
}

// MARK: - CurrentConditions
struct CurrentConditions: Codable {
    let datetime: String
    let datetimeEpoch: Int
    let temp, feelslike, humidity, dew: Double
    let precip, precipprob: Double
    let snow, snowdepth: Int
    let preciptype: [Icon]?
    let windgust, windspeed, winddir, pressure: Double
    let visibility, cloudcover, solarradiation, solarenergy: Double
    let uvindex: Int
    let conditions: Conditions
    let icon: Icon
//    let stations: [ID]?
    let source: Source
    let sunrise: String?
    let sunriseEpoch: Int?
    let sunset: String?
    let sunsetEpoch: Int?
    let moonphase, tempmax, tempmin, feelslikemax: Double?
    let feelslikemin, precipcover: Double?
    let severerisk: Int?
    let description: String?
    let hours: [CurrentConditions]?
}

enum Conditions: String, Codable {
    case clear = "Clear"
    case overcast = "Overcast"
    case partiallyCloudy = "Partially cloudy"
    case rain = "Rain"
    case rainOvercast = "Rain, Overcast"
    case rainPartiallyCloudy = "Rain, Partially cloudy"
}

enum Icon: String, Codable {
    case clearDay = "clear-day"
    case clearNight = "clear-night"
    case cloudy = "cloudy"
    case partlyCloudyDay = "partly-cloudy-day"
    case partlyCloudyNight = "partly-cloudy-night"
    case rain = "rain"
}

enum Source: String, Codable {
    case comb = "comb"
    case fcst = "fcst"
    case obs = "obs"
}

//enum ID: String, Codable {
//    case e7074 = "E7074"
//    case f6070 = "F6070"
//    case sbco = "SBCO"
//    case sbpa = "SBPA"
//}
//
//// MARK: - Station
//struct Station: Codable {
//    let distance: Int
//    let latitude, longitude: Double
//    let useCount: Int
//    let id: ID
//    let name: String
//    let quality, contribution: Int
//}
