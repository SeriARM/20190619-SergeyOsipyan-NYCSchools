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
    var searchedSchool: [SchoolElement]?
    var isSearching = false
    @IBOutlet weak var searchBar: UISearchBar!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "NYC High Schools"
        SchoolController.shared.getAllSchoolsDetails { (schools) in
            self.schools = schools
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        // search delegate
        searchBar.delegate = self
    }
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if self.isSearching {
            if let searchedData = self.searchedSchool {
                return searchedData.count
            }
        }
        return schools.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "schoolCell", for: indexPath)
        var school: SchoolElement?
        if self.isSearching {
            if let searchedData = self.searchedSchool {
                school = searchedData[indexPath.row]
            }
        } else {
            school = schools[indexPath.row]
        }
        guard let schoolForCell = school else { return cell}
        cell.textLabel?.text = schoolForCell.schoolName
        if let totalStudents = schoolForCell.totalStudents {
            if let addres = schoolForCell.location {
                
            cell.detailTextLabel?.text = """
            Total Students: \(totalStudents)
            Address: \(addres.components(separatedBy: "(")[0])
            """
            }
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
        }
    }
    

}

extension SchoolListTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Text is: \(searchText)")
        self.searchedSchool = self.schools.filter({ (text:SchoolElement) -> Bool in
            return (text.schoolName?.trimmingCharacters(in: CharacterSet.whitespaces).lowercased().contains(searchText.trimmingCharacters(in: .whitespaces).lowercased()))!
        })
        
        if let filterData = searchedSchool, filterData.count > 0 {
            self.isSearching = true
        }
        else {
            self.isSearching = false
        }
        self.tableView.reloadData()
        
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.isSearching = true
    }
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        self.isSearching = false
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.resignFirstResponder()
        searchBar.showsCancelButton = false
        tableView.reloadData()
        self.isSearching = false
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.isSearching = false
    }
}
