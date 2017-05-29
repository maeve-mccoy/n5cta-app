//
//  ExpandableCell.swift
//  n5ctaApp
//
//  Created by Maeve McCoy on 5/27/17.
//  Copyright © 2017 Maeve McCoy. All rights reserved.
//

import UIKit

class ExpandableCell: UITableViewCell {
    
    @IBOutlet weak var cellTitle: UILabel!
    
    @IBOutlet weak var cellTitleHeight: NSLayoutConstraint!
    @IBOutlet weak var schoolLogoHeight: NSLayoutConstraint!
    @IBOutlet weak var schoolLogo: UIImageView!
    @IBOutlet weak var subtitle: UILabel!
    
    @IBOutlet weak var subtitleHeight: NSLayoutConstraint!
    
    var isExpanded:Bool = false
        {
        didSet
        {
            if !isExpanded {
                self.subtitleHeight.constant = 0.0
                self.cellTitleHeight.constant = 21.0
                self.schoolLogoHeight.constant = 44.0
            } else {
                self.subtitleHeight.constant = 128.0
                self.cellTitleHeight.constant = 0.0
                self.schoolLogoHeight.constant = 0.0
            }
        }
    }
    
}
