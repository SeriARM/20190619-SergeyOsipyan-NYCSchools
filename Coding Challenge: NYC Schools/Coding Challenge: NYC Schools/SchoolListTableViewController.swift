//
//  SchoolListTableViewController.swift
//  Coding Challenge: NYC Schools
//
//  Created by Sergey Osipyan on 6/19/19.
//  Copyright © 2019 Sergey Osipyan. All rights reserved.
//

import UIKit

class SchoolListTableViewController: UITableViewController {

    var schools: [SchoolElement] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "NYC High Schools"
        SchoolController.shared.getAllSchoolsDetails { (schools) in
            self.schools = schools
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return schools.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "schoolCell", for: indexPath)
        let school = schools[indexPath.row]
        cell.textLabel?.text = school.schoolName
        if let totalStudents = school.totalStudents, let address = school.location {
            cell.detailTextLabel?.text = """
            Total Students: \(totalStudents)
            Address: \(address)
            """
        } else {
            cell.detailTextLabel?.text = "N/A"
        }
        
        return cell
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "schoolDetails" {
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            let school = schools[indexPath.row]
            let destinationVC = segue.destination as! SchoolDetailViewController
            destinationVC.school = school
//            guard let schoolID = school.dbn else { return }
//            SchoolController.shared.getAllSchoolsSATScores(schoolID: schoolID) { (satScores) in
//                destinationVC.schoolSATScore = satScores
//            }
        }
    }
    

}
