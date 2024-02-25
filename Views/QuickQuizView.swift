//
//  SwiftUIView.swift
//  
//
//  Created by Hmoo Myat Theingi on 24/02/2024.
//
import SwiftUI

struct QuickQuizView: View {
    @Binding var isPresented: Bool
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.secondary.opacity(colorScheme == .light ? 0.1 : 0.2)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Spacer()
                    HStack{
                        Text("❓")
                            .font(.system(size: 30))
                        Text("Test Yourself")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(colorScheme == .light ? .secondary : .primary)
                        Spacer()
                        DismissButton {
                            isPresented = false
                        }
                    }
                    Spacer()

                    Text("This test can reveal whether GERD might be the cause of your symptoms, helping you seek timely treatment and relief.")
                        .foregroundColor(colorScheme == .light ? .black : .white)
                    Spacer()

                    NavigationLink(destination: GerdQuestionnaireView()) {
                        HStack {
                            Text("I'm interested!")
                                .font(.headline)
                            Image(systemName: "chevron.right")
                                .font(.headline)
                        }
                        .foregroundColor(colorScheme == .light ? Colors.lightBlack : Color.white)
                        .padding()
                        .background(colorScheme == .light ? Color.white : Color(UIColor.systemGray6))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Colors.themeColor, lineWidth: 6)
                        )
                        .cornerRadius(10)
                    }
                    Spacer()

                }
                .padding(.horizontal,20)
                .padding(.vertical,10)
                .frame(width: geometry.size.width * 0.8,height: 280)
                .background(colorScheme == .light ? Color.white : Color(UIColor.systemGray6))
                .cornerRadius(10)
                .shadow(radius: 5)
                .position(x: geometry.size.width/2, y: geometry.size.height/2)
            }
        }
    }
}
