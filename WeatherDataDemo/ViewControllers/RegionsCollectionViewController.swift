//
//  RegionsCollectionViewController.swift
//  WeatherDataDemo
//
//  Created by Fong Bao on 26/01/2018.
//  Copyright © 2018 Fong Bao. All rights reserved.
//

import UIKit


class RegionsCollectionViewCell : UICollectionViewCell {
    
    @IBOutlet weak var regionsLabel: UILabel!
    @IBOutlet weak var meanTempLabel: UILabel!
    @IBOutlet weak var highTempLabel: UILabel!
    @IBOutlet weak var lowTempLabel: UILabel!
    @IBOutlet weak var sunshineValueLabel: UILabel!
    @IBOutlet weak var rainfallValueLabel: UILabel!
    
    @IBOutlet weak var spinnerIndicator: UIActivityIndicatorView!
}


class RegionsCollectionViewController: UICollectionViewController {
    
    @IBOutlet var regionsCollectionView: UICollectionView!
    
    var serviceManager : ServiceManagerProtocol = ServiceManager()
    var sessionManager : DatabaseManagerProtocol?

    
    let sectionInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 2.0, right: 0.0)
    let itemsPerRow: CGFloat = 1
    private let reuseIdentifier = "regionsCell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchWeatherData()
        sessionManager = SessionManager.sharedInstance
    }
    
    @IBAction func shareClicked(_ sender: UIBarButtonItem) {
        //TODO -> Dialog warning not all data downloaded yet /or disable/enable button
        if (sessionManager?.regionEntities.count)! < 4 {
            print("< 4")
            return
        }
        createCSVFile()
    }
    
    
    func createCSVFile() {
        
        let defaultNegativeValue  = -273
        let fileName = "WeatherData.csv"
        let path = NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(fileName)
        var csvText = ""
        
         for region in (sessionManager?.regionEntities)! {
            
            for maxTemp in region.maxTemps {
                for month in maxTemp.months {
                    var valueString = ""
                    if Int(month.value) == defaultNegativeValue {
                        valueString = "n\\a"
                    } else {
                        valueString = "\(month.value)"
                    }
                    let newLine = "\(region.name), Max Temp \(maxTemp.year ?? 0), \(month.name), \(valueString)\n "
                    csvText.append(newLine)
                }
                
                for season in maxTemp.seasons {
                    var valueString = ""
                    if Int(season.value) == defaultNegativeValue {
                        valueString = "n\\a"
                    } else {
                        valueString = "\(season.value)"
                    }
                    let newLine = "\(region.name), Max Temp \(maxTemp.year ?? 0), \(season.name), \(valueString)\n "
                    csvText.append(newLine)
                }
                
                var valueString = "n\\a"
                if let annual = (maxTemp.annual.flatMap {$0}) {
                    if !(Int(annual) == defaultNegativeValue) {
                        valueString = "\(annual)"
                    }
                }
                let newLine = "\(region.name), Max Temp \(maxTemp.year ?? 0), ANN, \(valueString)\n"
                csvText.append(newLine)
            }
            
            for minTemp in region.minTemps {
                for month in minTemp.months {
                    var valueString = ""
                    if Int(month.value) == defaultNegativeValue {
                        valueString = "n\\a"
                    } else {
                        valueString = "\(month.value)"
                    }
                    let newLine = "\(region.name), Min Temp \(minTemp.year ?? 0), \(month.name), \(valueString)\n "
                    csvText.append(newLine)
                }
                
                for season in minTemp.seasons {
                    var valueString = ""
                    if Int(season.value) == defaultNegativeValue {
                        valueString = "n\\a"
                    } else {
                        valueString = "\(season.value)"
                    }
                    let newLine = "\(region.name), Min Temp \(minTemp.year ?? 0), \(season.name), \(valueString)\n "
                    csvText.append(newLine)
                }
                
                var valueString = "n\\a"
                if let annual = (minTemp.annual.flatMap {$0}) {
                    if !(Int(annual) == defaultNegativeValue) {
                        valueString = "\(annual)"
                    }
                }
                let newLine = "\(region.name), Min Temp \(minTemp.year ?? 0), ANN, \(valueString)\n"
                csvText.append(newLine)
            }
            
            for meanTemp in region.meanTemps {
                for month in meanTemp.months {
                    var valueString = ""
                    if Int(month.value) == defaultNegativeValue {
                        valueString = "n\\a"
                    } else {
                        valueString = "\(month.value)"
                    }
                    let newLine = "\(region.name), Mean Temp \(meanTemp.year ?? 0), \(month.name), \(valueString)\n "
                    csvText.append(newLine)
                }
                
                for season in meanTemp.seasons {
                    var valueString = ""
                    if Int(season.value) == defaultNegativeValue {
                        valueString = "n\\a"
                    } else {
                        valueString = "\(season.value)"
                    }
                    let newLine = "\(region.name), Mean Temp \(meanTemp.year ?? 0), \(season.name), \(valueString)\n "
                    csvText.append(newLine)
                }
                
                var valueString = "n\\a"
                if let annual = (meanTemp.annual.flatMap {$0}) {
                    if !(Int(annual) == defaultNegativeValue) {
                        valueString = "\(annual)"
                    }
                }
                let newLine = "\(region.name), Mean Temp \(meanTemp.year ?? 0), ANN, \(valueString)\n"
                csvText.append(newLine)
            }
            
            for rain in region.rainfalls {
                for month in rain.months {
                    var valueString = ""
                    if Int(month.value) == defaultNegativeValue {
                        valueString = "n\\a"
                    } else {
                        valueString = "\(month.value)"
                    }
                    let newLine = "\(region.name), Rainfall \(rain.year ?? 0), \(month.name), \(valueString)\n "
                    csvText.append(newLine)
                }
                
                for season in rain.seasons {
                    var valueString = ""
                    if Int(season.value) == defaultNegativeValue {
                        valueString = "n\\a"
                    } else {
                        valueString = "\(season.value)"
                    }
                    let newLine = "\(region.name), Rainfall \(rain.year ?? 0), \(season.name), \(valueString)\n "
                    csvText.append(newLine)
                }
                
                
                var valueString = "n\\a"
                if let annual = (rain.annual.flatMap {$0}) {
                    if !(Int(annual) == defaultNegativeValue) {
                        valueString = "\(annual)"
                    }
                }
                let newLine = "\(region.name), Rainfall \(rain.year ?? 0), ANN, \(valueString)\n"
                csvText.append(newLine)
            }
            
            for sun in region.sunshines {
                for month in sun.months {
                    var valueString = ""
                    if Int(month.value) == defaultNegativeValue {
                        valueString = "n\\a"
                    } else {
                        valueString = "\(month.value)"
                    }
                    let newLine = "\(region.name), Sunshine \(sun.year ?? 0), \(month.name), \(valueString)\n "
                    csvText.append(newLine)
                }
                
                for season in sun.seasons {
                    var valueString = ""
                    if Int(season.value) == defaultNegativeValue {
                        valueString = "n\\a"
                    } else {
                        valueString = "\(season.value)"
                    }
                    let newLine = "\(region.name), Sunshine \(sun.year ?? 0), \(season.name), \(valueString)\n "
                    csvText.append(newLine)
                }
                
                var valueString = "n\\a"
                if let annual = (sun.annual.flatMap {$0}) {
                    if !(Int(annual) == defaultNegativeValue) {
                        valueString = "\(annual)"
                    }
                }
                let newLine = "\(region.name), Sunshine \(sun.year ?? 0), ANN, \(valueString)\n"
                
                    
                csvText.append(newLine)
            }
            
            do {
                if let filePath = path {
                    try csvText.write(to: filePath, atomically: true, encoding: String.Encoding.utf8)
                    
                    let vc = UIActivityViewController(activityItems: [filePath], applicationActivities: [])
                    present(vc, animated: true, completion: nil)
                    
                    vc.excludedActivityTypes = [
                        UIActivityType.assignToContact,
                        UIActivityType.saveToCameraRoll,
                        UIActivityType.postToFlickr,
                        UIActivityType.postToVimeo,
                        UIActivityType.postToTencentWeibo,
                        UIActivityType.postToTwitter,
                        UIActivityType.postToFacebook,
                        UIActivityType.openInIBooks
                    ]
                    
                    present(vc, animated: true, completion: nil)
                }
            } catch {
                print("Failed to create file with error \(error)")
            }
        }
    }
    
    
    func fetchWeatherData() {
            for region in 0...Regions.count {
                if let mRegion = Regions(rawValue: region) {
                    serviceManager.getRegionsData(region: mRegion, handler: { [weak self] error in
                        if let _ = error {
                            self?.showAlert(viewController: self!, title: "Network Error", message: "Not all results may have been retrieved ")
                        } else {
                            self?.regionsCollectionView.reloadData()
                        }
                    })
                }
            }
    }
        
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (sessionManager?.regionEntities.count)!
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = regionsCollectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! RegionsCollectionViewCell

        let region = sessionManager?.regionEntities[indexPath.row]
        cell.regionsLabel?.text = region?.name
        
        if let meanTemp = region?.meanTemps.last?.annual {
            cell.meanTempLabel.text = String(meanTemp) + "\'C"
        } else {
            cell.meanTempLabel.text = "N/A"
        }
        if let maxTemp = region?.maxTemps.last?.annual {
            cell.highTempLabel.text = String(maxTemp) + "\'C"
        } else {
            cell.highTempLabel.text = "N/A"
        }
        if let minTemp = region?.minTemps.last?.annual {
            cell.lowTempLabel.text = String(minTemp) + "\'C"
        } else {
            cell.lowTempLabel.text = "N/A"
        }
        if let sunshine = region?.sunshines.last?.annual {
            cell.sunshineValueLabel.text = String(sunshine)
        } else {
            cell.sunshineValueLabel.text = "N/A"
        }
        if let rainfall = region?.rainfalls.last?.annual {
            cell.rainfallValueLabel.text = String(rainfall)
        } else {
            cell.rainfallValueLabel.text = "N/A"
        }
        
        cell.spinnerIndicator.hidesWhenStopped = true
            
            return cell
   
    }

    var regionChoice : RegionEntity?
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let region = sessionManager?.regionEntities[indexPath.row]
        regionChoice = region
        performSegue(withIdentifier: "regionShow", sender: self)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "regionShow") {
            if let regionViewController = segue.destination as? RegionViewController {
                if let region = regionChoice {
                    regionViewController.region = region
                }
            }
        }
    }
    

    //TODO: - Add a retry & Add to UIViewController extension
    func showAlert(viewController : UIViewController, title : String, message : String) {
        let alertAction:UIAlertAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default) { (UIAlertAction) -> Void in
            viewController.dismiss(animated: true, completion: { () -> Void in
            })
        }
        let alertView:UIAlertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alertView.addAction(alertAction)
        viewController.present(alertView, animated: true, completion: { () -> Void in
            
        })
    }
    

}
