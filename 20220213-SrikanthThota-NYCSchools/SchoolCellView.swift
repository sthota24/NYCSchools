//
//  ListCellView.swift
//  20220213-SrikanthThota-NYCSchools
//
//  Created by Srikanth on 2/13/22.
//

import UIKit

import UIKit

class SchoolViewCell: UITableViewCell {
    
    @IBOutlet weak var schoolNameTitleLabel: UILabel!
    @IBOutlet weak var schoolNameLabel: UILabel!
    @IBOutlet weak var stateCodeTitleLabel: UILabel!
    @IBOutlet weak var stateCodeLabel: UILabel!
    
    func setup(model: schoolName) {
        schoolNameTitleLabel.text = "School Name:"
        stateCodeTitleLabel.text = "State Code:"
        
        schoolNameLabel.text = model.schoolName
        stateCodeLabel.text = model.stateCode
        
        schoolNameTitleLabel.font = FontBook.title
        stateCodeTitleLabel.font = FontBook.title
        schoolNameLabel.font = FontBook.labels
        stateCodeLabel.font = FontBook.labels
    }
}
