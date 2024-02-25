//
//  File.swift
//  
//
//  Created by Hmoo Myat Theingi on 24/02/2024.
//

import Foundation

class QuestionManager: ObservableObject {
    @Published var quiz: Quiz
    @Published var currentQuestionIndex = 0
    @Published var showResults = false
    
    init(quiz: Quiz) {
        self.quiz = quiz
    }
    
    func moveToNextQuestion() {
        if currentQuestionIndex < quiz.questions.count - 1 {
            currentQuestionIndex += 1
        } else {
            showResults = true
        }
    }
    
    func resetQuiz() {
        currentQuestionIndex = 0
        showResults = false
        quiz.responses = [:]
    }
}
