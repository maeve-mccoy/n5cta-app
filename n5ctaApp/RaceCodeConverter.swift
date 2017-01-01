//
//  RaceCodeConverter.swift
//  n5ctaApp
//
//  Created by Maeve McCoy on 4/20/18.
//  Copyright © 2018 Maeve McCoy. All rights reserved.
//

import Foundation
import UIKit

class RaceCodeConverter {
    var raceDetails: [String] = []
    var place: String = "";
    var combinedRaceDetails: String = "";
    
    func convertCode(raceCode: String, event: String) -> String {
        if raceCode.range(of: "n") != nil {
            if let placeNumber = raceCode.index(of: "n") {
                self.place = String(raceCode[raceCode.index(after: placeNumber)..<raceCode.endIndex])
            }
            if self.place.suffix(1) == "2" {
                if self.place.suffix(2) == "12" {
                    raceDetails.append(self.place + "th place")
                } else {
                    raceDetails.append(self.place + "nd place")
                }
            } else if self.place.suffix(1) == "3" {
                if self.place.suffix(2) == "13" {
                    raceDetails.append(self.place + "th place")
                } else {
                    raceDetails.append(self.place + "rd place")
                }
            } else {
                raceDetails.append(self.place + "th place")
            }
        }
        if raceCode.range(of: "n") == nil {
            raceDetails.append("1st place")
        }
        if (raceCode.range(of: "t") != nil) {
            raceDetails.append("trial")
        }
        if (raceCode.range(of: "h") != nil) {
            raceDetails.append("heat")
        }
        if (raceCode.range(of: "y") != nil) {
            if (event == "200") {
                raceDetails.append("conv. from 220y")
            } else if (event == "1600") {
                raceDetails.append("conv. from mile")
            } else if (event == "3200") {
                raceDetails.append("conv. from 2 mile")
            } else {
                raceDetails.append("conv. from yards")
            }
        }
        if (raceCode.range(of: "er") != nil) {
            if (event == "1500") {
                raceDetails.append("en route to mile")
            } else if (event == "3000") {
                raceDetails.append("en route to 2 mile")
            } else if (event == "300") {
                raceDetails.append("en route to 400")
            }
            
        }
        if (raceCode.range(of: "fr") != nil) {
            raceDetails.append("freshman race")
        }
        if (raceCode.range(of: "fm") != nil) {
            raceDetails.append("freshman race")
        }
        if (raceCode.range(of: "cf") != nil) {
            raceDetails.append("consolation final")
        }
        if (raceCode.range(of: "s") != nil) {
            raceDetails.append("semi")
        }
        if (raceCode.range(of: "m") != nil) {
            if (event == "1600") {
                raceDetails.append("conv. from mile")
            } else {
                raceDetails.append("conv. to metric")
            }
        }
        if (raceCode.range(of: "b") != nil) {
            if (raceCode.range(of: "bb") != nil) {
                raceDetails.append("banked 160y track")
            } else {
                raceDetails.append("banked track")
            }
        }
        if (raceCode.range(of: "f") != nil) {
            raceDetails.append("flat track")
        }
        if (raceCode.range(of: "c") != nil) {
            if (event == "1600") {
                raceDetails.append("conv. from 1500")
            } else if (event == "3200") {
                raceDetails.append("conv. from 3000")
            } else {
                raceDetails.append("converted time")
            }
        }
        if (raceCode.range(of: "r") != nil) {
            if (event == "Shot Put") {
                raceDetails.append("rotation shot put")
            }
        }
        if (raceCode.range(of: "q") != nil) {
            raceDetails.append("qualifying round")
        }
        if (raceCode.range(of: "d") != nil) {
            raceDetails.append("dirt track")
        }
        if (raceCode.range(of: "a") != nil) {
            raceDetails.append("conv. to FAT")
        }
        combinedRaceDetails = combineRaceCodes(codeArray: raceDetails)
        return combinedRaceDetails
    }
    
    func combineRaceCodes(codeArray: [String]) -> String {
        let codeString = codeArray.joined(separator: ", ")
        return codeString
    }
}
