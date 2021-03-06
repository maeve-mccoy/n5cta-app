//
//  outdoorGATTableViewController.swift
//  n5ctaApp
//
//  Created by Maeve McCoy on 5/10/17.
//  Copyright © 2017 Maeve McCoy. All rights reserved.
//

import UIKit

class outdoorTableViewController: UITableViewController, UISearchBarDelegate, UISearchControllerDelegate, UISearchResultsUpdating   {
    @IBOutlet var outdoorSearchBar: UISearchController!
    @IBOutlet var outdoorTable: UITableView!
    @IBOutlet weak var tableTitle: UINavigationItem!
    
    var event: String = ""
    var gender: String = ""
    var category: String = ""
    var season: String = ""
    var runnerWind = [String]()
    var expandedRows = Set<Int>()
    var records = [OutdoorDataStruct]()
    var filteredRecords = [OutdoorDataStruct]()
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allTimeList()
        self.outdoorTable.delegate = self
        self.outdoorTable.dataSource = self
        self.outdoorTable.rowHeight = UITableViewAutomaticDimension
        tableTitle.title = self.gender + " " + self.event + " - Outdoor"
        self.outdoorTable.keyboardDismissMode = .interactive
        searchController.searchResultsUpdater = self
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.sizeToFit()
        self.outdoorTable.tableHeaderView = searchController.searchBar
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func allTimeList() {
        var url : URL!
        url = ChooseOutdoorURL().chooseURL(event: event, gender: gender, category: category)
        
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
                    if(self.event == "100" || self.event == "200" || self.event == "100 MH" || self.event == "110 MH" || self.event == "Long Jump" || self.event == "Triple Jump") {
                        for i in 3..<lengthOfEntries {
                            let entry = allTimeList[i] as! NSArray
                            let place = entry[0] as! String
                            let time = entry[1] as! String
                            let wind = entry[2] as! String
                            let name = entry[3] as! String
                            let school = entry[4] as! String
                            let meet = entry[5] as! String
                            let track = entry[6] as! String
                            let date = entry[7] as! String
                           
                            self.runnerWind.append(wind)
                            self.records.append(OutdoorDataStruct(name: name, time: time, date: date, school: school, place: place, meet: meet, track: track))
                            self.outdoorTable.reloadData()
                        }
                    } else {
                        for i in 3..<lengthOfEntries {
                            let entry = allTimeList[i] as! NSArray
                            let place = entry[0] as! String
                            let time = entry[1] as! String
                            let name = entry[2] as! String
                            let school = entry[3] as! String
                            let meet = entry[4] as! String
                            let track = entry[5] as! String
                            let date = entry[6] as! String
                        
                            self.records.append(OutdoorDataStruct(name: name, time: time, date: date, school: school, place: place, meet: meet, track: track))
                            self.outdoorTable.reloadData()
                        
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
        
        self.outdoorTable.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
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
                cell.raceCode.text = "1st place"
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
        guard let cell = outdoorTable.cellForRow(at: indexPath) as? ExpandableCell
            else { return }
        
        switch cell.isExpanded
        {
        case true:
            self.expandedRows.remove(indexPath.row)
        case false:
            self.expandedRows.insert(indexPath.row)
        }
        cell.isExpanded = !cell.isExpanded
        self.outdoorTable.beginUpdates()
        self.outdoorTable.endUpdates()
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        guard let cell = outdoorTable.cellForRow(at: indexPath) as? ExpandableCell
            else { return }
        self.expandedRows.remove(indexPath.row)
        cell.isExpanded = false
        self.outdoorTable.beginUpdates()
        self.outdoorTable.endUpdates()
    }
    
    override func didMove(toParentViewController parent: UIViewController?) {
        self.searchController.isActive = false
    }
}
