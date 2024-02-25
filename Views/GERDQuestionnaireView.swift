//
//  SwiftUIView.swift
//  
//
//  Created by Hmoo Myat Theingi on 24/02/2024.
//

import SwiftUI

struct GerdQuestionnaireView: View {
    @StateObject private var manager = QuestionManager(quiz: Quiz())
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                if !manager.showResults {
                    ProgressView(value: Double(manager.currentQuestionIndex), total: Double(manager.quiz.questions.count))
                        .progressViewStyle(LinearProgressViewStyle(tint: Colors.themeColor))
                        .padding()
                    
                    Text("\(manager.currentQuestionIndex * 10)% completed")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                    Spacer()
                    
                    Text(manager.quiz.questions[manager.currentQuestionIndex].text)
                        .font(.title3)
                        .padding()
                        .frame(width: geometry.size.width * 0.8, height: geometry.size.height * 0.3, alignment: .leading)
                        
                    Spacer()
                    
                    ForEach(0..<manager.quiz.questions[manager.currentQuestionIndex].options.count, id: \.self) { index in
                        Button(action: {
                            manager.quiz.responses[manager.quiz.questions[manager.currentQuestionIndex].id] = index
                            manager.moveToNextQuestion()
                        }) {
                            Text(manager.quiz.questions[manager.currentQuestionIndex].options[index])
                                .font(.headline)
                                .padding()
                                .frame(
                                    width: horizontalSizeClass == .compact ? geometry.size.width * 0.8 : geometry.size.width * 0.4,
                                    height: horizontalSizeClass == .compact ? 44 : 44
                                )
                                .background(Colors.themeColor)
                                .foregroundColor(Colors.lightBlack)
                                .cornerRadius(10)
                        }
                        .padding(.horizontal)
                    }
                    
                    Spacer()
                } else {
                    ResultsView(quiz: manager.quiz, manager: manager)
                        .frame(
                            width: horizontalSizeClass == .compact ? geometry.size.width * 0.8 : geometry.size.width * 0.8,
                            height: horizontalSizeClass == .compact ? geometry.size.height * 0.8 : geometry.size.width * 0.8
                        
                        )
                }
            }
            .padding()
            .position(x: geometry.size.width/2 , y: geometry.size.height/2)
        }
    }
}
