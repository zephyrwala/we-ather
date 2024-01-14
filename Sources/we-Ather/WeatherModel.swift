//
//  WeatherModel.swift
//  OpenWeather
//
//  Created by Mayur P on 14/01/24.
//

import Foundation



//Codable Struct to represent JSON payload
// MARK: - Weathered
public struct Weathered: Codable {
    let coord: Coord
    let weather: [Weather]
    let base: String
    let main: Main
    let visibility: Int
    let wind: Wind
    let clouds: Clouds
    let dt: Int
    let sys: Sys
    let timezone, id: Int
    let name: String
    let cod: Int
}

// MARK: - Clouds
public struct Clouds: Codable {
    let all: Int
}

// MARK: - Coord
public struct Coord: Codable {
    let lon, lat: Double
}

// MARK: - Main
public struct Main: Codable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, humidity: Int

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
    }
}

// MARK: - Sys
public struct Sys: Codable {
    let type, id: Int
    let country: String
    let sunrise, sunset: Double
}

// MARK: - Weather
public struct Weather: Codable {
    let id: Int
    let main, description, icon: String
}

// MARK: - Wind
public struct Wind: Codable {
    let speed: Double
    let deg: Int
}


public enum ApiError: Error {
    case errorDecoding
    case noData
    
}


extension Sys {
    public var sunriseTime: Date {
        return Date(timeIntervalSince1970: self.sunrise)
    }
    
    public var sunsetTime: Date {
        return Date(timeIntervalSince1970: self.sunset)
    }
}
