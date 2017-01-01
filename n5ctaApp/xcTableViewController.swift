//
//  xcTableViewController.swift
//  n5ctaApp
//
//  Created by Maeve McCoy on 8/9/17.
//  Copyright © 2017 Maeve McCoy. All rights reserved.
//

import UIKit

class xcTableViewController: UITableViewController, UISearchBarDelegate, UISearchControllerDelegate, UISearchResultsUpdating  {
    
    @IBOutlet var xcSearchBar: UISearchController!
    @IBOutlet var xcTable: UITableView!
    @IBOutlet weak var tableTitle: UINavigationItem!
    
    var event: String = ""
    var gender: String = ""
    var category: String = ""
    var season: String = ""
    var expandedRows = Set<Int>()
    var records = [Record]()
    var filteredRecords = [Record]()
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allTimeList()
        self.xcTable.delegate = self
        self.xcTable.dataSource = self
        self.xcTable.rowHeight = UITableViewAutomaticDimension
        tableTitle.title = self.gender + " " + self.event + " - Cross Country"
        self.xcTable.keyboardDismissMode = .interactive
        searchController.searchResultsUpdater = self
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.sizeToFit()
        self.xcTable.tableHeaderView = searchController.searchBar
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func allTimeList() {
        var url : URL!
        url = ChooseXcURL().chooseURL(gender: gender, event: event)
        
        let urlRequest = URLRequest(url: url)
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: urlRequest) {
            (data, response, error) in
            guard error == nil else {
                print("error calling GET on all state girls")
                print(error as Any)
                return
            }
            guard let responseData = data else {
                print("Error: did not receive data")
                return
            }
            do {
                guard let allTime = try JSONSerialization.jsonObject(with: responseData, options: []) as? NSDictionary else {
                    print("error trying to convert data to JSON")
                    return
                }
                let allTimeList = allTime["values"] as? NSArray
                let lengthOfEntries = allTimeList?.count
            
                DispatchQueue.main.sync() {
                    if let lengthOfEntries = lengthOfEntries {
                        for i in 12..<lengthOfEntries-2 {
                            let entry = allTimeList?[i] as! NSArray
                            let place = entry[0] as! String
                            let time = entry[3] as! String
                            let name = entry[1] as! String
                            let school = entry[2] as! String
                            let date = entry[4] as! String
                        
                            self.records.append(Record(name: name, time: time, date: date, school: school, place: place))
                            self.xcTable.reloadData()
                        }
                    }
                }
            }
            catch  {
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
            self.filteredRecords = self.records.filter { $0.name.lowercased().contains(searchController.searchBar.text!.lowercased()) || $0.date.lowercased().contains(searchController.searchBar.text!.lowercased()) || $0.school.lowercased().contains(searchController.searchBar.text!.lowercased()) || $0.time.lowercased().contains(searchController.searchBar.text!.lowercased())}
        }
        
        self.xcTable.reloadData()
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
        let cell:ExpandableCell = tableView.dequeueReusableCell(withIdentifier: "ExpandableCell") as! ExpandableCell
        cell.layer.cornerRadius = 10.0
        cell.clipsToBounds = true
        cell.layer.borderWidth = 2.0
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.schoolLogo.layer.cornerRadius = 10.0
        cell.schoolLogo.layer.masksToBounds = true
        if searchController.isActive {
            cell.subtitle.text = self.filteredRecords[indexPath.row].place + ". " + self.filteredRecords[indexPath.row].name + " - "+self.filteredRecords[indexPath.row].school +
                "\n" + self.filteredRecords[indexPath.row].time +
                "\n" + self.filteredRecords[indexPath.row].date
            cell.cellTitle.text = self.filteredRecords[indexPath.row].place + ". " + self.filteredRecords[indexPath.row].name + " - " + self.filteredRecords[indexPath.row].time
            cell.schoolLogo.image = UIImage(named: self.filteredRecords[indexPath.row].school)
            cell.isExpanded = self.expandedRows.contains(indexPath.row)
            return cell
        } else {
            cell.subtitle.text = self.records[indexPath.row].place + ". " + self.records[indexPath.row].name + " - "+self.records[indexPath.row].school +
                "\n" + self.records[indexPath.row].time +
                "\n" + self.records[indexPath.row].date
            cell.cellTitle.text = self.records[indexPath.row].place + ". " + self.records[indexPath.row].name + " - " + self.records[indexPath.row].time
            cell.schoolLogo.image = UIImage(named: self.records[indexPath.row].school)
            cell.isExpanded = self.expandedRows.contains(indexPath.row)
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 144.0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = xcTable.cellForRow(at: indexPath) as? ExpandableCell
            else { return }
        
        switch cell.isExpanded
        {
        case true:
            self.expandedRows.remove(indexPath.row)
        case false:
            self.expandedRows.insert(indexPath.row)
        }
        
        cell.isExpanded = !cell.isExpanded
        
        self.xcTable.beginUpdates()
        self.xcTable.endUpdates()
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        guard let cell = xcTable.cellForRow(at: indexPath) as? ExpandableCell
            else { return }
        
        self.expandedRows.remove(indexPath.row)
        
        cell.isExpanded = false
        
        self.xcTable.beginUpdates()
        self.xcTable.endUpdates()
        
    }
    
    override func didMove(toParentViewController parent: UIViewController?) {
        self.searchController.isActive = false
    }
}

