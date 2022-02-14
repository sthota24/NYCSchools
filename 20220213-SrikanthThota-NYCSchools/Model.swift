//
//  Model.swift
//  20220213-SrikanthThota-NYCSchools
//
//  Created by Srikanth on 2/13/22.
//

import Foundation

struct schoolName: Codable {
    let dbn: String?
    let schoolName: String?
    let stateCode: String?
    
    enum CodingKeys: String, CodingKey {
        case dbn
        case schoolName = "school_name"
        case stateCode = "state_code"
    }
}

struct satInfo: Codable {
    let dbn: String?
    let schoolName: String?
    let testTakers: String?
    let readingScore: String?
    let mathScore: String?
    let writingScore: String?
    
    enum CodingKeys: String, CodingKey {
        case dbn
        case schoolName = "school_name"
        case testTakers = "num_of_sat_test_takers"
        case readingScore = "sat_critical_reading_avg_score"
        case mathScore = "sat_math_avg_score"
        case writingScore = "sat_writing_avg_score"
    }
}
