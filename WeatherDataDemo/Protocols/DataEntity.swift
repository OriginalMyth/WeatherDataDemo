//
//  DataEntity.swift
//  WeatherDataDemo
//
//  Created by Fong Bao on 30/01/2018.
//  Copyright © 2018 Fong Bao. All rights reserved.
//

import Foundation

protocol DataEntityProtocol {
    
    var annual : Double? {get set}
    var year : Int? {get set}
    var region : RegionEntity? {get set}
    
    var months : [Month] {get set}
    var seasons : [Season] {get set}
    
}
