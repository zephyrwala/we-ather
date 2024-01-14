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
    public let coord: Coord
    public let weather: [Weather]
    public let base: String
    public let main: Main
    public let visibility: Int
    public let wind: Wind
    public let clouds: Clouds
    public let dt: Int
    public let sys: Sys
    public let timezone, id: Int
    public let name: String
    public let cod: Int
}

// MARK: - Clouds
public struct Clouds: Codable {
    public let all: Int
}

// MARK: - Coord
public struct Coord: Codable {
    public let lon, lat: Double
}

// MARK: - Main
public struct Main: Codable {
    public let temp, feelsLike, tempMin, tempMax: Double
    public let pressure, humidity: Int

    public enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
    }
}

// MARK: - Sys
public struct Sys: Codable {
    public let type, id: Int
    public let country: String
    public let sunrise, sunset: Double
}

// MARK: - Weather
public struct Weather: Codable {
    public let id: Int
    public let main, description, icon: String
}

// MARK: - Wind
public struct Wind: Codable {
    public let speed: Double
    public let deg: Int
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
