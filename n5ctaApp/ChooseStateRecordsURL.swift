//
//  ChooseStateRecordsURL.swift
//  n5ctaApp
//
//  Created by Maeve McCoy on 2/4/18.
//  Copyright © 2018 Maeve McCoy. All rights reserved.
//

import Foundation

class ChooseStateRecordsURL {
    
    func chooseURL(gender: String, season: String) -> URL {
        let url: URL!
        switch (gender, season) {
        case ("Girls", "Outdoor"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1mG6CHr9A2XR_i-jZE6BVPATpBxYCE7T7a4V7v86ntTg/values/Girls%20State%20Records?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("Boys", "Outdoor"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1mG6CHr9A2XR_i-jZE6BVPATpBxYCE7T7a4V7v86ntTg/values/Boys%20State%20Records?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("Girls", "Indoor"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1tsEJePENscIfgVYTqhq994Bkuk9OUBt32S0oJHnDxE4/values/Girls?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("Boys", "Indoor"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1tsEJePENscIfgVYTqhq994Bkuk9OUBt32S0oJHnDxE4/values/Boys?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        default:
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1mG6CHr9A2XR_i-jZE6BVPATpBxYCE7T7a4V7v86ntTg/values/Girls%20State%20Records?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        }
        return url
    }
    
}

