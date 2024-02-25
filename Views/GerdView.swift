//
//  SwiftUIView.swift
//  
//
//  Created by Hmoo Myat Theingi on 24/02/2024.
//

import SwiftUI

struct GerdView: View {
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
                        Text("🩺")
                            .font(.system(size: 30))
                        Text("What's GERD?")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(colorScheme == .light ? .secondary : .primary)
                        Spacer()
                        DismissButton {
                            isPresented = false
                        }
                    }
                    Spacer()
                    Text("Gastroesophageal Reflux Disease (GERD) is a digestive disorder where stomach acid frequently flows back into the esophagus, leading to irritation and discomfort.")
                        .font(.body)
                        .foregroundColor(colorScheme == .light ? .black : .white)
                    
                    Spacer()
                    
                    NavigationLink(destination: GerdDetailsView()) {
                        HStack {
                            Text("I want to learn more!")
                                .font(.headline)
                            Image(systemName: "chevron.right")
                                .font(.headline)
                        }
                        .foregroundColor(colorScheme == .light ? Colors.lightBlack : Color.white)
                        .padding()
                        .background(colorScheme == .light ? Color.white : Color.black)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Colors.themeColor, lineWidth: 6)
                        )
                        .cornerRadius(10)
                        
                    }
                    Spacer()
                }
                .padding(.horizontal,20)
                .padding(.vertical,3)
                .frame(width: geometry.size.width * 0.8,height: 340)
                .background(colorScheme == .light ? Color.white : Color(UIColor.systemGray6))
                .cornerRadius(10)
                .shadow(radius: 5)
                .position(x: geometry.size.width/2, y: geometry.size.height/2)
            }
        }
    }
}
