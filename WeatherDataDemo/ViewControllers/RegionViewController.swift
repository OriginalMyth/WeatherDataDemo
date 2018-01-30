//
//  RegionViewController.swift
//  WeatherDataDemo
//
//  Created by Fong Bao on 26/01/2018.
//  Copyright © 2018 Fong Bao. All rights reserved.
//

import UIKit

class RegionViewController: UIViewController {
    
    @IBOutlet weak var annualView: UIView!
    @IBOutlet weak var seasonView: UIView!
    @IBOutlet weak var monthlyView: UIView!
    
    var region : RegionEntity?

    override func viewDidLoad() {
        super.viewDidLoad()

        let annualClicked = UITapGestureRecognizer(target: self, action:#selector(weatherTypeClicked))
        let seasonClicked = UITapGestureRecognizer(target: self, action:#selector(weatherTypeClicked))
        let monthlyClicked = UITapGestureRecognizer(target: self, action:#selector(weatherTypeClicked))
        annualView.addGestureRecognizer(annualClicked)
        seasonView.addGestureRecognizer(seasonClicked)
        monthlyView.addGestureRecognizer(monthlyClicked)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func weatherTypeClicked() {
        performSegue(withIdentifier: "showGraph", sender: self)
    }


    

}
