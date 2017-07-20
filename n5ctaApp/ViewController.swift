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

    // Picker outlets and action connections
    @IBOutlet weak var genderPicker: UIPickerView!
    @IBOutlet weak var seasonPicker: UIPickerView!
    @IBOutlet weak var listPicker: UIPickerView!
    @IBOutlet weak var eventPicker: UIPickerView!
    @IBOutlet weak var categoryPicker: UIPickerView!
    
    // Initializing data arrays for pickers
    var seasonOptions: [String] = []
    var genderOptions: [String] = []
    var categoryOptions: [String] = []
    var listOptions: [String] = []
    var eventOptions: [String] = []
    var currentSeason = ""
    var currentGender = ""
    var currentCategory = ""
    var currentList = ""
    var currentEvent = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Assigning the data source and delegate for each picker
        self.seasonPicker.dataSource = self;
        self.seasonPicker.delegate = self;
        
        self.genderPicker.dataSource = self;
        self.genderPicker.delegate = self;
        
        self.listPicker.dataSource = self;
        self.listPicker.delegate = self;
        
        self.eventPicker.dataSource = self;
        self.eventPicker.delegate = self;
        
        self.categoryPicker.dataSource = self;
        self.categoryPicker.delegate = self;
        
        let listLogicModel = ListLogicModel();
        
        seasonOptions = listLogicModel.seasonValues()
        currentSeason = seasonOptions[0]
        
        genderOptions = listLogicModel.genderValues()
        currentGender = genderOptions[0]
        
        categoryOptions = listLogicModel.categoryValues()
        currentCategory = categoryOptions[0]
        
        listOptions = listLogicModel.listValues()
        currentList = listOptions[0]
        
        eventOptions = listLogicModel.eventValues(season: currentSeason, gender: currentGender, category: currentCategory)
        currentEvent = eventOptions[0]
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

    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (pickerView == seasonPicker){
            return seasonOptions.count
        } else if (pickerView == genderPicker){
            return genderOptions.count
        } else if (pickerView == eventPicker) {
            return eventOptions.count
        } else if (pickerView == listPicker){
            return listOptions.count
        } else {
            return categoryOptions.count
        }
    }
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.characters.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var label = view as! UILabel!
        if label == nil {
            label = UILabel()
        }
        if (pickerView == seasonPicker) {
            let seasonTitle = seasonOptions[row]
            let title = NSAttributedString(string: seasonTitle, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 16.0, weight: UIFontWeightRegular)])
            label?.attributedText = title
            label?.textAlignment = .center
            label?.textColor = hexStringToUIColor(hex: "#003333")
            label?.adjustsFontSizeToFitWidth = true
            return label!
        } else if (pickerView == genderPicker) {
            let genderTitle = genderOptions[row]
            let title = NSAttributedString(string: genderTitle, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 16.0, weight: UIFontWeightRegular)])
            label?.attributedText = title
            label?.textAlignment = .center
            label?.textColor = hexStringToUIColor(hex: "#003333")
            label?.adjustsFontSizeToFitWidth = true
            return label!
        } else if (pickerView == listPicker){
            let listTitle = listOptions[row]
            let title = NSAttributedString(string: listTitle, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 16.0, weight: UIFontWeightRegular)])
            label?.attributedText = title
            label?.textAlignment = .center
            label?.textColor = hexStringToUIColor(hex: "#003333")
            label?.adjustsFontSizeToFitWidth = true
            return label!
        } else if (pickerView == eventPicker){
            let eventTitle = eventOptions[row]
            let title = NSAttributedString(string: eventTitle, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 16.0, weight: UIFontWeightRegular)])
            label?.attributedText = title
            label?.textAlignment = .center
            label?.textColor = hexStringToUIColor(hex: "#003333")
            label?.adjustsFontSizeToFitWidth = true
            return label!
        } else {
            let categoryTitle = categoryOptions[row]
            let title = NSAttributedString(string: categoryTitle, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 16.0, weight: UIFontWeightRegular)])
            label?.attributedText = title
            label?.textAlignment = .center
            label?.textColor = hexStringToUIColor(hex: "#003333")
            label?.adjustsFontSizeToFitWidth = true
            return label!
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (pickerView == seasonPicker){
            return "\(seasonOptions[seasonPicker.selectedRow(inComponent: 0)])"
        } else if (pickerView == genderPicker){
            return "\(genderOptions[genderPicker.selectedRow(inComponent: 0)])"
        } else if (pickerView == eventPicker) {
            return "\(eventOptions[eventPicker.selectedRow(inComponent: 0)])"
        } else if (pickerView == listPicker){
            return "\(listOptions[listPicker.selectedRow(inComponent: 0)])"
        } else {
            return "\(categoryOptions[categoryPicker.selectedRow(inComponent: 0)])"
        }
    }
    
    // Logic for changing pickers as new fields are selected
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        let listLogicModel = ListLogicModel();

        if (pickerView == seasonPicker) {
            currentSeason = seasonOptions[seasonPicker.selectedRow(inComponent: 0)]
            eventOptions = listLogicModel.eventValues(season: currentSeason, gender: currentGender, category: currentCategory)
            self.eventPicker.reloadAllComponents()
        } else if (pickerView == genderPicker) {
            currentGender = genderOptions[genderPicker.selectedRow(inComponent: 0)]
            eventOptions = listLogicModel.eventValues(season: currentSeason, gender: currentGender, category: currentCategory)
            self.eventPicker.reloadAllComponents()
        } else if (pickerView == listPicker) {
            currentList = listOptions[listPicker.selectedRow(inComponent: 0)]
            eventOptions = listLogicModel.eventValues(season: currentSeason, gender: currentGender, category: currentCategory)
            self.eventPicker.reloadAllComponents()
        } else if (pickerView == eventPicker) {
            currentEvent = eventOptions[eventPicker.selectedRow(inComponent: 0)]
            self.eventPicker.reloadAllComponents()
        } else if (pickerView == categoryPicker) {
            currentCategory = categoryOptions[categoryPicker.selectedRow(inComponent: 0)]
            eventOptions = listLogicModel.eventValues(season: currentSeason, gender: currentGender, category: currentCategory)
            self.eventPicker.reloadAllComponents()
        }
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "outdoorGirlsAllTimeSegue" ,
            let nextScene = segue.destination as? outdoorTableViewController {
            nextScene.event = currentEvent
        }
    }
    // Choose season and click button to continue
    // TODO: add more segues as more API calls are finalized
    @IBAction func chooseSeason(_ sender: UIButton) {
        if (currentSeason == "Outdoor" && currentGender == "Girls" && currentList == "All Time List") {
            self.performSegue(withIdentifier: "outdoorGirlsAllTimeSegue", sender: self)
        }
    }

}

