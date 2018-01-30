//
//  DataValues.swift
//  WeatherDataDemo
//
//  Created by Fong Bao on 25/01/2018.
//  Copyright © 2018 Fong Bao. All rights reserved.
//

import Foundation


enum DataValues : Int {
    
    case Tmax
    case Tmin
    case Tmean
    case Sunshine
    case Rainfall

    
    var description : String {
        switch self {
        case.Tmax:
            return "MaxTemp"
        case .Tmin:
            return "MinTemp"
        case .Tmean:
            return "MeanTemp"
        case .Sunshine:
            return "Sunshine"
        case .Rainfall:
            return "Rainfall"
        }
    }
    
    
    var urlDescription : String {
        switch self {
        case.Tmax:
            return "Tmax/date/"
        case .Tmin:
            return "Tmin/date/"
        case .Tmean:
            return "Tmean/date/"
        case .Sunshine:
            return "Sunshine/date/"
        case .Rainfall:
            return "Rainfall/date/"
        }
    }
    
    
    static let count: Int = {
        var max: Int = 0
        while let _ = Regions(rawValue: max) { max += 1 }
        return max
    }()
    
}
