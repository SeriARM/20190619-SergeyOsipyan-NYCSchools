//
//  SATScore.swift
//  Coding Challenge: NYC Schools
//
//  Created by Sergey Osipyan on 6/19/19.
//  Copyright © 2019 Sergey Osipyan. All rights reserved.
//

import Foundation

// MARK: - SATScoreElement
struct SATScoreElement: Codable {
    let dbn, schoolName, numOfSatTestTakers, satCriticalReadingAvgScore: String?
    let satMathAvgScore, satWritingAvgScore: String?
    
    enum CodingKeys: String, CodingKey {
        case dbn
        case schoolName = "school_name"
        case numOfSatTestTakers = "num_of_sat_test_takers"
        case satCriticalReadingAvgScore = "sat_critical_reading_avg_score"
        case satMathAvgScore = "sat_math_avg_score"
        case satWritingAvgScore = "sat_writing_avg_score"
    }
}
