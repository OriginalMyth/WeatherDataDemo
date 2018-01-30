//
//  Regions.swift
//  WeatherDataDemo
//
//  Created by Fong Bao on 25/01/2018.
//  Copyright © 2018 Fong Bao. All rights reserved.
//

import Foundation


enum Regions : Int {
    
    case UK = 0
    case England
    case Scotland
    case Wales
    
    
    //Would Localise here for different languages
    var displayDescription : String {
        switch self {
        case.UK:
            return "UK"
        case .England:
            return "England"
        case .Scotland:
            return "Scotland"
        case .Wales:
            return "Wales"
        }
    }
    
    var urlEnd : String {
        switch self {
        case.UK:
            return "UK.txt"
        case .England:
            return "England.txt"
        case .Scotland:
            return "Scotland.txt"
        case .Wales:
            return "Wales.txt"
        }
    }
    
    
    func regionEndpoint(val : String) -> String {
        return Constants.metBaseUrl + val + self.urlEnd
    }
    
    //Need to set regions instance
//    var urlEndpoint : String {
//        switch self {
//        case.UK:
//            return Constants.metBaseUrl + DataValues.Rainfall.urlDescription + self.urlEnd
//        case .England:
//            return Constants.metBaseUrl + DataValues.Rainfall.urlDescription + self.urlEnd
//        case .Scotland:
//            return Constants.metBaseUrl + DataValues.Rainfall.urlDescription + self.urlEnd
//        case .Wales:
//            return Constants.metBaseUrl + DataValues.Rainfall.urlDescription + self.urlEnd
//        }
//    }
    
    static let count: Int = {
        var max: Int = 0
        while let _ = Regions(rawValue: max) { max += 1 }
        return max
    }()
    
}





