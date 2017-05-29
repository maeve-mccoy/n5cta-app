//
//  ViewController.swift
//  n5ctaApp
//
//  Created by Maeve McCoy on 4/22/17.
//  Copyright © 2017 Maeve McCoy. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var chooseSeasonButton: UIButton!

    // Season picker outlet and action connections
    @IBOutlet weak var genderPicker: UIPickerView!
    @IBOutlet weak var seasonPicker: UIPickerView!
    @IBOutlet weak var listPicker: UIPickerView!
    @IBOutlet weak var eventPicker: UIPickerView!
    @IBOutlet weak var categoryPicker: UIPickerView!
    
    var chosenSeason = 0
    var chosenGender = 0
    var chosenList = 0
    var chosenEvent = 0
    var chosenCategory = 0
    
    var hurdlesThirty: String?
    var shotPutEightlb: String?
    var steeple: String?
    var decathlon: String?
    var hurdlesTwoHundred: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Assigning the data source and delegate
        self.seasonPicker.dataSource = self;
        self.seasonPicker.delegate = self;
        seasonPicker.tag = 1;
        self.genderPicker.dataSource = self;
        self.genderPicker.delegate = self;
        genderPicker.tag = 2;
        self.listPicker.dataSource = self;
        self.listPicker.delegate = self;
        listPicker.tag = 3;
        self.eventPicker.dataSource = self;
        self.eventPicker.delegate = self;
        eventPicker.tag = 4;
        self.categoryPicker.dataSource = self;
        self.categoryPicker.delegate = self;
        categoryPicker.tag = 5;

    }
    
    
    // Helper for showing an alert
    func showAlert(title : String, message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: UIAlertControllerStyle.alert
        )
        let ok = UIAlertAction(
            title: "OK",
            style: UIAlertActionStyle.default,
            handler: nil
        )
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Season Picker data and rows
    //@available(iOS 2.0, *)
    var seasonDataSource = ["Cross Country", "Indoor", "Outdoor"];
    var genderDataSource = ["Girls", "Boys"];
    var listDataSource = ["All Time List", "State Records"];
    var eventDataSource = ["100 MH (30 in.)", "200 MH", "100 MH", "300 MH", "400 MH", "100", "200", "400", "800", "1500", "1600", "3000", "3200", "5000"];
    var categoryDataSource = ["Meter", "Field", "Relay", "Yard", "Class"];
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (pickerView == seasonPicker){
            return seasonDataSource.count
        } else if (pickerView == genderPicker){
            return genderDataSource.count
        } else if (pickerView == eventPicker) {
            return eventDataSource.count
        } else if (pickerView == listPicker){
            return listDataSource.count
        } else {
            return categoryDataSource.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var label = view as! UILabel!
        if label == nil {
            label = UILabel()
        }
        if (pickerView == seasonPicker) {
            let title = NSAttributedString(string: seasonDataSource[row], attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 12.0, weight: UIFontWeightRegular)])
            label?.attributedText = title
            label?.textAlignment = .center
            label?.textColor = UIColor.white
            label?.adjustsFontSizeToFitWidth = true
            return label!
        } else if (pickerView == genderPicker) {
               let title = NSAttributedString(string: genderDataSource[row], attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 12.0, weight: UIFontWeightRegular)])
            label?.attributedText = title
            label?.textAlignment = .center
            label?.textColor = UIColor.white
            label?.adjustsFontSizeToFitWidth = true
            return label!
        } else if (pickerView == listPicker){
               let title = NSAttributedString(string: listDataSource[row], attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 12.0, weight: UIFontWeightRegular)])
            label?.attributedText = title
            label?.textAlignment = .center
            label?.textColor = UIColor.white
            label?.adjustsFontSizeToFitWidth = true
            return label!
        } else if (pickerView == eventPicker){
            let title = NSAttributedString(string: eventDataSource[row], attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 12.0, weight: UIFontWeightRegular)])
            label?.attributedText = title
            label?.textAlignment = .center
            label?.textColor = UIColor.white
            label?.adjustsFontSizeToFitWidth = true
            return label!
        } else {
            let title = NSAttributedString(string: categoryDataSource[row], attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 12.0, weight: UIFontWeightRegular)])
            label?.attributedText = title
            label?.textAlignment = .center
            label?.textColor = UIColor.white
            label?.adjustsFontSizeToFitWidth = true
            return label!
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (pickerView == seasonPicker){
            return seasonDataSource[row]
        } else if (pickerView == genderPicker){
            return genderDataSource[row]
        } else if (pickerView == eventPicker) {
            eventPicker.reloadAllComponents()
            return eventDataSource[row]
        } else if (pickerView == listPicker){
            listPicker.reloadAllComponents()
            return listDataSource[row]
        } else {
            categoryPicker.reloadAllComponents()
            return categoryDataSource[row]
        }
    }
    
    // Logic for season picker
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        if (pickerView == seasonPicker) {
            switch seasonDataSource[row] {
            case "Outdoor" :
                listDataSource = ["All Time List", "State Records", "State Meet Records", "State Meet Records D1", "State Meet Records D2"]
                listPicker.reloadAllComponents()
                chosenSeason = row
            case "Indoor" :
                listDataSource = ["All Time List", "State Records"]
                listPicker.reloadAllComponents()
                chosenSeason = row
            case "Cross Country" :
                listDataSource = ["All Time List by Course", "All State"]
                listPicker.reloadAllComponents()
                chosenSeason = row
                
            default:
                listDataSource = ["All Time List", "State Records"]
                listPicker.reloadAllComponents()
                chosenSeason = row
            }
        } else if (pickerView == genderPicker) {
            switch genderDataSource[row] {
            case "Girls" :
                self.hurdlesThirty = "100 MH (30 in)"
                self.shotPutEightlb = "Shot Put (8 lb)"
                self.hurdlesTwoHundred = "200 MH"
                self.steeple = nil
                self.decathlon = nil
                chosenGender = row
            case "Boys" :
                self.hurdlesThirty = nil
                self.shotPutEightlb = nil
                self.hurdlesTwoHundred = nil
                self.steeple = "2000m Steeple"
                self.decathlon = "Decathlon"
                chosenGender = row
            default :
                chosenGender = row
            }
        } else if (pickerView == listPicker) {
            switch listDataSource[row] {
            case "All Time List" :
                categoryDataSource = ["Meter", "Field", "Relay", "Yard", "Class"]
                categoryPicker.reloadAllComponents()
                chosenList = row
            default :
                eventDataSource = ["Choose Event"]
            }
           
        } else if (pickerView == eventPicker) {
            chosenEvent = row
        } else if (pickerView == categoryPicker) {
            switch categoryDataSource[row] {
            case "Meter" :
                eventDataSource = [self.hurdlesThirty!, self.hurdlesTwoHundred!, "100 MH", "300 MH", "400 MH", "100", "200", "400", "800", "1500", "1600", self.steeple!, "3000", "3200", "5000"]
                eventPicker.reloadAllComponents()
                chosenCategory = row
            case "Field" :
                eventDataSource = ["High Jump", "Long Jump", "Triple Jump", "Pole Vault", "Shot Put", "Discus",  "Hammer Throw", "Javelin", self.decathlon!]
                eventPicker.reloadAllComponents()
                chosenCategory = row
            case "Relay" :
                eventDataSource = ["Shuttle Hurdles", "4x100", "4x200", "4x400", "Sprint Medley", "4X800", "Distance Medley", "4x1600", "High Jump", "Long Jump", "Triple Jump", "Pole Vault", "Shot Put", "Discus"]
                eventPicker.reloadAllComponents()
                chosenCategory = row
            case "Yard" :
                eventDataSource = ["100 Y", "220 Y", "Mile", "2 Mile"]
                eventPicker.reloadAllComponents()
                chosenCategory = row
            case "Class" :
                eventDataSource = ["100 MH", "300 MH", "100", "200", "400", "800", "1600", "3200", "High Jump", "Long Jump", "Triple Jump", "Pole Vault", "Shot Put", "Discus"]
            default :
                eventDataSource = ["100 MH (30 in.)", "200 MH", "100 MH", "300 MH", "400 MH", "100", "200", "400", "800", "1500", "1600", "3000", "3200", "5000"]
                eventPicker.reloadAllComponents()
                chosenCategory = row
            }
            chosenCategory = row
        }
        pickerView.reloadAllComponents()
    
    }
    // Choose season and click button to continue 
    // TODO: add more segues as more API calls are finalized
    @IBAction func chooseSeason(_ sender: UIButton) {
        if (seasonDataSource[chosenSeason] == "Outdoor" && genderDataSource[chosenGender] == "Girls" && listDataSource[chosenList] == "All Time List" && eventDataSource[chosenEvent] == "800") {
            self.performSegue(withIdentifier: "outdoorGirlsAllTimeSegue", sender: nil)
        }
        
    }

}

