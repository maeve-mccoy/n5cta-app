//
//  ChooseIndoorURL.swift
//  n5ctaApp
//
//  Created by Maeve McCoy on 1/6/18.
//  Copyright © 2018 Maeve McCoy. All rights reserved.
//

import Foundation

class ChooseIndoorURL {
    
    func chooseURL(event: String, gender: String, category: String) -> URL {
        let url: URL!
        switch (event,gender,category) {
        case ("55 MH (30 in)", "Girls", "Track"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1jBlLpoxoYWAmQMXNtotJ67iUifiMXlIO1uZ-vYqUUtw/values/55MH%2030%22?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("300y", "Girls", "Track"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1aKQcXZYp9NAmpABh1JwtVuI2_lCxwMfHOU2dpkX5C_4/values/300%20Yds?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("600y", "Girls", "Track"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1aKQcXZYp9NAmpABh1JwtVuI2_lCxwMfHOU2dpkX5C_4/values/600%20Yds?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("880y", "Girls", "Track"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1aKQcXZYp9NAmpABh1JwtVuI2_lCxwMfHOU2dpkX5C_4/values/880%20Yds?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("1000y", "Girls", "Track"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1aKQcXZYp9NAmpABh1JwtVuI2_lCxwMfHOU2dpkX5C_4/values/1000%20Yds?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("Mile", "Girls", "Track"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1aKQcXZYp9NAmpABh1JwtVuI2_lCxwMfHOU2dpkX5C_4/values/Mile?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("2 Mile", "Girls", "Track"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1aKQcXZYp9NAmpABh1JwtVuI2_lCxwMfHOU2dpkX5C_4/values/2%20Mile?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("55 MH", "Girls", "Track"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1jBlLpoxoYWAmQMXNtotJ67iUifiMXlIO1uZ-vYqUUtw/values/55MH?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("60 MH", "Girls", "Track"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1jBlLpoxoYWAmQMXNtotJ67iUifiMXlIO1uZ-vYqUUtw/values/60MH?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("55", "Girls", "Track"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1jBlLpoxoYWAmQMXNtotJ67iUifiMXlIO1uZ-vYqUUtw/values/55M?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("60", "Girls", "Track"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1jBlLpoxoYWAmQMXNtotJ67iUifiMXlIO1uZ-vYqUUtw/values/60M?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("200", "Girls", "Track"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1jBlLpoxoYWAmQMXNtotJ67iUifiMXlIO1uZ-vYqUUtw/values/200M?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("300", "Girls", "Track"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1jBlLpoxoYWAmQMXNtotJ67iUifiMXlIO1uZ-vYqUUtw/values/300M?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("400", "Girls", "Track"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1jBlLpoxoYWAmQMXNtotJ67iUifiMXlIO1uZ-vYqUUtw/values/400M?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("500", "Girls", "Track"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1jBlLpoxoYWAmQMXNtotJ67iUifiMXlIO1uZ-vYqUUtw/values/500M?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("600", "Girls", "Track"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1jBlLpoxoYWAmQMXNtotJ67iUifiMXlIO1uZ-vYqUUtw/values/600M?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("800", "Girls", "Track"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1jBlLpoxoYWAmQMXNtotJ67iUifiMXlIO1uZ-vYqUUtw/values/800M?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("1000", "Girls", "Track"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1jBlLpoxoYWAmQMXNtotJ67iUifiMXlIO1uZ-vYqUUtw/values/1000M?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("1500", "Girls", "Track"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1jBlLpoxoYWAmQMXNtotJ67iUifiMXlIO1uZ-vYqUUtw/values/1500M?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("1600", "Girls", "Track"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1jBlLpoxoYWAmQMXNtotJ67iUifiMXlIO1uZ-vYqUUtw/values/1600M?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("3000", "Girls", "Track"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1jBlLpoxoYWAmQMXNtotJ67iUifiMXlIO1uZ-vYqUUtw/values/3000M?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("3200", "Girls", "Track"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1jBlLpoxoYWAmQMXNtotJ67iUifiMXlIO1uZ-vYqUUtw/values/3200M?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("5000", "Girls", "Track"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1jBlLpoxoYWAmQMXNtotJ67iUifiMXlIO1uZ-vYqUUtw/values/5000M?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("55 MH", "Boys", "Track"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1MscOYMHC7Vr0ZQWA-1Xo6lJ8XovSwE60_KZ0mIqu9aA/values/55MH?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("50y", "Boys", "Track"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1nXe02i83DFEx0IJB8qQMn3HyG84m_Ao2-u1EzdV3Mgg/values/50Y?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("300y", "Boys", "Track"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1nXe02i83DFEx0IJB8qQMn3HyG84m_Ao2-u1EzdV3Mgg/values/300Y?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("440y", "Boys", "Track"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1nXe02i83DFEx0IJB8qQMn3HyG84m_Ao2-u1EzdV3Mgg/values/440Y?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("880y", "Boys", "Track"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1nXe02i83DFEx0IJB8qQMn3HyG84m_Ao2-u1EzdV3Mgg/values/880Y?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("Mile", "Boys", "Track"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1nXe02i83DFEx0IJB8qQMn3HyG84m_Ao2-u1EzdV3Mgg/values/Mile?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("2 Mile", "Boys", "Track"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1nXe02i83DFEx0IJB8qQMn3HyG84m_Ao2-u1EzdV3Mgg/values/2%20Mile?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("60 MH", "Boys", "Track"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1MscOYMHC7Vr0ZQWA-1Xo6lJ8XovSwE60_KZ0mIqu9aA/values/60MH?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("55", "Boys", "Track"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1MscOYMHC7Vr0ZQWA-1Xo6lJ8XovSwE60_KZ0mIqu9aA/values/55M?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("60", "Boys", "Track"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1MscOYMHC7Vr0ZQWA-1Xo6lJ8XovSwE60_KZ0mIqu9aA/values/60M?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("200", "Boys", "Track"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1MscOYMHC7Vr0ZQWA-1Xo6lJ8XovSwE60_KZ0mIqu9aA/values/200M?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("300", "Boys", "Track"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1MscOYMHC7Vr0ZQWA-1Xo6lJ8XovSwE60_KZ0mIqu9aA/values/300M?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("400", "Boys", "Track"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1MscOYMHC7Vr0ZQWA-1Xo6lJ8XovSwE60_KZ0mIqu9aA/values/400M?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("500", "Boys", "Track"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1MscOYMHC7Vr0ZQWA-1Xo6lJ8XovSwE60_KZ0mIqu9aA/values/500M?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("600", "Boys", "Track"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1MscOYMHC7Vr0ZQWA-1Xo6lJ8XovSwE60_KZ0mIqu9aA/values/600M?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("800", "Boys", "Track"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1MscOYMHC7Vr0ZQWA-1Xo6lJ8XovSwE60_KZ0mIqu9aA/values/800M?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("1000", "Boys", "Track"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1MscOYMHC7Vr0ZQWA-1Xo6lJ8XovSwE60_KZ0mIqu9aA/values/1000M?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("1500", "Boys", "Track"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1MscOYMHC7Vr0ZQWA-1Xo6lJ8XovSwE60_KZ0mIqu9aA/values/1500M?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("1600", "Boys", "Track"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1MscOYMHC7Vr0ZQWA-1Xo6lJ8XovSwE60_KZ0mIqu9aA/values/1600M?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("3000", "Boys", "Track"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1MscOYMHC7Vr0ZQWA-1Xo6lJ8XovSwE60_KZ0mIqu9aA/values/3000M?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("3200", "Boys", "Track"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1MscOYMHC7Vr0ZQWA-1Xo6lJ8XovSwE60_KZ0mIqu9aA/values/3200M?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("5000", "Boys", "Track"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1MscOYMHC7Vr0ZQWA-1Xo6lJ8XovSwE60_KZ0mIqu9aA/values/5000M?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("High Jump", "Girls", "Field"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1915kB8hO8bsevyNgzmbUhERZXj9xTkM67xfeFMQ9MTA/values/High%20Jump?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("Long Jump", "Girls", "Field"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1915kB8hO8bsevyNgzmbUhERZXj9xTkM67xfeFMQ9MTA/values/Long%20Jump?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("Triple Jump", "Girls", "Field"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1915kB8hO8bsevyNgzmbUhERZXj9xTkM67xfeFMQ9MTA/values/Triple%20Jump?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("Pole Vault", "Girls", "Field"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1915kB8hO8bsevyNgzmbUhERZXj9xTkM67xfeFMQ9MTA/values/Pole%20Vault?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("Shot Put", "Girls", "Field"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1915kB8hO8bsevyNgzmbUhERZXj9xTkM67xfeFMQ9MTA/values/Shot%20Put?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("Weight Throw", "Girls", "Field"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1915kB8hO8bsevyNgzmbUhERZXj9xTkM67xfeFMQ9MTA/values/Weight%20Throw?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("High Jump", "Boys", "Field"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1RNWf-s2zWwW054a0YrOjMtlCYD4Ej4_uh6ntIfq8HV8/values/High%20Jump?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("Long Jump", "Boys", "Field"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1RNWf-s2zWwW054a0YrOjMtlCYD4Ej4_uh6ntIfq8HV8/values/Long%20Jump?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("Triple Jump", "Boys", "Field"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1RNWf-s2zWwW054a0YrOjMtlCYD4Ej4_uh6ntIfq8HV8/values/Triple%20Jump?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("Pole Vault", "Boys", "Field"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1RNWf-s2zWwW054a0YrOjMtlCYD4Ej4_uh6ntIfq8HV8/values/Pole%20Vault?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("Shot Put", "Boys", "Field"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1RNWf-s2zWwW054a0YrOjMtlCYD4Ej4_uh6ntIfq8HV8/values/Shot%20Put?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        case ("Weight Throw", "Boys", "Field"):
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1RNWf-s2zWwW054a0YrOjMtlCYD4Ej4_uh6ntIfq8HV8/values/Weight%20Throw?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        default:
            url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1k8LliY2OG7cta2SePgiffoY8kfDyA-xAFvhWt0VExOM/values/100MH%2030%22?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c")
        }
        return url
    }
    
}
