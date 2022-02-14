//
//  SchoolDetailViewController.swift
//  20220213-SrikanthThota-NYCSchools
//
//  Created by Srikanth on 2/13/22.
//

import UIKit

class SchoolDetailsViewController: UIViewController {
    
    var scoreInfo: satInfo?
    
    @IBOutlet weak var schoolNameTitleLabel: UILabel!
    @IBOutlet weak var schoolNameLabel: UILabel!
    @IBOutlet weak var testTakersLabel: UILabel!
    @IBOutlet weak var readingScoreLabel: UILabel!
    @IBOutlet weak var mathScoreLabel: UILabel!
    @IBOutlet weak var writingScoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = "Schools Details"
        navigationController?.navigationBar.prefersLargeTitles = true
        schoolNameTitleLabel.font = FontBook.title
        schoolNameLabel.font = FontBook.labels
        schoolNameLabel.textAlignment = .left
        schoolNameLabel.numberOfLines = 0
        testTakersLabel.font = FontBook.labels
        readingScoreLabel.font = FontBook.labels
        mathScoreLabel.font = FontBook.labels
        writingScoreLabel.font = FontBook.labels
        if let info = scoreInfo {
            self.schoolNameTitleLabel.text = "School Name"
            self.schoolNameLabel.text = info.schoolName ?? "unknown"
            self.testTakersLabel.text = "Number of Test Takers: " + (info.testTakers ?? "unknown")
            self.readingScoreLabel.text = "readingScore: " + (info.readingScore ?? "unknown")
            self.mathScoreLabel.text = "mathScore: " + (info.mathScore ?? "unknown")
            self.writingScoreLabel.text = "writingScore: " + (info.writingScore ?? "unknown")
        }
    }

}
