//
//  RelayStateRecordsTableViewController.swift
//  n5ctaApp
//
//  Created by Maeve McCoy on 3/13/18.
//  Copyright © 2018 Maeve McCoy. All rights reserved.
//

import Foundation
import UIKit

class RelayStateRecordsTableViewController: UITableViewController, UISearchBarDelegate, UISearchControllerDelegate   {
    
//    @IBOutlet var relayStateRecordsSearchBar: UISearchController!
    @IBOutlet var relayStateRecordsTable: UITableView!
    @IBOutlet weak var relayStateRecordsTableTitle: UINavigationItem!
    var gender: String = ""
    var category: String = ""
    var season: String = ""
    var expandedRows = Set<Int>()
    
    var records = [StateRecordsDataStruct]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getStateRecords()
        self.relayStateRecordsTable.delegate = self
        self.relayStateRecordsTable.dataSource = self
        relayStateRecordsTableTitle.title = self.gender + " " + self.season + " Relay State Records"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getStateRecords() {
        var url : URL!
        url = ChooseStateRecordsURL().chooseURL(gender: gender, season: season)
        
        let urlRequest = URLRequest(url: url)
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: urlRequest) {
            (data, response, error) in
            // check for any errors
            guard error == nil else {
                print("error calling GET on state records")
                print(error as Any as Any)
                return
            }
            // make sure we got data
            guard let responseData = data else {
                print("Error: did not receive data")
                return
            }
            // parse the result as JSON, since that's what the API provides
            do {
                guard let allTime = try JSONSerialization.jsonObject(with: responseData, options: []) as? NSDictionary else {
                    print("error trying to convert data to JSON")
                    return
                }
                let allTimeList = allTime["values"] as! NSArray
                let lengthOfEntries = allTimeList.count
                
                DispatchQueue.main.sync() {
                    print(self.category)
                    print(self.season)
                    if(self.category == "Relays" && self.season == "Indoor") {
                        for i in 18..<30 {
                            let entry = allTimeList[i] as! NSArray
                            let event = entry[0] as! String
                            let name = entry[1] as! String
                            let school = entry[2] as! String
                            let splits = entry[3] as! String
                            let autoTime = entry[4] as! String
                            let meet = entry[5] as! String
                            let track = entry[6] as! String
                            let trackType = entry[7] as! String
                            let date = entry[8] as! String
                            self.records.append(StateRecordsDataStruct(event: event, name: name, school: school, splits: splits, autoTime: autoTime, meet: meet, track: track, date: date, trackType: trackType))
                            self.relayStateRecordsTable.reloadData()
                        }
                    } else if(self.category == "Relays" && self.season == "Outdoor" && self.gender == "Girls") {
                        for i in 19..<35 {
                            let entry = allTimeList[i] as! NSArray
                            let event = entry[0] as! String
                            let name = entry[1] as! String
                            let school = entry[2] as! String
                            let splits = entry[3] as! String
                            let autoTime = entry[4] as! String
                            let meet = entry[5] as! String
                            let track = entry[6] as! String
                            let date = entry[7] as! String
                            self.records.append(StateRecordsDataStruct(event: event, name: name, school: school, splits: splits, autoTime: autoTime, meet: meet, track: track, date: date, trackType: ""))
                            self.relayStateRecordsTable.reloadData()
                        }
                    } else if(self.category == "Relays" && self.season == "Outdoor" && self.gender == "Boys") {
                        for i in 18..<34 {
                            let entry = allTimeList[i] as! NSArray
                            let event = entry[0] as! String
                            let name = entry[1] as! String
                            let school = entry[2] as! String
                            let splits = entry[3] as! String
                            let autoTime = entry[4] as! String
                            let meet = entry[5] as! String
                            let track = entry[6] as! String
                            let date = entry[7] as! String
                            self.records.append(StateRecordsDataStruct(event: event, name: name, school: school, splits: splits, autoTime: autoTime, meet: meet, track: track, date: date, trackType: ""))
                            self.relayStateRecordsTable.reloadData()
                        }
                    }
                }
            } catch  {
                print("error trying to convert data to JSON")
                return
            }
        }
        task.resume()
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.records.count/4
    }
    

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:ExpandableCellStateRecords = tableView.dequeueReusableCell(withIdentifier: "ExpandableCellStateRecords", for: indexPath) as! ExpandableCellStateRecords
        if UIScreen.main.bounds.size.width == 320 {
            cell.relayMeetName.widthAnchor.constraint(equalToConstant: 88).isActive = true
            cell.relayMeetName.adjustsFontSizeToFitWidth = true
        }
        if UIScreen.main.bounds.size.width == 375 {
            cell.relayMeetName.widthAnchor.constraint(equalToConstant: 110).isActive = true
            cell.relayMeetName.adjustsFontSizeToFitWidth = true
        }
        cell.layer.cornerRadius = 10.0
        cell.clipsToBounds = true
        cell.layer.borderWidth = 2.0
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.schoolLogo.layer.cornerRadius = 10.0
        cell.schoolLogo.layer.masksToBounds = true
        cell.relayEvent.text = self.records[(indexPath.row)*4].event
        if(self.records[(indexPath.row)*4].autoTime.isEmpty) {
             cell.relayTime.text = self.records[(indexPath.row)*4].splits
             cell.relayTime1.text = " "
        } else {
             cell.relayTime.text = self.records[(indexPath.row)*4].autoTime
             cell.relayTime1.text = self.records[(indexPath.row)*4].splits
        }
        cell.relayDate.text = self.records[(indexPath.row)*4].date
        cell.relayName1.text = self.records[(indexPath.row)*4].name
        cell.relayName2.text = self.records[(indexPath.row)*4+1].name
        cell.relayName3.text = self.records[(indexPath.row)*4+2].name
        cell.relayName4.text = self.records[(indexPath.row)*4+3].name
        cell.relayTime2.text = self.records[(indexPath.row)*4+1].splits
        cell.relayTime3.text = self.records[(indexPath.row)*4+2].splits
        cell.relayTime4.text = self.records[(indexPath.row)*4+3].splits
        cell.relayTrackType.text = self.records[(indexPath.row)*4].trackType
        cell.relayMeetName.text = self.records[(indexPath.row)*4].meet
        cell.schoolLogo.image = UIImage(named: records[(indexPath.row)*4].school)
        return cell
    }
}
