//
//  SchoolDetailViewController.swift
//  Coding Challenge: NYC Schools
//
//  Created by Sergey Osipyan on 6/19/19.
//  Copyright © 2019 Sergey Osipyan. All rights reserved.
//

import UIKit

class SchoolDetailViewController: UIViewController {

    var school: SchoolElement?
    var schoolSATScore: SATScoreElement?
    
    @IBOutlet weak var schoolName: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var phoneNumber: UILabel!
    @IBOutlet weak var faxNumber: UILabel!
    @IBOutlet weak var emailAddress: UILabel!
    @IBOutlet weak var websiteURL: UILabel!
    @IBOutlet weak var numberOfStudents: UILabel!
    
    @IBOutlet weak var avgMath: UILabel!
    @IBOutlet weak var avgWritung: UILabel!
    @IBOutlet weak var avgReading: UILabel!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
        guard let schoolID = school?.dbn else { return }
        SchoolController.shared.getAllSchoolsSATScores(schoolID: schoolID) { (satScores) in
            self.schoolSATScore = satScores
            DispatchQueue.main.async {
                self.updateView()
            }
            
        }
    }
    
    func updateView() {
        
        guard let school = self.school, let schoolSATScore = schoolSATScore else { return }
        schoolName.text = school.schoolName
        address.text = school.location
        phoneNumber.text = school.phoneNumber
        faxNumber.text = school.faxNumber
        emailAddress.text =  school.schoolEmail
        websiteURL.text = school.website
        numberOfStudents.text = school.totalStudents
        avgMath.text = schoolSATScore.satMathAvgScore
        avgReading.text = schoolSATScore.satCriticalReadingAvgScore
        avgWritung.text = schoolSATScore.satWritingAvgScore
        
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
