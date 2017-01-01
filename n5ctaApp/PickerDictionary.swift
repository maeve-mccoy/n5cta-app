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
        return ["Cross Country", "Indoor", "Outdoor"]
    }
    
    func genderValues() -> [String] {
        return ["Girls", "Boys"]
    }
    
    func categoryValues() -> [String] {
        return ["Track", "Field"]
    }
    
    
    // TODO: add more combinations
    func eventValues(season: String, gender: String, category: String) -> [String] {
        if season == "Outdoor", gender == "Girls", category == "Track" {
            return ["100y", "100", "100 MH (30 in)", "100 MH", "220y", "200", "200 MH", "300 MH", "400", "400 MH", "800", "1500", "1600", "Mile", "3000", "3200", "2 Mile", "5000"]
        } else if season == "Outdoor" && gender == "Boys" && category == "Track" {
            return ["110 MH", "300 MH", "400 MH", "100", "200", "400", "800", "1500", "1600", "Mile", "2K Steeple", "3000", "3200", "2 Mile", "5000"]
        } else if season == "Outdoor" && gender == "Girls" && category == "Field" {
            return ["High Jump", "Long Jump", "Triple Jump", "Pole Vault", "Shot Put", "Shot Put (8 lb)", "Discus",  "Hammer Throw", "Javelin"]
        } else if season == "Outdoor" && gender == "Boys" && category == "Field" {
            return ["High Jump", "Long Jump", "Triple Jump", "Pole Vault", "Shot Put", "Discus", "Javelin"]
        } else if season == "Outdoor" && (gender == "Girls" || gender == "Boys") && category == "Relay" {
            return ["Shuttle Hurdles", "4x100", "4x200", "4x400", "Sprint Medley", "4X800", "Distance Medley", "4x1600", "High Jump", "Long Jump", "Triple Jump", "Pole Vault", "Shot Put", "Discus"]
        } else if season == "Cross Country" {
            return ["Bellevue", "Brandywine Creek", "Brandywine Creek pre-2010", "Killens Pond", "Van Cortlandt Park", "White Clay Creek", "Fastest 5K"]
        } else if season == "Indoor", gender == "Girls", category == "Track" {
            return ["55 MH (30 in)", "55 MH", "60 MH", "55", "60", "200", "300", "300y", "400", "500", "600y", "600", "880y", "800", "1000y", "1000", "1500", "1600", "Mile", "3000", "3200", "2 Mile", "5000"]
        } else if season == "Indoor", gender == "Boys", category == "Track" {
            return ["50y", "55 MH", "60 MH", "55", "60", "200", "300y", "300", "440y", "400", "500", "600", "880y", "800", "1000", "1500", "1600", "Mile", "3000", "3200", "2 Mile", "5000"]
        } else if season == "Indoor" && gender == "Girls" && category == "Field" {
            return ["High Jump", "Long Jump", "Triple Jump", "Pole Vault", "Shot Put", "Weight Throw"]
        } else if season == "Indoor" && gender == "Boys" && category == "Field" {
            return ["High Jump", "Long Jump", "Triple Jump", "Pole Vault", "Shot Put", "Weight Throw"]
        } else {
            return ["1"]
        }
    }
}
