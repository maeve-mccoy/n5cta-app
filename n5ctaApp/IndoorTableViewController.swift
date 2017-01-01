//
//  IndoorTableViewController.swift
//  n5ctaApp
//
//  Created by Maeve McCoy on 1/6/18.
//  Copyright © 2018 Maeve McCoy. All rights reserved.
//

import Foundation
import UIKit

class IndoorTableViewController: UITableViewController, UISearchBarDelegate, UISearchControllerDelegate, UISearchResultsUpdating   {
    
    @IBOutlet var indoorSearchBar: UISearchController!
    @IBOutlet var indoorTable: UITableView!
    @IBOutlet weak var indoorTableTitle: UINavigationItem!
    
    var event: String = ""
    var gender: String = ""
    var category: String = ""
    var season: String = ""
    var runnerSpikes = [String]()
    var expandedRows = Set<Int>()
    var records = [IndoorDataStruct]()
    var filteredRecords = [IndoorDataStruct]()
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allTimeList()
        self.indoorTable.delegate = self
        self.indoorTable.dataSource = self
        self.indoorTable.rowHeight = UITableViewAutomaticDimension
        indoorTableTitle.title = self.gender + " " + self.event + " - Indoor"
        self.indoorTable.keyboardDismissMode = .interactive
        searchController.searchResultsUpdater = self
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.sizeToFit()
        self.indoorTable.tableHeaderView = searchController.searchBar
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func allTimeList() {
        var url : URL!
        url = ChooseIndoorURL().chooseURL(event: event, gender: gender, category: category)
        
        let urlRequest = URLRequest(url: url)
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: urlRequest) {
            (data, response, error) in
            // check for any errors
            guard error == nil else {
                print("error calling GET on all state girls")
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
                    if(self.event == "55" || self.event == "55 MH" || self.event == "55 MH (30 in)" || self.event == "High Jump" || self.event == "Long Jump" || self.event == "Triple Jump" || self.event == "Pole Vault" || self.event == "600y" || self.event == "2 Mile" || self.event == "50y" || self.event == "440y") {
                        for i in 3..<lengthOfEntries {
                            let entry = allTimeList[i] as! NSArray
                            let place = entry[0] as! String
                            let time = entry[1] as! String
                            let spikes = entry[2] as! String
                            let name = entry[3] as! String
                            let school = entry[4] as! String
                            let meet = entry[5] as! String
                            let track = entry[6] as! String
                            let date = entry[7] as! String
                            
                            self.runnerSpikes.append(spikes)
                            self.records.append(IndoorDataStruct(name: name, time: time, date: date, school: school, place: place, meet: meet, trackType: "", track: track))
                            self.indoorTable.reloadData()
                        }
                    } else if(self.event == "200" || self.event == "300" || self.event == "400" || self.event == "500" || self.event == "600" || self.event == "800" || self.event == "1000" || self.event == "1500" || self.event == "1600" || self.event == "3000" || self.event == "3200" || self.event == "5000" || self.event == "300y" || self.event == "1000y" || self.event == "Mile" || self.event == "880y") {
                        for i in 3..<lengthOfEntries {
                            let entry = allTimeList[i] as! NSArray
                            let place = entry[0] as! String
                            let time = entry[1] as! String
                            let spikes = entry[2] as! String
                            let name = entry[3] as! String
                            let school = entry[4] as! String
                            let meet = entry[5] as! String
                            let track = entry[6] as! String
                            let trackType = entry[7] as! String
                            let date = entry[8] as! String
                            
                            self.runnerSpikes.append(spikes)
                            self.records.append(IndoorDataStruct(name: name, time: time, date: date, school: school, place: place, meet: meet, trackType: trackType, track: track))
                            self.indoorTable.reloadData()
                        }
                    } else if (self.event == "60" || self.event == "60 MH" || self.event == "Shot Put" || self.event == "Weight Throw"){
                        for i in 3..<lengthOfEntries {
                            let entry = allTimeList[i] as! NSArray
                            let place = entry[0] as! String
                            let time = entry[1] as! String
                            let name = entry[2] as! String
                            let school = entry[3] as! String
                            let meet = entry[4] as! String
                            let track = entry[5] as! String
                            let date = entry[6] as! String
                            
                            self.records.append(IndoorDataStruct(name: name, time: time, date: date, school: school, place: place, meet: meet, trackType: "", track: track))
                            self.indoorTable.reloadData()
                        
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
            self.filteredRecords = self.records.filter { $0.name.lowercased().contains(searchController.searchBar.text!.lowercased()) || $0.date.lowercased().contains(searchController.searchBar.text!.lowercased()) || $0.school.lowercased().contains(searchController.searchBar.text!.lowercased()) || $0.time.lowercased().contains(searchController.searchBar.text!.lowercased()) || $0.meet.lowercased().contains(searchController.searchBar.text!.lowercased()) || $0.track.lowercased().contains(searchController.searchBar.text!.lowercased())}
        }
        
        self.indoorTable.reloadData()
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

        if UIScreen.main.bounds.size.width == 375 {
            cell.name.widthAnchor.constraint(equalToConstant: 160).isActive = true
            cell.name.font.withSize(14)
            cell.time.widthAnchor.constraint(equalToConstant: 60).isActive = true
            cell.time.font.withSize(14)
            cell.meetName.widthAnchor.constraint(equalToConstant: 308).isActive = true
        }
        if UIScreen.main.bounds.size.width == 320 {
            cell.name.widthAnchor.constraint(equalToConstant: 120).isActive = true
            cell.name.font.withSize(9)
            cell.time.widthAnchor.constraint(equalToConstant: 50).isActive = true
            cell.time.frame.origin.x=138
            cell.time.font.withSize(9)
            cell.meetName.widthAnchor.constraint(equalToConstant: 308).isActive = true
            cell.meetName.font.withSize(9)
        }
        if UIScreen.main.bounds.size.width == 414 {
            cell.name.widthAnchor.constraint(equalToConstant: 188).isActive = true
            cell.name.font.withSize(16)
            cell.time.widthAnchor.constraint(equalToConstant: 70).isActive = true
            cell.time.frame.origin.x=138
            cell.time.font.withSize(16)
            cell.meetName.widthAnchor.constraint(equalToConstant: 324).isActive = true
            cell.meetName.font.withSize(13)
        }
        cell.layer.cornerRadius = 10.0
        cell.clipsToBounds = true
        cell.layer.borderWidth = 2.0
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.schoolLogo.layer.cornerRadius = 10.0
        cell.schoolLogo.layer.masksToBounds = true
        if searchController.isActive {
            let timeArr = (self.filteredRecords[indexPath.row].time).components(separatedBy: " ")
            let time = timeArr[0]
            let raceCode = timeArr.count > 1 ? timeArr[1] : nil
            if raceCode != nil {
                cell.raceCode.text = RaceCodeConverter().convertCode(raceCode: raceCode!, event: self.event)
            } else {
                cell.raceCode.text = ""
            }
            cell.name.text = self.filteredRecords[indexPath.row].place + ". " + self.filteredRecords[indexPath.row].name
            cell.time.text = time
           cell.meetName.text = self.filteredRecords[indexPath.row].meet + " (" + self.filteredRecords[indexPath.row].track + ")"
            cell.date.text = self.filteredRecords[indexPath.row].date
            cell.schoolLogo.image = UIImage(named: filteredRecords[indexPath.row].school)
            return cell
        } else {
            let timeArr = (self.records[indexPath.row].time).components(separatedBy: " ")
            let time = timeArr[0]
            let raceCode = timeArr.count > 1 ? timeArr[1] : nil
            if raceCode != nil {
                cell.raceCode.text = RaceCodeConverter().convertCode(raceCode: raceCode!, event: self.event)
            } else {
                cell.raceCode.text = "1st place"
            }
            cell.name.text = self.records[indexPath.row].place + ". " + self.records[indexPath.row].name
            cell.time.text = time
            cell.meetName.text = self.records[indexPath.row].meet + " (" + self.records[indexPath.row].track + ")"
            cell.date.text = self.records[indexPath.row].date
            cell.schoolLogo.image = UIImage(named: records[indexPath.row].school)
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 144.0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = indoorTable.cellForRow(at: indexPath) as? ExpandableCell
            else { return }
        
        switch cell.isExpanded
        {
        case true:
            self.expandedRows.remove(indexPath.row)
        case false:
            self.expandedRows.insert(indexPath.row)
        }
        
        cell.isExpanded = !cell.isExpanded
        
        self.indoorTable.beginUpdates()
        self.indoorTable.endUpdates()
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        guard let cell = indoorTable.cellForRow(at: indexPath) as? ExpandableCell
            else { return }
        
        self.expandedRows.remove(indexPath.row)
        
        cell.isExpanded = false
        
        self.indoorTable.beginUpdates()
        self.indoorTable.endUpdates()
        
    }
    
    override func didMove(toParentViewController parent: UIViewController?) {
        self.searchController.isActive = false
    }
}
