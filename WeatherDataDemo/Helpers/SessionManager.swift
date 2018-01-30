//
//  SessionManager.swift
//  WeatherDataDemo
//
//  Created by Fong Bao on 30/01/2018.
//  Copyright © 2018 Fong Bao. All rights reserved.
//

import Foundation

class SessionManager : DatabaseManagerProtocol {
    
    static let sharedInstance = SessionManager()
    
    var regionEntities = [RegionEntity]()
    
    private init() {
        for region in 0...Regions.count {
            if let mRegion = Regions(rawValue: region) {
                regionEntities.append(RegionEntity(regionName: mRegion.displayDescription))
            }
        }   
    }
    
}

