//
//  File.swift
//  
//
//  Created by Hmoo Myat Theingi on 24/02/2024.
//

import Foundation

struct Question {
    let id: Int
    let text: String
    let options: [String] = ["Yes","No","Sometimes"]
}

struct Quiz {
    var questions: [Question] = [
    Question(id: 1, text: "Do you experience heartburn after eating certain foods or meals?"),
    Question(id: 2, text: "Do spicy foods cause discomfort or a burning sensation in your chest or throat?"),
    Question(id: 3, text: "Do you find that consuming coffee or caffeinated beverages worsens your symptoms?"),
    Question(id: 4, text: "Does eating large meals make you feel uncomfortable or lead to acid reflux?"),
    Question(id: 5, text: "Do symptoms like heartburn or regurgitation occur or worsen when lying down or bending over?"),
    Question(id: 6, text: "Have you noticed an improvement in your symptoms when you elevate your head while sleeping?"),
    Question(id: 7, text: "Do fatty or fried foods trigger your symptoms?"),
    Question(id: 8, text: "Does consuming alcohol lead to discomfort or reflux symptoms?"),
    Question(id: 9, text: "Do you use over-the-counter antacids or acid reducers to relieve your symptoms, and do they help?"),
    Question(id: 10, text: "Have you noticed a link between your stress levels and your symptoms?")
    
    
    ]
    
    var responses: [Int:Int] = [:]
}
