//
//  ServiceManagerProtocol.swift
//  WeatherDataDemo
//
//  Created by Fong Bao on 25/01/2018.
//  Copyright © 2018 Fong Bao. All rights reserved.
//

import Foundation


protocol ServiceManagerProtocol {
    
    func getRegionsData(region : Regions, handler : @escaping (NetworkError?) -> Void)
    
}
