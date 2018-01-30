//
//  ServiceManager.swift
//  WeatherDataDemo
//
//  Created by Fong Bao on 25/01/2018.
//  Copyright © 2018 Fong Bao. All rights reserved.
//

import Foundation
import Alamofire


class ServiceManager : ServiceManagerProtocol {
    
    typealias TaggedToken = (String, String?)
    var defaultYear = 1970
    var sessionManager : DatabaseManagerProtocol
    
    init() {
        sessionManager = SessionManager.sharedInstance
    }
    
    func getRegionsData(region : Regions, handler : @escaping (NetworkError?) -> Void) {
        for val in 0...DataValues.count {
            if let value = DataValues(rawValue: val) {
                getData(region: region, dataValue: value, urlString: region.regionEndpoint(val: value.urlDescription), handler: { error in
                    handler(error)
                })
            }
        }
    }
    
    //TODO : Last updated 02/01/2018. -> check and escape of no change
    func getData(region : Regions, dataValue : DataValues, urlString : String, handler : @escaping (NetworkError?) -> Void) {
        
        Alamofire.request(urlString).responseString { [weak self] response in
            
            var parseDefaultYear = self?.defaultYear
            
            if let error = response.result.error as? AFError{
                print("request errored error.responseCode is \(String(describing: error.responseCode)) ... error.errorDescription is \(String(describing: error.errorDescription))")
                handler(NetworkError.networkError)
                
            } else if response.result.isSuccess, let responseData = response.result.value {
                
                let lines = responseData.components(separatedBy: .newlines)
                startYearIndex: for (index, line) in lines.enumerated() {
                    
                    let lineValues = line.components(separatedBy: " ").filter{$0.count > 0 }
                    if line.range(of: "starting from") != nil {
                        if let year = self?.getDateFrom(line: line) {
                            parseDefaultYear = year
                        }
                    }
                    
                    for (lineIndex, element) in lineValues.enumerated() {
                        if lineIndex == 0 && Int(element) == parseDefaultYear {
                            self?.parseYearLines(passedRegion: region, dataValue: dataValue,line: Array(lines[index...lines.count-1]), handler: {
                                handler(nil)
                            })
                            break startYearIndex
                        }
                    }
                }
                
            } else {
                print("Invalid response. Result is \(response.result)")
                handler(NetworkError.networkError)
            }
        }
    }
    
    
        func parseYearLines(passedRegion : Regions, dataValue : DataValues, line : [String], handler : @escaping () -> Void) {

            guard let regionEntity = sessionManager.regionEntities.filter({$0.name == passedRegion.displayDescription}).first else {
                return
            }
            
        switch dataValue {
        case.Tmax:
            regionEntity.maxTemps.removeAll()
        case .Tmin:
            regionEntity.minTemps.removeAll()
        case .Tmean:
            regionEntity.meanTemps.removeAll()
        case .Sunshine:
            regionEntity.sunshines.removeAll()
        case .Rainfall:
            regionEntity.rainfalls.removeAll()
        }
        
        
        for content in line {//here or above

            let lineValues = content.components(separatedBy: " ").filter{$0.count > 0 }
            if lineValues.isEmpty {
                continue
            }
            
            switch dataValue {
            case.Tmax:
                regionEntity.maxTemps.append(self.populateDataValues(withValue :MaxTemp(),line : lineValues))
            case .Tmin:
                regionEntity.minTemps.append(self.populateDataValues(withValue :MinTemp(), line : lineValues))
            case .Tmean:
                regionEntity.meanTemps.append(self.populateDataValues(withValue :MeanTemp(),line : lineValues))
            case .Sunshine:
                regionEntity.sunshines.append(self.populateDataValues(withValue :Sunshine(),line : lineValues))
            case .Rainfall:
                regionEntity.rainfalls.append(self.populateDataValues(withValue :Rainfall(),line : lineValues))
            }
        }
        
            handler()

    }
    
    
    func populateDataValues<U : DataEntityProtocol> (withValue : U, line : [String]) -> DataEntityProtocol {
        
        var dataValue = withValue
        
        for (index, element) in line.enumerated() {
            switch index {
            case 0:
                if let value = Int(element) {
                    dataValue.year = value
                }
            case 1:
                if let value = Double(element) {
                    let month = Month(name : "Jan", value : value)
                    dataValue.months.append(month)
                } else {
                    let month = Month(name : "Jan", value : -273)
                    dataValue.months.append(month)
                }
            case 2:
                if let value = Double(element) {
                    let month = Month(name : "Feb", value : value)
                    dataValue.months.append(month)
                }else {
                    let month = Month(name : "Feb", value : -273)
                    dataValue.months.append(month)
                }
            case 3:
                if let value = Double(element) {
                    let month = Month(name : "Mar", value : value)
                    dataValue.months.append(month)
                }else {
                    let month = Month(name : "Mar", value : -273)
                    dataValue.months.append(month)
                }
            case 4:
                if let value = Double(element) {
                    let month = Month(name : "Apr", value : value)
                    dataValue.months.append(month)
                } else {
                    let month = Month(name : "Apr", value : -273)
                    dataValue.months.append(month)
                }
            case 5:
                if let value = Double(element) {
                    let month = Month(name : "May", value : value)
                    dataValue.months.append(month)
                }else {
                    let month = Month(name : "May", value : -273)
                    dataValue.months.append(month)
                }
            case 6:
                if let value = Double(element) {
                    let month = Month(name : "Jun", value : value)
                    dataValue.months.append(month)
                }else {
                    let month = Month(name : "Jun", value : -273)
                    dataValue.months.append(month)
                }
            case 7:
                if let value = Double(element) {
                    let month = Month(name : "Jul", value : value)
                    dataValue.months.append(month)
                }else {
                    let month = Month(name : "Jul", value : -273)
                    dataValue.months.append(month)
                }
            case 8:
                if let value = Double(element) {
                    let month = Month(name : "Aug", value : value)
                    dataValue.months.append(month)
                }else {
                    let month = Month(name : "Aug", value : -273)
                    dataValue.months.append(month)
                }
            case 9:
                if let value = Double(element) {
                    let month = Month(name : "Sep", value : value)
                    dataValue.months.append(month)
                }else {
                    let month = Month(name : "Sep", value : -273)
                    dataValue.months.append(month)
                }
            case 10:
                if let value = Double(element) {
                    let month = Month(name : "Oct", value : value)
                    dataValue.months.append(month)
                }else {
                    let month = Month(name : "Oct", value : -273)
                    dataValue.months.append(month)
                }
            case 11:
                if let value = Double(element) {
                    let month = Month(name : "Nov", value : value)
                    dataValue.months.append(month)
                }else {
                    let month = Month(name : "Nov", value : -273)
                    dataValue.months.append(month)
                }
            case 12:
                if let value = Double(element) {
                    let month = Month(name : "Dec", value : value)
                    dataValue.months.append(month)
                }else {
                    let month = Month(name : "Dec", value : -273)
                    dataValue.months.append(month)
                }
            case 13:
                if let value = Double(element) {
                    let season = Season(name : "Win", value : value)
                    dataValue.seasons.append(season)
                } else {
                    let month = Month(name : "Win", value : -273)
                    dataValue.months.append(month)
                }
            case 14:
                if let value = Double(element) {
                    let season = Season(name : "Spr", value : value)
                    dataValue.seasons.append(season)
                } else {
                    let month = Month(name : "Spr", value : -273)
                    dataValue.months.append(month)
                }
            case 15:
                if let value = Double(element) {
                    let season = Season(name : "Sum", value : value)
                    dataValue.seasons.append(season)
                } else {
                    let month = Month(name : "Sum", value : -273)
                    dataValue.months.append(month)
                }
            case 16:
                if let value = Double(element) {
                    let season = Season(name : "Aut", value : value)
                    dataValue.seasons.append(season)
                } else {
                    let month = Month(name : "Aut", value : -273)
                    dataValue.months.append(month)
                }
            case 17:
                if let value = Double(element) {
                    dataValue.annual = value
                } else {
                     dataValue.annual = -273
                }
                
            default:
                print("unknown value")
                continue
            }
        }
        return dataValue
        
    }
    
    
    
    func getDateFrom(line : String) -> Int {

        var dateToReturn = defaultYear
         let pos = partOfSpeech(text: line)
        
        for taggedToken in pos {
            if let posDesc = taggedToken.1 {
                let word = taggedToken.0
                if posDesc.contains("Number") {
                    if let year = Int(word) {   //Assumption looking for year so is Int
                        dateToReturn = year
                    }
                }
            }
            }
        
        return dateToReturn
    }
    
    func partOfSpeech(text: String) -> [TaggedToken] {
        return tag(text: text, scheme: NSLinguisticTagSchemeLexicalClass)
    }
    

    
    func tag(text: String, scheme: String) -> [TaggedToken] {
        let options: NSLinguisticTagger.Options = [.omitWhitespace, .omitPunctuation, .omitOther]
        let tagger = NSLinguisticTagger(tagSchemes: NSLinguisticTagger.availableTagSchemes(forLanguage: "en"), options: Int(options.rawValue))
        tagger.string = text
        var tokens: [TaggedToken] = []
        if #available(iOS 11.0, *) {
            tagger.setOrthography(NSOrthography.defaultOrthography(forLanguage: "en"), range: NSRange(location: 0, length: text.count))
        } else {
            tagger.setOrthography(NSOrthography.init(dominantScript: "Latin", languageMap: ["Latn" : ["en"]]), range: NSRange(location: 0, length: text.count))
        }
        tagger.enumerateTags(in: NSRange(location: 0, length: text.count), scheme:scheme, options: options) { tag, tokenRange, _, _ in
            let token = (text as NSString).substring(with: tokenRange)
            tokens.append((token, tag))
        }
        return tokens
    }
    
    
    
    
    
    
    

    


}
