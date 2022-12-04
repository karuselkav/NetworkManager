//
//  WeatherModel.swift
//  Networking
//
//  Created by Karusel'ka . on 04.12.2022.
//

import Foundation


// MARK: - Weather
struct Weather: Codable {
    var request: Request
    var location: Location
    var current: Current
}

// MARK: - Current
struct Current: Codable {
    var observationTime: String
    var temparature, weatherCode: Int
    var weatherIcons: [String]
    var weatherDescriptions: [String]
    var windSpeed, windDegree: Int
    var windDir: String
    var pressure, precip, humidity, cloudcover: Int
    var feelslike, uvIndex, visibility: Int
    
    enum CodingKeys: String, CodingKey {
        case observationTime = "observation_time"
        case temparature
        case weatherCode = "weather_code"
        case weatherIcons = "weather_icons"
        case weatherDescriptions = "weather_descriptions"
        case windSpeed = "wind_speed"
        case windDegree = "wind_degree"
        case windDir = "wind_dir"
        case pressure, precip, humidity, cloudcover, feelslike
        case uvIndex = "uv_index"
        case visibility
    }
}

// MARK: - Location
struct Location: Codable {
    var name, country, region, lat: String
    var lon, timezoneID, localtime: String
    var localtimeEpoch: Int
    var utcOffset: String
    
    enum CodingKeys: String, CodingKey {
        case name, country, region, lat, lon
        case timezoneID = "timezone_id"
        case localtime
        case localtimeEpoch = "localtime_epoch"
        case utcOffset = "utc_offset"
    }
}
