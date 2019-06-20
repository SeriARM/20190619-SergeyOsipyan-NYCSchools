//
//  SchoolController.swift
//  Coding Challenge: NYC Schools
//
//  Created by Sergey Osipyan on 6/19/19.
//  Copyright © 2019 Sergey Osipyan. All rights reserved.
//

import Foundation
import Alamofire

class SchoolController {
    
    static let shared = SchoolController()
    
    
    func getAllSchoolsDetails(completion: @escaping ([SchoolElement]) -> Void = { _ in }) {
        
        let schoolElementsEndpoint: String = "https://data.cityofnewyork.us/resource/s3k6-pzi2.json"
        // Guarding creation the API url endpoint
        guard let baseURL = URL(string: schoolElementsEndpoint) else {
            print("Error: cannot create URL")
            return
        }
        //create the session object
        let session = URLSession.shared
        //now create the URLRequest object using the url object
        var request = URLRequest(url: baseURL)
        request.httpMethod = "GET" //set http method as GET
        // Create URL session to get data from endpoint
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            // An error occurred with the data that was retrieved
            guard error == nil else {
                print("Error: cannot get data - \(String(describing: error))")
                return
            }
            guard let data = data else {
                print("Error: cannot get data")
                return
            }
            do {
                let jsonDecoder = JSONDecoder()
                //create json object from data
                let decodedTeam = try jsonDecoder.decode([SchoolElement].self, from: data)
                completion(decodedTeam)
            } catch let error {
                print(error.localizedDescription)
            }
        })
        task.resume()
        
    }
    
    func getAllSchoolsSATScores(schoolID: String, completion: @escaping (SATScoreElement) -> Void = { _ in }) {
        
        let schoolSATScoreElementsEndpoint: String = "https://data.cityofnewyork.us/resource/f9bf-2cp4.json?dbn=" + schoolID
        // Guarding creation the API url endpoint
        guard let baseURL = URL(string: schoolSATScoreElementsEndpoint) else {
            print("Error: cannot create URL")
            return
        }
        //create the session object
        let session = URLSession.shared
        //now create the URLRequest object using the url object
        var request = URLRequest(url: baseURL)
        request.httpMethod = "GET" //set http method as GET
        // Create URL session to get data from endpoint
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            // An error occurred with the data that was retrieved
            guard error == nil else {
                print("Error: cannot get data - \(String(describing: error))")
                return
            }
            guard let data = data else {
                print("Error: cannot get data")
                return
            }
            // Convert to a string and print
            if let JSONString = String(data: data, encoding: String.Encoding.utf8) {
                print(JSONString)
            }
            do {
                let jsonDecoder = JSONDecoder()
                //create json object from data
                let decodedTeam = try jsonDecoder.decode([SATScoreElement].self, from: data)
                guard let satScore = decodedTeam.first else { return }
                completion(satScore)
            } catch let error {
                print(error.localizedDescription)
            }
        })
        task.resume()
        
    }
}
