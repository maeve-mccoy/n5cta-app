//
//  MeetRecordsViewController.swift
//  n5ctaApp
//
//  Created by Maeve McCoy on 5/14/18.
//  Copyright © 2018 Maeve McCoy. All rights reserved.
//

import UIKit
import MessageUI


class MeetRecordsViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, MFMailComposeViewControllerDelegate {
    
    @IBOutlet weak var chooseMeetRecordsButton: UIButton!
    @IBOutlet weak var contactUsButton: UIBarButtonItem!
    @IBOutlet weak var moreInfoButton: UIBarButtonItem!
    
    
    // Picker outlets and action connections
    @IBOutlet weak var genderPicker: UIPickerView!
    @IBOutlet weak var seasonPicker: UIPickerView!
    @IBOutlet weak var categoryPicker: UIPickerView!
    @IBOutlet weak var meetPicker: UIPickerView!
    
    // Initializing data arrays for pickers
    var seasonOptions: [String] = ["Outdoor"]
    var genderOptions: [String] = []
    var categoryOptions: [String] = ["Track/Field", "Relays"]
    var meetOptions: [String] = ["State Meet", "Div. I State Meet", "Div. II State Meet", "Meet of Champions"]
    var currentSeason = ""
    var currentGender = ""
    var currentCategory = ""
    var currentMeet = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Assigning the data source and delegate for each picker
        self.seasonPicker.dataSource = self;
        self.seasonPicker.delegate = self;
        
        self.genderPicker.dataSource = self;
        self.genderPicker.delegate = self;
        
        self.categoryPicker.dataSource = self;
        self.categoryPicker.delegate = self;
        
        self.meetPicker.dataSource = self;
        self.meetPicker.delegate = self;
        
        let listLogicModel = ListLogicModel();
        currentSeason = seasonOptions[0]
        genderOptions = listLogicModel.genderValues()
        currentGender = genderOptions[0]
        currentCategory = categoryOptions[0]
        currentMeet = meetOptions[0]
        
        self.seasonPicker.layer.cornerRadius = 10;
        self.seasonPicker.layer.masksToBounds=true;
        
        self.genderPicker.layer.cornerRadius = 10;
        self.genderPicker.layer.masksToBounds=true;
        
        self.categoryPicker.layer.cornerRadius = 10;
        self.categoryPicker.layer.masksToBounds=true;
        
        self.meetPicker.layer.cornerRadius = 10;
        self.meetPicker.layer.masksToBounds=true;
        
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
        } else if (pickerView == categoryPicker ){
            return categoryOptions.count
        } else {
            return meetOptions.count
        }
    }
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
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
            let title = NSAttributedString(string: seasonTitle, attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 16.0, weight: UIFont.Weight.regular)])
            label?.attributedText = title
            label?.textAlignment = .center
            label?.textColor = hexStringToUIColor(hex: "#000000")
            label?.adjustsFontSizeToFitWidth = true
            return label!
        } else if (pickerView == genderPicker) {
            let genderTitle = genderOptions[row]
            let title = NSAttributedString(string: genderTitle, attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 16.0, weight: UIFont.Weight.regular)])
            label?.attributedText = title
            label?.textAlignment = .center
            label?.textColor = hexStringToUIColor(hex: "#000000")
            label?.adjustsFontSizeToFitWidth = true
            return label!
        } else if (pickerView == meetPicker) {
            let meetTitle = meetOptions[row]
            let title = NSAttributedString(string: meetTitle, attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 16.0, weight: UIFont.Weight.regular)])
            label?.attributedText = title
            label?.textAlignment = .center
            label?.textColor = hexStringToUIColor(hex: "#000000")
            label?.adjustsFontSizeToFitWidth = true
            return label!
        } else {
            let categoryTitle = categoryOptions[row]
            let title = NSAttributedString(string: categoryTitle, attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 16.0, weight: UIFont.Weight.regular)])
            label?.attributedText = title
            label?.textAlignment = .center
            label?.textColor = hexStringToUIColor(hex: "#000000")
            label?.adjustsFontSizeToFitWidth = true
            return label!
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (pickerView == seasonPicker){
            return "\(seasonOptions[seasonPicker.selectedRow(inComponent: 0)])"
        } else if (pickerView == genderPicker){
            return "\(genderOptions[genderPicker.selectedRow(inComponent: 0)])"
        } else if (pickerView == meetPicker){
            return "\(meetOptions[meetPicker.selectedRow(inComponent: 0)])"
        } else {
            return "\(categoryOptions[categoryPicker.selectedRow(inComponent: 0)])"
        }
    }
    
    // Logic for changing pickers as new fields are selected
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (pickerView == seasonPicker) {
            currentSeason = seasonOptions[seasonPicker.selectedRow(inComponent: 0)]
            if (currentSeason=="Cross Country") {
                categoryPicker.isUserInteractionEnabled = false
                self.categoryPicker.selectRow(0, inComponent: 0, animated: false)
            } else {
                categoryPicker.isUserInteractionEnabled = true
            }
            self.categoryPicker.reloadAllComponents()
        } else if (pickerView == genderPicker) {
            currentGender = genderOptions[genderPicker.selectedRow(inComponent: 0)]
        } else if (pickerView == categoryPicker) {
            currentCategory = categoryOptions[categoryPicker.selectedRow(inComponent: 0)]
        } else if (pickerView == meetPicker) {
            currentMeet = meetOptions[meetPicker.selectedRow(inComponent: 0)]
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(currentCategory == "Relays") {
            let nextSceneRelayMeetRecords = segue.destination as? RelayMeetRecordsTableViewController
            nextSceneRelayMeetRecords?.gender = currentGender
            nextSceneRelayMeetRecords?.category = currentCategory
            nextSceneRelayMeetRecords?.season = currentSeason
            nextSceneRelayMeetRecords?.meet = currentMeet
        } else {
            let nextSceneMeetRecords = segue.destination as? MeetRecordsTableViewController
            nextSceneMeetRecords?.gender = currentGender
            nextSceneMeetRecords?.category = currentCategory
            nextSceneMeetRecords?.season = currentSeason
            nextSceneMeetRecords?.meet = currentMeet
        }
    }
    
    // Choose season and click button to continue
    // TODO: add more segues as more API calls are finalized
    @IBAction func chooseMeetRecords(_ sender: UIButton) {
        if(currentCategory == "Relays") {
            self.performSegue(withIdentifier: "relayMeetRecordsSegue", sender: self)
        } else {
            self.performSegue(withIdentifier: "meetRecordsSegue", sender: self)
        }
    }
    
    @IBAction func moreInformation(_ sender: UIBarButtonItem) {
        self.performSegue(withIdentifier: "moreInformationSegue", sender: self)
    }
    
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        
        mailComposerVC.setToRecipients(["pmccoy@comcast.net"])
        mailComposerVC.setSubject("Re: n5cta app")
        
        return mailComposerVC
    }
    
    // MARK: MFMailComposeViewControllerDelegate Method
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    @IBAction func contactUs(_ sender: UIBarButtonItem) {
        let mailComposeViewController = configuredMailComposeViewController()
        if MFMailComposeViewController.canSendMail() {
            self.present(mailComposeViewController, animated: true, completion: nil)
        } else {
            self.showAlert(title: "Could not send email.", message: "Please test configuration and try again.")
        }
    }
    
}

