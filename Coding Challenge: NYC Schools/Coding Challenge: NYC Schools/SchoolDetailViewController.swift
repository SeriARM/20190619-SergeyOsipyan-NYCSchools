//
//  SchoolDetailViewController.swift
//  Coding Challenge: NYC Schools
//
//  Created by Sergey Osipyan on 6/19/19.
//  Copyright © 2019 Sergey Osipyan. All rights reserved.
//

import UIKit
import MapKit
import SafariServices

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
        // Parsing School SAT scores using school ID (dbn)
        SchoolController.shared.updateScores(schoolID: schoolID) { (scores, err) in
            self.schoolSATScore = scores?.first
            // updaiting UI after feching data
            DispatchQueue.main.async {
                self.updateView()
            }
        }
       
    }
    
    // Call to the school number
    @IBAction func callButtonTapped(_ sender: Any) {
        guard let phoneNumber = self.school?.phoneNumber else { return }
        if let url = URL(string: "tel://\(phoneNumber)") {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                let alert = UIAlertController(title: "Error", message: "Can not call to the number: \(phoneNumber)", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                present(alert, animated: true, completion: nil)
            }
        }
    }
    
    // Open the webstie on safari
    @IBAction func websiteButtonTapped(_ sender: Any) {
        guard let website = self.school?.website else { return }
        let websiteURL = (website.contains("://") ? "" : "http://") + website
        if let url = URL(string: websiteURL) {
            let svc = SFSafariViewController(url: url)
            present(svc, animated: true, completion: nil)
        } else {
                let alert = UIAlertController(title: "Error", message: "Can not open website", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                present(alert, animated: true, completion: nil)
            }
        }
    
    // fill labels with School information
    func updateView() {
        
        guard let school = self.school else { return }
        schoolName.text = school.schoolName
        if let addres = school.location {
            address.text = addres.components(separatedBy: "(")[0]
        }
        phoneNumber.text = school.phoneNumber
        faxNumber.text = school.faxNumber
        emailAddress.text =  school.schoolEmail
        websiteURL.text = school.website
        numberOfStudents.text = school.totalStudents
         if let schoolSATScore = schoolSATScore {
        avgMath.text = schoolSATScore.satMathAvgScore
        avgReading.text = schoolSATScore.satCriticalReadingAvgScore
        avgWritung.text = schoolSATScore.satWritingAvgScore
        }
        if let lat = Double(school.latitude!), let lng = Double(school.longitude!) {
            let highSchoolCoordinate2D: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: lat, longitude: lng)
            self.addHighSchoolAnnotaionWithCoordinates(highSchoolCoordinate2D)
        }
    }
    
    func addHighSchoolAnnotaionWithCoordinates(_ highSchoolCoordinates: CLLocationCoordinate2D){
        
        let highSchoolAnnotation = MKPointAnnotation()
        highSchoolAnnotation.coordinate = highSchoolCoordinates
        highSchoolAnnotation.title = school?.schoolName
        self.schoolMapView.addAnnotation(highSchoolAnnotation)
        let span = MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001)
        let region = MKCoordinateRegion(center: highSchoolAnnotation.coordinate, span: span)
        let adjustRegion = self.schoolMapView.regionThatFits(region)
        self.schoolMapView.setRegion(adjustRegion, animated:true)
    }
}
