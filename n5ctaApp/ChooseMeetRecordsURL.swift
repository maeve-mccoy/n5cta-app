//
//  ChooseMeetRecordsURL.swift
//  n5ctaApp
//
//  Created by Maeve McCoy on 5/14/18.
//  Copyright © 2018 Maeve McCoy. All rights reserved.
//

import Foundation

class ChooseMeetRecordsURL {
    
    func chooseURL(gender: String, season: String, meet: String) -> URL {
        let url: URL!
        switch (gender, season, meet) {
        case ("Girls", "Outdoor", "State Meet"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1iUJsHZMuTDxLlHL71mnRhF9YycHi9bLP73MkY2lgBAw/values/Girls%20State%20Meet%20Records?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("Boys", "Outdoor", "State Meet"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1iUJsHZMuTDxLlHL71mnRhF9YycHi9bLP73MkY2lgBAw/values/Boys%20State%20Meet%20Records?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("Girls", "Outdoor", "Meet of Champions"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1qwYn-ms6x6bVqKzA6O4x8z_RXqChPONXRZDQKZaAwhs/values/Girls%20IF%20and%20MOC%20Records?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("Boys", "Outdoor", "Meet of Champions"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1qwYn-ms6x6bVqKzA6O4x8z_RXqChPONXRZDQKZaAwhs/values/Boys%20IF%20and%20MOC%20Records?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("Girls", "Outdoor", "Div. I State Meet"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1YVhoc1wmOiX7BRZ4Vj7hylNl_j_jY3s86rOgRPuuZ44/values/Girls%20Division%20I%20Records?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("Boys", "Outdoor", "Div. I State Meet"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1YVhoc1wmOiX7BRZ4Vj7hylNl_j_jY3s86rOgRPuuZ44/values/Boys%20Division%20I%20Records?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("Girls", "Outdoor", "Div. II State Meet"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1iGSH5itCHyn96hhrnTeYG1IqCJBiHO2TGAjUAWzq_Z4/values/Girls%20Division%20II%20Records?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("Boys", "Outdoor", "Div. II State Meet"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1iGSH5itCHyn96hhrnTeYG1IqCJBiHO2TGAjUAWzq_Z4/values/Boys%20Division%20II%20Records?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        default:
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1mG6CHr9A2XR_i-jZE6BVPATpBxYCE7T7a4V7v86ntTg/values/Girls%20State%20Records?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        }
        return url
    }
    
}

