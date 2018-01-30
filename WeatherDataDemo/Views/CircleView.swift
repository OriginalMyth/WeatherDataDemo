//
//  CircleView.swift
//  WeatherDataDemo
//
//  Created by Fong Bao on 26/01/2018.
//  Copyright © 2018 Fong Bao. All rights reserved.
//

import Foundation
import UIKit


class CircleView: UIView {
    
    @IBInspectable var fillColor: UIColor = UIColor(red: 0.23, green: 0.79, blue: 1.00, alpha: 0.75) {
        didSet {
            //print("Main color was set here!")
        }
    }
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(ovalIn: rect)
        fillColor.setFill()
        path.fill()
    }
    
}
