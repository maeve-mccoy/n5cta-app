//
//  outdoorGATTableViewController.swift
//  n5ctaApp
//
//  Created by Maeve McCoy on 5/10/17.
//  Copyright © 2017 Maeve McCoy. All rights reserved.
//

import UIKit

class outdoorTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    @IBOutlet var outdoorGATTable: UITableView!
    
    var runnerTime = [String]()
    var runnerDate = [String]()
    var runnerName = [String]()
    var runnerSchool = [String]()
    var runnerTimeDate = [String]()
    var runnerTrack = [String]()
    var runnerMeet = [String]()
    var runnerPlace = [String]()
    var expandedRows = Set<Int>()
    var place = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allTimeGirls()
        self.outdoorGATTable.delegate = self
        self.outdoorGATTable.dataSource = self
        self.outdoorGATTable.rowHeight = UITableViewAutomaticDimension
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func allTimeGirls() {
        guard let url = URL(string: "https://sheets.googleapis.com/v4/spreadsheets/1k8LliY2OG7cta2SePgiffoY8kfDyA-xAFvhWt0VExOM/values/800M?key=AIzaSyCZWel5oio5yXvLIr3UfnRQbDpPHkO7m-c") else {
            print("Error: cannot create URL")
            return
        }
        let urlRequest = URLRequest(url: url)
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: urlRequest) {
            (data, response, error) in
            // check for any errors
            guard error == nil else {
                print("error calling GET on all state girls")
                print(error)
                return
            }
            // make sure we got data
            guard let responseData = data else {
                print("Error: did not receive data")
                return
            }
            // parse the result as JSON, since that's what the API provides
            do {
                guard let allTime800 = try JSONSerialization.jsonObject(with: responseData, options: []) as? NSDictionary else {
                    print("error trying to convert data to JSON")
                    return
                }
                
                let allTime800List = allTime800["values"] as! NSArray
                let lengthOfEntries = allTime800List.count
                
                DispatchQueue.main.sync() {
                    for i in 3..<lengthOfEntries-1 {
                        let entry = allTime800List[i] as! NSArray
                        let place = entry[0] as! String
                        let time = entry[1] as! String
                        let name = entry[2] as! String
                        let school = entry[3] as! String
                        let meet = entry[4] as! String
                        let track = entry[5] as! String
                        let date = entry[6] as! String
                        let timeDate = time + "  " + date
                        
                        self.runnerTime.append(time)
                        self.runnerDate.append(date)
                        self.runnerName.append(name)
                        self.runnerPlace.append(place)
                        self.runnerTimeDate.append(timeDate)
                        self.runnerSchool.append(school)
                        self.runnerMeet.append(meet)
                        self.runnerTrack.append(track)
                        self.outdoorGATTable.reloadData()
                        
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

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return self.runnerName.count
        
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:ExpandableCell = tableView.dequeueReusableCell(withIdentifier: "ExpandableCell") as! ExpandableCell
        cell.subtitle.text = self.runnerPlace[indexPath.row] + ". " + self.runnerName[indexPath.row] + " - "+self.runnerSchool[indexPath.row] +
                            "\n" + self.runnerTime[indexPath.row] +
                            "\n" + self.runnerDate[indexPath.row] +
                            "\n" + self.runnerMeet[indexPath.row] + " (" + self.runnerTrack[indexPath.row] + ")"
        cell.cellTitle.text = self.runnerPlace[indexPath.row] + ". " + self.runnerName[indexPath.row] + " - " + self.runnerTime[indexPath.row]
        cell.schoolLogo.image = UIImage(named: runnerSchool[indexPath.row])
        cell.isExpanded = self.expandedRows.contains(indexPath.row)
        return cell
        

    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 144.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        guard let cell = outdoorGATTable.cellForRow(at: indexPath) as? ExpandableCell
            else { return }
        
        switch cell.isExpanded
        {
        case true:
            self.expandedRows.remove(indexPath.row)
        case false:
            self.expandedRows.insert(indexPath.row)
        }
        
        cell.isExpanded = !cell.isExpanded
        
        self.outdoorGATTable.beginUpdates()
        self.outdoorGATTable.endUpdates()
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        guard let cell = outdoorGATTable.cellForRow(at: indexPath) as? ExpandableCell
            else { return }
        
        self.expandedRows.remove(indexPath.row)
        
        cell.isExpanded = false
        
        self.outdoorGATTable.beginUpdates()
        self.outdoorGATTable.endUpdates()
        
    }
}
