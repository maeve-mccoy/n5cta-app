//
//  StateRecordsTableViewController.swift
//  n5ctaApp
//
//  Created by Maeve McCoy on 3/15/18.
//  Copyright © 2018 Maeve McCoy. All rights reserved.
//

import Foundation
import UIKit

class StateRecordsTableViewController: UITableViewController, UISearchBarDelegate, UISearchControllerDelegate, UISearchResultsUpdating   {
    
    @IBOutlet var stateRecordsSearchBar: UISearchController!
    @IBOutlet var stateRecordsTable: UITableView!
    @IBOutlet weak var stateRecordsTableTitle: UINavigationItem!
    
    
    var gender: String = ""
    var category: String = ""
    var season: String = ""
    var expandedRows = Set<Int>()
    
    var records = [StateRecordsDataStruct]()
    var filteredRecords = [StateRecordsDataStruct]()
    
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allTimeList()
        self.stateRecordsTable.delegate = self
        self.stateRecordsTable.dataSource = self
        stateRecordsTableTitle.title = self.gender + " " + self.season + " State Records"
        
        self.stateRecordsTable.keyboardDismissMode = .interactive
        searchController.searchResultsUpdater = self
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.sizeToFit()
        self.stateRecordsTable.tableHeaderView = searchController.searchBar
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func allTimeList() {
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
                    if(self.category == "Track/Field" && self.gender == "Girls" && self.season == "Outdoor") {
                        for i in 4..<19 {
                            let entry = allTimeList[i] as! NSArray
                            let event = entry[0] as! String
                            let name = entry[1] as! String
                            let school = entry[2] as! String
                            let handTime = entry[3] as! String
                            let autoTime = entry[4] as! String
                            let meet = entry[5] as! String
                            let track = entry[6] as! String
                            let date = entry[7] as! String
                            self.records.append(StateRecordsDataStruct(event: event, name: name, school: school, splits: handTime, autoTime: autoTime, meet: meet, track: track, date: date, trackType: ""))
                            self.stateRecordsTable.reloadData()
                        }
                    } else if(self.category == "Track/Field" && self.gender == "Boys" && self.season == "Outdoor") {
                            for i in 4..<18 {
                                let entry = allTimeList[i] as! NSArray
                                let event = entry[0] as! String
                                let name = entry[1] as! String
                                let school = entry[2] as! String
                                let handTime = entry[3] as! String
                                let autoTime = entry[4] as! String
                                let meet = entry[5] as! String
                                let track = entry[6] as! String
                                let date = entry[7] as! String
                                self.records.append(StateRecordsDataStruct(event: event, name: name, school: school, splits: handTime, autoTime: autoTime, meet: meet, track: track, date: date, trackType: ""))
                                self.stateRecordsTable.reloadData()
                        }
                    } else if(self.category == "Track/Field" && self.gender == "Girls" && self.season == "Indoor") {
                        for i in 4..<18 {
                            let entry = allTimeList[i] as! NSArray
                            let event = entry[0] as! String
                            let name = entry[1] as! String
                            let school = entry[2] as! String
                            _ = entry[3] as! String
                            let autoTime = entry[4] as! String
                            let meet = entry[5] as! String
                            let track = entry[6] as! String
                            let trackType = entry[7] as! String
                            let date = entry[8] as! String
                            self.records.append(StateRecordsDataStruct(event: event, name: name, school: school, splits: "", autoTime: autoTime, meet: meet, track: track, date: date, trackType: trackType))
                            self.stateRecordsTable.reloadData()
                        }
                    } else if(self.category == "Track/Field" && self.gender == "Boys" && self.season == "Indoor") {
                        for i in 4..<18 {
                            let entry = allTimeList[i] as! NSArray
                            let event = entry[0] as! String
                            let name = entry[1] as! String
                            let school = entry[2] as! String
                            _ = entry[3] as! String
                            let autoTime = entry[4] as! String
                            let meet = entry[5] as! String
                            let track = entry[6] as! String
                            let trackType = entry[7] as! String
                            let date = entry[8] as! String
                            self.records.append(StateRecordsDataStruct(event: event, name: name, school: school, splits: "", autoTime: autoTime, meet: meet, track: track, date: date, trackType: trackType))
                            self.stateRecordsTable.reloadData()
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
        self.stateRecordsTable.reloadData()
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
            cell.meetName.text = self.filteredRecords[indexPath.row].meet + " (" + self.filteredRecords[indexPath.row].track + ")"
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
            cell.meetName.text = self.records[indexPath.row].meet + " (" + self.records[indexPath.row].track + ")"
            cell.date.text = self.records[indexPath.row].date
            cell.schoolLogo.image = UIImage(named: records[indexPath.row].school)
            return cell
        }
    }
    
    override func didMove(toParentViewController parent: UIViewController?) {
        self.searchController.isActive = false
    }
}
