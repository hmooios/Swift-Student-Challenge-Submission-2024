//
//  SwiftUIView.swift
//
//
//  Created by Hmoo Myat Theingi on 24/02/2024.
//

import SwiftUI

struct ResultsView: View {
    let quiz: Quiz
    var manager: QuestionManager
    
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
        let evaluation = evaluate(quiz: quiz)
        let resultType = getResultType(for: evaluation)
        
        GeometryReader { geometry in
            VStack() {
                Text("Your GERD Test Result")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.bottom, 20)
                
                Image(systemName: resultType.icon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                    .foregroundColor(resultType.color)

                Text(evaluation)
                    .foregroundColor(.black)
                    .padding()
                    .background(self.backgroundColor)
                    .cornerRadius(10)
                    .frame(width: .infinity,
                           height: horizontalSizeClass == .compact ? geometry.size.height * 0.5 : geometry.size.height * 0.2
                    )
                    
                
                
                Button(action: {
                    manager.resetQuiz()
                }) {
                    HStack {
                        Image(systemName: "chevron.left")
                            .font(.headline)
                        Text("Test again!")
                            .font(.headline)
                        
                    }
                    .foregroundColor(Colors.lightBlack)
                    .padding()
                    .background(Color.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Colors.themeColor, lineWidth: 6)
                    )
                    .cornerRadius(10)
                    
                }
                .padding()
            }
            .frame(width: geometry.size.width ,height: geometry.size.height * 0.9)
            .position(x: geometry.size.width/2, y: geometry.size.height/2)
            
        }
    }
    
    
    var backgroundColor: Color {
        colorScheme == .dark ? Colors.themeColor : Colors.menuColor
        
    }
    
    func evaluate(quiz: Quiz) -> String {
        let yesCount = quiz.responses.values.filter { $0 == 0 }.count
        
        switch yesCount {
        case 6...:
            return "Indications strongly suggest GERD. Consultation with a healthcare provider is recommended for a detailed evaluation and discussion on treatment options."
        case 3...5:
            return "There are some indications of GERD, but further observation or tests are needed. Monitoring symptoms and possibly keeping a food and symptom diary is recommended."
        default:
            return "GERD is not the likely cause of your symptoms. It's important to monitor your condition and consult a healthcare provider for any changes."
        }
    }
    
    func getResultType(for evaluation: String) -> (icon: String, color: Color) {
        switch evaluation {
        case let str where str.contains("strongly suggest GERD"):
            return ("exclamationmark.triangle.fill", .red)
        case let str where str.contains("some indications of GERD"):
            return ("questionmark.circle.fill", .yellow)
        default:
            return ("checkmark.circle.fill", .green)
        }
    }
    
}

