//
//  SchoolDetailViewController.swift
//  Coding Challenge: NYC Schools
//
//  Created by Sergey Osipyan on 6/19/19.
//  Copyright © 2019 Sergey Osipyan. All rights reserved.
//

import UIKit
import MapKit

class SchoolDetailViewController: UIViewController {
    
    var school: SchoolElement?
    var schoolSATScore: SATScoreElement?
    @IBOutlet weak var schoolMapView: MKMapView!
    
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
    // fill labels with School information
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
        if let lat = Double(school.latitude!), let lng = Double(school.longitude!) {
        let highSchoolCoordinate2D: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: lat, longitude: lng)
        self.addHighSchoolAnnotaionWithCoordinates(highSchoolCoordinate2D)
        }
    }
    
    func addHighSchoolAnnotaionWithCoordinates(_ highSchoolCoordinates: CLLocationCoordinate2D){
        
        let highSchoolAnnotation = MKPointAnnotation()
        highSchoolAnnotation.coordinate = highSchoolCoordinates
        self.schoolMapView.addAnnotation(highSchoolAnnotation)
        let span = MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001)
        let region = MKCoordinateRegion(center: highSchoolAnnotation.coordinate, span: span)
        let adjustRegion = self.schoolMapView.regionThatFits(region)
        self.schoolMapView.setRegion(adjustRegion, animated:true)
    }
}
