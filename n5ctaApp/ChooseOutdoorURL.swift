//
//  ChooseURL.swift
//  n5ctaApp
//
//  Created by Maeve McCoy on 7/21/17.
//  Copyright © 2017 Maeve McCoy. All rights reserved.
//

import Foundation

class ChooseOutdoorURL {
    
    func chooseURL(event: String, gender: String, category: String) -> URL {
        let url: URL!
        switch (event,gender,category) {
        case ("100 MH (30 in)", "Girls", "Track"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1k8LliY2OG7cta2SePgiffoY8kfDyA-xAFvhWt0VExOM/values/100MH%2030%22?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("200 MH", "Girls", "Track"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1k8LliY2OG7cta2SePgiffoY8kfDyA-xAFvhWt0VExOM/values/200MH?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("100y", "Girls", "Track"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1FbWjkOp1_hZErA71LBTBcf00DnNhSu-j-ETMlkHpxck/values/100%20Yds?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("220y", "Girls", "Track"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1FbWjkOp1_hZErA71LBTBcf00DnNhSu-j-ETMlkHpxck/values/220%20Yds?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("Mile", "Girls", "Track"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1FbWjkOp1_hZErA71LBTBcf00DnNhSu-j-ETMlkHpxck/values/Mile?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("2 Mile", "Girls", "Track"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1FbWjkOp1_hZErA71LBTBcf00DnNhSu-j-ETMlkHpxck/values/2%20Mile?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("100 MH", "Girls", "Track"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1k8LliY2OG7cta2SePgiffoY8kfDyA-xAFvhWt0VExOM/values/100MH?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("300 MH", "Girls", "Track"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1k8LliY2OG7cta2SePgiffoY8kfDyA-xAFvhWt0VExOM/values/300MH?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("400 MH", "Girls", "Track"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1k8LliY2OG7cta2SePgiffoY8kfDyA-xAFvhWt0VExOM/values/400MH?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("100", "Girls", "Track"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1k8LliY2OG7cta2SePgiffoY8kfDyA-xAFvhWt0VExOM/values/100M?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("200", "Girls", "Track"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1k8LliY2OG7cta2SePgiffoY8kfDyA-xAFvhWt0VExOM/values/200M?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("400", "Girls", "Track"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1k8LliY2OG7cta2SePgiffoY8kfDyA-xAFvhWt0VExOM/values/400M?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("800", "Girls", "Track"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1k8LliY2OG7cta2SePgiffoY8kfDyA-xAFvhWt0VExOM/values/800M?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("1500", "Girls", "Track"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1k8LliY2OG7cta2SePgiffoY8kfDyA-xAFvhWt0VExOM/values/1500M?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("1600", "Girls", "Track"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1k8LliY2OG7cta2SePgiffoY8kfDyA-xAFvhWt0VExOM/values/1600M?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("3000", "Girls", "Track"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1k8LliY2OG7cta2SePgiffoY8kfDyA-xAFvhWt0VExOM/values/3000M?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("3200", "Girls", "Track"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1k8LliY2OG7cta2SePgiffoY8kfDyA-xAFvhWt0VExOM/values/3200M?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("5000", "Girls", "Track"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1k8LliY2OG7cta2SePgiffoY8kfDyA-xAFvhWt0VExOM/values/5000M?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("110 MH", "Boys", "Track"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1w4Nd4QCngZujCFbEDgqRyu0JG4baTyPDYx_i0kWiXVQ/values/110MH?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("300 MH", "Boys", "Track"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1w4Nd4QCngZujCFbEDgqRyu0JG4baTyPDYx_i0kWiXVQ/values/300MH?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("400 MH", "Boys", "Track"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1w4Nd4QCngZujCFbEDgqRyu0JG4baTyPDYx_i0kWiXVQ/values/400MH?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("100", "Boys", "Track"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1w4Nd4QCngZujCFbEDgqRyu0JG4baTyPDYx_i0kWiXVQ/values/100M?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("200", "Boys", "Track"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1w4Nd4QCngZujCFbEDgqRyu0JG4baTyPDYx_i0kWiXVQ/values/200M?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("400", "Boys", "Track"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1w4Nd4QCngZujCFbEDgqRyu0JG4baTyPDYx_i0kWiXVQ/values/400M?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("800", "Boys", "Track"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1w4Nd4QCngZujCFbEDgqRyu0JG4baTyPDYx_i0kWiXVQ/values/800M?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("1500", "Boys", "Track"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1w4Nd4QCngZujCFbEDgqRyu0JG4baTyPDYx_i0kWiXVQ/values/1500M?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("1600", "Boys", "Track"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1w4Nd4QCngZujCFbEDgqRyu0JG4baTyPDYx_i0kWiXVQ/values/1600M?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("Mile", "Boys", "Track"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1WIFAj159pg7lpB3G-u57ZCC_rmcwg8cIUz8UHouT6mg/values/Mile?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("2 Mile", "Boys", "Track"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1WIFAj159pg7lpB3G-u57ZCC_rmcwg8cIUz8UHouT6mg/values/2%20Mile?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("2K Steeple", "Boys", "Track"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1w4Nd4QCngZujCFbEDgqRyu0JG4baTyPDYx_i0kWiXVQ/values/2K%20Steeple?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("3000", "Boys", "Track"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1w4Nd4QCngZujCFbEDgqRyu0JG4baTyPDYx_i0kWiXVQ/values/3000M?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("3200", "Boys", "Track"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1w4Nd4QCngZujCFbEDgqRyu0JG4baTyPDYx_i0kWiXVQ/values/3200M?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("5000", "Boys", "Track"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1w4Nd4QCngZujCFbEDgqRyu0JG4baTyPDYx_i0kWiXVQ/values/5000M?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("High Jump", "Girls", "Field"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1Q261mKmcHpKbdCd-g6p6oH8l1GLLHKC05aT_VATc5SI/values/High%20Jump?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("Long Jump", "Girls", "Field"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1Q261mKmcHpKbdCd-g6p6oH8l1GLLHKC05aT_VATc5SI/values/Long%20Jump?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("Triple Jump", "Girls", "Field"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1Q261mKmcHpKbdCd-g6p6oH8l1GLLHKC05aT_VATc5SI/values/Triple%20Jump?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("Pole Vault", "Girls", "Field"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1Q261mKmcHpKbdCd-g6p6oH8l1GLLHKC05aT_VATc5SI/values/Pole%20Vault?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("Shot Put", "Girls", "Field"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1Q261mKmcHpKbdCd-g6p6oH8l1GLLHKC05aT_VATc5SI/values/Shot%20Put?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("Discus", "Girls", "Field"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1Q261mKmcHpKbdCd-g6p6oH8l1GLLHKC05aT_VATc5SI/values/Discus?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("Shot Put (8 lb)", "Girls", "Field"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1Q261mKmcHpKbdCd-g6p6oH8l1GLLHKC05aT_VATc5SI/values/Shot%20Put%208%20lbs.?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("Hammer Throw", "Girls", "Field"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1Q261mKmcHpKbdCd-g6p6oH8l1GLLHKC05aT_VATc5SI/values/Hammer%20Throw?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("Javelin", "Girls", "Field"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1Q261mKmcHpKbdCd-g6p6oH8l1GLLHKC05aT_VATc5SI/values/Javelin?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("High Jump", "Boys", "Field"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1qFL3Mbot76Xkt1QbEYWd6JYWx5BdbP3_44f8R5QqYtY/values/High%20Jump?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("Long Jump", "Boys", "Field"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1qFL3Mbot76Xkt1QbEYWd6JYWx5BdbP3_44f8R5QqYtY/values/Long%20Jump?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("Triple Jump", "Boys", "Field"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1qFL3Mbot76Xkt1QbEYWd6JYWx5BdbP3_44f8R5QqYtY/values/Triple%20Jump?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("Pole Vault", "Boys", "Field"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1qFL3Mbot76Xkt1QbEYWd6JYWx5BdbP3_44f8R5QqYtY/values/Pole%20Vault?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("Shot Put", "Boys", "Field"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1qFL3Mbot76Xkt1QbEYWd6JYWx5BdbP3_44f8R5QqYtY/values/Shot%20Put?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("Discus", "Boys", "Field"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1qFL3Mbot76Xkt1QbEYWd6JYWx5BdbP3_44f8R5QqYtY/values/Discus?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("Javelin", "Boys", "Field"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1qFL3Mbot76Xkt1QbEYWd6JYWx5BdbP3_44f8R5QqYtY/values/Javelin?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        default:
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1k8LliY2OG7cta2SePgiffoY8kfDyA-xAFvhWt0VExOM/values/100MH%2030%22?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        }
        return url
    }
}
