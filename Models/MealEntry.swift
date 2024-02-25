//
//  File.swift
//  
//
//  Created by Hmoo Myat Theingi on 24/02/2024.
//

import Foundation

struct MealEntry: Identifiable, Codable {
    var id = UUID()
    var mealType: String
    var description: String
    var time: Date
    var symptomSeverity: Int 
}
