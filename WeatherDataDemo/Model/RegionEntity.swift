//
//  RegionEntity.swift
//  WeatherDataDemo
//
//  Created by Fong Bao on 30/01/2018.
//  Copyright © 2018 Fong Bao. All rights reserved.
//

import Foundation


class RegionEntity {
    
    let name : String
    
    var maxTemps = [DataEntityProtocol]()
    var minTemps = [DataEntityProtocol]()
    var meanTemps = [DataEntityProtocol]()
    var rainfalls = [DataEntityProtocol]()
    var sunshines = [DataEntityProtocol]()
    
    init(regionName : String) {
        name = regionName
    }
    
    
}
