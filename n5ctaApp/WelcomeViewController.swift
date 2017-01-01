//
//  ViewController.swift
//  n5ctaApp
//
//  Created by Maeve McCoy on 2/20/18.
//  Copyright © 2018 Maeve McCoy. All rights reserved.
//

import UIKit
import MessageUI

class WelcomeViewController: UIViewController{

    @IBOutlet weak var allTimeListsButton: UIButton!
    @IBOutlet weak var stateRecordsButton: UIButton!
    @IBOutlet weak var meetRecords: UIButton!
    @IBOutlet weak var contactUsButton: UIBarButtonItem!
    @IBOutlet weak var moreInfoButton: UIBarButtonItem!
    
    @IBAction func clickAllTimeLists(_ sender: Any) {
        self.performSegue(withIdentifier: "allTimeListsSegue", sender: self)
    }
    @IBAction func clickStateRecords(_ sender: Any) {
        self.performSegue(withIdentifier: "stateRecordsSegue", sender: self)
    }
    @IBAction func clickMeetRecords(_ sender: Any) {
        self.performSegue(withIdentifier: "meetRecordsSegue", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.allTimeListsButton.layer.cornerRadius = 10
        self.stateRecordsButton.layer.cornerRadius = 10
        self.meetRecords.layer.cornerRadius = 10
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
    
    @IBAction func moreInformation(_ sender: UIBarButtonItem) {
        self.performSegue(withIdentifier: "moreInformationSegue", sender: self)
    }
    
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self as? MFMailComposeViewControllerDelegate
        
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
