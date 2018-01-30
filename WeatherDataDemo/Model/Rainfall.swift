//
//  Rainfall.swift
//  WeatherDataDemo
//
//  Created by Fong Bao on 30/01/2018.
//  Copyright © 2018 Fong Bao. All rights reserved.
//

import Foundation


class Rainfall : DataEntityProtocol  {
    
    var annual : Double?
    var year : Int?
    var region : RegionEntity?
    
    var months = [Month]()
    var seasons = [Season]()
    

    
    
}
