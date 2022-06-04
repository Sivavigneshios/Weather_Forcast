//
//  WeatherDataModel.swift
//  Weather_Forecast
//
//  Created by User on 04/06/22.
//

import Foundation
import UIKit

struct WeatherListMapper : Mappable {
    
    
    var location : LocationDetails?
    var forcastDetals : ForecastDetails?
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        location <- map["location"]
        forcastDetals <- map["forecast"]
    }
}

struct LocationDetails : Mappable {
    
    var city = String()
    var currentDataAndTime = String()
    var country = String()
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        city <- map["name"]
        currentDataAndTime <- map["localtime"]
        country <- map["country"]
    }
}

struct ForecastDetails : Mappable {
    
    var forCastData = [WeatherDetails]()
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        forCastData <- map["forecastday"]
        
    }
}

struct WeatherDetails : Mappable {
    
    var date = String()
    var dayDetails : DayDetails?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        date <- map["date"]
        dayDetails <- map["day"]
        
    }
}

struct DayDetails : Mappable {
    
    var minimumTemp = Int()
    var maximumTemp = Int()
    var condition : Condition?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        minimumTemp <- map["mintemp_c"]
        maximumTemp <- map["maxtemp_c"]
        condition <- map["condition"]
    }
}

struct Condition : Mappable {
    
    var currentConditionIcon = String()
    var name = String()
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        currentConditionIcon <- map["icon"]
        name <- map["text"]
    }
}


