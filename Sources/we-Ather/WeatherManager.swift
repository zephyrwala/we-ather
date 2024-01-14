//
//  WeatherManager.swift
//  OpenWeather
//
//  Created by Mayur P on 14/01/24.
//

import Foundation
import CoreLocation
import UIKit



public class WeatherManager {
    
    public init () {}
    
    //: [Get your API Key here](https://openweathermap.org/api "Open Weather Map API")
    //example: latitude 12.932833957416554, longitude: 77.60332444777305
    public static func fetchWeather<T: Codable>(dataType: T.Type, lat: CLLocationDegrees, lon: CLLocationDegrees, apiKey: String, completion: @escaping(Result<T, Error>) -> Void) {
        
        // get url
        guard let safeURL = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(lon)&appid=\(apiKey)&units=metric") else {
            return
        }
        //initiate urlsession
        let task = URLSession.shared.dataTask(with: safeURL) { weatherData, response, err in
            
            
            //decode the data
            guard let safeData = weatherData else {return}
            
            let decoder = JSONDecoder()
            do {
                let decodedData = try decoder.decode(T.self, from: safeData)
                completion(.success(decodedData))
                
            } catch {
                print("Error in decoding data")
                completion(.failure(ApiError.errorDecoding))
            }
            
            
            
        }
        task.resume()
    }
}


