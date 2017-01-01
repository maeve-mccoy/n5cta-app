//
//  MeetRecordsTableViewController.swift
//  n5ctaApp
//
//  Created by Maeve McCoy on 5/14/18.
//  Copyright © 2018 Maeve McCoy. All rights reserved.
//

import Foundation
import UIKit

class MeetRecordsTableViewController: UITableViewController, UISearchBarDelegate, UISearchControllerDelegate, UISearchResultsUpdating   {
    
    @IBOutlet var meetRecordsSearchBar: UISearchController!
    @IBOutlet var meetRecordsTable: UITableView!
    @IBOutlet weak var meetRecordsTableTitle: UINavigationItem!
    
    
    var gender: String = ""
    var category: String = ""
    var season: String = ""
    var meet: String = ""
    var expandedRows = Set<Int>()
    
    var records = [StateRecordsDataStruct]()
    var filteredRecords = [StateRecordsDataStruct]()
    
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allTimeList()
        self.meetRecordsTable.delegate = self
        self.meetRecordsTable.dataSource = self
        meetRecordsTableTitle.title = self.gender + " " + self.season + " " + self.meet + " Records"
        
        self.meetRecordsTable.keyboardDismissMode = .interactive
        searchController.searchResultsUpdater = self
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.sizeToFit()
        self.meetRecordsTable.tableHeaderView = searchController.searchBar
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func allTimeList() {
        var url : URL!
        url = ChooseMeetRecordsURL().chooseURL(gender: gender, season: season, meet: meet)
        
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
                    if(self.category == "Track/Field" && self.gender == "Girls" && self.season == "Outdoor" && (self.meet == "State Meet" || self.meet == "Meet of Champions")) {
                        for i in 4..<19 {
                            let entry = allTimeList[i] as! NSArray
                            let event = entry[0] as! String
                            let name = entry[1] as! String
                            let school = entry[3] as! String
                            let handTime = entry[4] as! String
                            let autoTime = entry[5] as! String
                            let meet = entry[6] as! String
                            let date = entry[7] as! String
                            self.records.append(StateRecordsDataStruct(event: event, name: name, school: school, splits: handTime, autoTime: autoTime, meet: meet, track: "", date: date, trackType: ""))
                            self.meetRecordsTable.reloadData()
                        }
                    } else if(self.category == "Track/Field" && self.gender == "Boys" && self.season == "Outdoor" && self.meet == "Meet of Champions") {
                        for i in 4..<18 {
                            let entry = allTimeList[i] as! NSArray
                            let event = entry[0] as! String
                            let name = entry[1] as! String
                            let school = entry[3] as! String
                            let handTime = entry[4] as! String
                            let autoTime = entry[5] as! String
                            let meet = entry[6] as! String
                            let date = entry[7] as! String
                            self.records.append(StateRecordsDataStruct(event: event, name: name, school: school, splits: handTime, autoTime: autoTime, meet: meet, track: "", date: date, trackType: ""))
                            self.meetRecordsTable.reloadData()
                        }
                    } else if(self.category == "Track/Field" && self.gender == "Boys" && self.season == "Outdoor" && self.meet == "State Meet") {
                        for i in 4..<18 {
                            let entry = allTimeList[i] as! NSArray
                            let event = entry[0] as! String
                            let name = entry[1] as! String
                            let school = entry[2] as! String
                            let handTime = entry[3] as! String
                            let autoTime = entry[4] as! String
                            let meet = entry[5] as! String
                            let date = entry[6] as! String
                            self.records.append(StateRecordsDataStruct(event: event, name: name, school: school, splits: handTime, autoTime: autoTime, meet: meet, track: "", date: date, trackType: ""))
                            self.meetRecordsTable.reloadData()
                        }
                    } else if(self.category == "Track/Field" && self.gender == "Girls" && self.season == "Outdoor" && (self.meet == "Div. I State Meet" || self.meet == "Div. II State Meet")) {
                        for i in 4..<19 {
                            let entry = allTimeList[i] as! NSArray
                            let event = entry[0] as! String
                            let name = entry[1] as! String
                            let school = entry[2] as! String
                            let handTime = entry[3] as! String
                            let autoTime = entry[4] as! String
                            let date = entry[5] as! String
                            self.records.append(StateRecordsDataStruct(event: event, name: name, school: school, splits: handTime, autoTime: autoTime, meet: self.meet, track: "", date: date, trackType: ""))
                            self.meetRecordsTable.reloadData()
                        }
                    } else if(self.category == "Track/Field" && self.gender == "Boys" && self.season == "Outdoor" && (self.meet == "Div. I State Meet" || self.meet == "Div. II State Meet")) {
                        for i in 4..<18 {
                            let entry = allTimeList[i] as! NSArray
                            let event = entry[0] as! String
                            let name = entry[1] as! String
                            let school = entry[2] as! String
                            let handTime = entry[3] as! String
                            let autoTime = entry[4] as! String
                            let date = entry[5] as! String
                            self.records.append(StateRecordsDataStruct(event: event, name: name, school: school, splits: handTime, autoTime: autoTime, meet: self.meet, track: "", date: date, trackType: ""))
                            self.meetRecordsTable.reloadData()
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
    
    
    // MARK: - Table view data source
    
    func updateSearchResults(for searchController: UISearchController) {
        // If we haven't typed anything into the search bar then do not filter the results
        if searchController.searchBar.text! == "" {
            self.filteredRecords = self.records
        } else {
            // Filter the results
            self.filteredRecords = self.records.filter { $0.name.lowercased().contains(searchController.searchBar.text!.lowercased()) || $0.event.lowercased().contains(searchController.searchBar.text!.lowercased()) || $0.school.lowercased().contains(searchController.searchBar.text!.lowercased()) || $0.splits.lowercased().contains(searchController.searchBar.text!.lowercased()) || $0.autoTime.lowercased().contains(searchController.searchBar.text!.lowercased()) ||
                $0.meet.lowercased().contains(searchController.searchBar.text!.lowercased()) ||
                $0.date.lowercased().contains(searchController.searchBar.text!.lowercased()) ||
                $0.track.lowercased().contains(searchController.searchBar.text!.lowercased())}
        }
        self.meetRecordsTable.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if searchController.searchBar.text! == ""{
            return self.records.count
        } else {
            return self.filteredRecords.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:ExpandableCellStateRecords = tableView.dequeueReusableCell(withIdentifier: "ExpandableCellStateRecords") as! ExpandableCellStateRecords
        cell.layer.cornerRadius = 10.0
        cell.clipsToBounds = true
        cell.layer.borderWidth = 2.0
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.schoolLogo.layer.cornerRadius = 10.0
        cell.schoolLogo.layer.masksToBounds = true
        if searchController.isActive {
            cell.event.text = self.filteredRecords[indexPath.row].event
            cell.name.text = self.filteredRecords[indexPath.row].name
            if(self.filteredRecords[indexPath.row].autoTime.isEmpty) {
                cell.time.text = self.filteredRecords[indexPath.row].splits
            } else {
                cell.time.text = self.filteredRecords[indexPath.row].autoTime
            }
            if (self.filteredRecords[indexPath.row].meet == "DI") {
                cell.meetName.text = "Div. I State Meet"
            } else if (self.filteredRecords[indexPath.row].meet == "DII") {
                cell.meetName.text = "Div. II State Meet"
            } else if (self.filteredRecords[indexPath.row].meet == "MOC") {
                cell.meetName.text = "Meet of Champions"
            } else if (self.filteredRecords[indexPath.row].meet == "IF") {
                cell.meetName.text = "Individual Final"
            } else {
                cell.meetName.text = self.records[indexPath.row].meet
            }
            cell.date.text = self.filteredRecords[indexPath.row].date
            cell.schoolLogo.image = UIImage(named: filteredRecords[indexPath.row].school)
            return cell
        } else {
            cell.event.text = self.records[indexPath.row].event
            if(self.records[indexPath.row].event.isEmpty){
                cell.event.text = self.records[indexPath.row-1].event
            } else {
                cell.event.text = self.records[indexPath.row].event
            }
            cell.name.text = self.records[indexPath.row].name
            if(self.records[indexPath.row].autoTime.isEmpty) {
                cell.time.text = self.records[indexPath.row].splits
            } else {
                cell.time.text = self.records[indexPath.row].autoTime
            }
            if (self.records[indexPath.row].meet == "DI") {
                cell.meetName.text = "Div. I State Meet"
            } else if (self.records[indexPath.row].meet == "DII") {
                cell.meetName.text = "Div. II State Meet"
            } else if (self.records[indexPath.row].meet == "MOC") {
                cell.meetName.text = "Meet of Champions"
            } else if (self.records[indexPath.row].meet == "IF") {
                cell.meetName.text = "Individual Final"
            } else {
                cell.meetName.text = self.records[indexPath.row].meet
            }
            cell.date.text = self.records[indexPath.row].date
            cell.schoolLogo.image = UIImage(named: records[indexPath.row].school)
            return cell
        }
    }
    
    override func didMove(toParentViewController parent: UIViewController?) {
        self.searchController.isActive = false
    }
}
