//
//  PickerDictionary.swift
//  n5ctaApp
//
//  Created by Maeve McCoy on 7/5/17.
//  Copyright © 2017 Maeve McCoy. All rights reserved.
//

import Foundation

class ListLogicModel {
    func seasonValues() -> [String] {
        return ["Outdoor", "Cross Country"]
    }
    
    func genderValues() -> [String] {
        return ["Girls", "Boys"]
    }
    
    func categoryValues() -> [String] {
        return ["Meter", "Field"]
    }
    
    
    // TODO: add more combinations
    func eventValues(season: String, gender: String, category: String) -> [String] {
        if season == "Outdoor", gender == "Girls", category == "Meter" {
            return ["100 MH (30 in)", "200 MH", "100 MH", "300 MH", "400 MH", "100", "200", "400", "800", "1500", "1600", "3000", "3200", "5000"]
        } else if season == "Outdoor" && gender == "Boys" && category == "Meter" {
            return ["110 MH", "300 MH", "400 MH", "100", "200", "400", "800", "1500", "1600", "2K Steeple", "3000", "3200", "5000"]
        } else if season == "Outdoor" && gender == "Girls" && category == "Field" {
            return ["High Jump", "Long Jump", "Triple Jump", "Pole Vault", "Shot Put", "Shot Put (8 lb)", "Discus",  "Hammer Throw", "Javelin"]
        } else if season == "Outdoor" && gender == "Boys" && category == "Field" {
            return ["High Jump", "Long Jump", "Triple Jump", "Pole Vault", "Shot Put", "Discus", "Javelin"]
        } else if season == "Outdoor" && (gender == "Girls" || gender == "Boys") && category == "Relay" {
            return ["Shuttle Hurdles", "4x100", "4x200", "4x400", "Sprint Medley", "4X800", "Distance Medley", "4x1600", "High Jump", "Long Jump", "Triple Jump", "Pole Vault", "Shot Put", "Discus"]
        } else if season == "Cross Country" {
            return ["Bellevue", "Brandywine Creek", "Brandywine Creek pre-2010", "Killens Pond", "Van Cortlandt Park", "White Clay Creek", "Fastest 5K"]
        } else {
            return ["1"]
        }
    }
}
