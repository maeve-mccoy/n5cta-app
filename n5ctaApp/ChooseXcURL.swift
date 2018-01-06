//
//  ChooseXcURL.swift
//  n5ctaApp
//
//  Created by Maeve McCoy on 8/8/17.
//  Copyright © 2017 Maeve McCoy. All rights reserved.
//

import Foundation

class ChooseXcURL {
    
    func chooseURL(gender: String, event: String) -> URL {
        let url: URL!
        switch (gender, event) {
        case ("Girls", "Fastest 5K"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1Vd7K9x_M_6wRqRUEbNR_I1sEF2lfcKC4m5HY9-zovn4/values/Girls%20Fastest%205k?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("Boys", "Fastest 5K"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1Vd7K9x_M_6wRqRUEbNR_I1sEF2lfcKC4m5HY9-zovn4/values/Boys%20Fastest%205k?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("Girls", "Bellevue"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1Vd7K9x_M_6wRqRUEbNR_I1sEF2lfcKC4m5HY9-zovn4/values/Girls%20Bellevue?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("Girls", "Brandywine Creek"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1Vd7K9x_M_6wRqRUEbNR_I1sEF2lfcKC4m5HY9-zovn4/values/Girls%20Brandywine%20Creek?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("Girls", "Brandywine Creek pre-2010"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1Vd7K9x_M_6wRqRUEbNR_I1sEF2lfcKC4m5HY9-zovn4/values/Girls%20Brandywine%20Creek%20pre-2010?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("Girls", "Killens Pond"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1Vd7K9x_M_6wRqRUEbNR_I1sEF2lfcKC4m5HY9-zovn4/values/Girls%20Killens%20Pond?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("Girls", "White Clay Creek"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1Vd7K9x_M_6wRqRUEbNR_I1sEF2lfcKC4m5HY9-zovn4/values/Girls%20White%20Clay%20Creek?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("Girls", "Van Cortlandt Park"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1Vd7K9x_M_6wRqRUEbNR_I1sEF2lfcKC4m5HY9-zovn4/values/Girls%20Van%20Cortlandt%20Park?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("Boys", "Bellevue"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1Vd7K9x_M_6wRqRUEbNR_I1sEF2lfcKC4m5HY9-zovn4/values/Boys%20Bellevue?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("Boys", "Brandywine Creek"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1Vd7K9x_M_6wRqRUEbNR_I1sEF2lfcKC4m5HY9-zovn4/values/Boys%20Brandywine%20Creek?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("Boys", "Brandywine Creek pre-2010"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1Vd7K9x_M_6wRqRUEbNR_I1sEF2lfcKC4m5HY9-zovn4/values/Boys%20Brandywine%20Creek%20pre-2010?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("Boys", "Killens Pond"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1Vd7K9x_M_6wRqRUEbNR_I1sEF2lfcKC4m5HY9-zovn4/values/Boys%20Killens%20Pond?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("Boys", "White Clay Creek"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1Vd7K9x_M_6wRqRUEbNR_I1sEF2lfcKC4m5HY9-zovn4/values/Boys%20White%20Clay%20Creek?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("Boys", "Van Cortlandt Park"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1Vd7K9x_M_6wRqRUEbNR_I1sEF2lfcKC4m5HY9-zovn4/values/Boys%20Van%20Cortlandt%20Park?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        default:
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1Vd7K9x_M_6wRqRUEbNR_I1sEF2lfcKC4m5HY9-zovn4/values/Girls%20Bellevue?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        }
        return url
    }
    
}
