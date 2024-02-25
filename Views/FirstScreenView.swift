//
//  SwiftUIView.swift
//
//
//  Created by Hmoo Myat Theingi on 24/02/2024.
//

import SwiftUI

struct FirstScreenView: View {
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack {
            if verticalSizeClass == .compact {
                Spacer(minLength: 20)
            } else {
                Spacer()
            }
            
            Text("Welcome To")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.black)
            Text("GERD Relief")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.black)
            
            Text("Start your journey to a healthier stomach today!")
                .foregroundColor(Colors.lightBlack)
                .font(.callout)
            
            Image("appLogo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(
                    width: verticalSizeClass == .compact ? 150 : 250,
                    height: verticalSizeClass == .compact ? 150 : 250
                )
                .padding()
            
            NavigationLink(destination: MenuView().navigationBarBackButtonHidden(true)) {
                HStack {
                    Text("Let's start")
                        .font(.headline)
                    Image(systemName: "chevron.right")
                        .font(.headline)
                }
                .foregroundColor(Color.black)
                .padding()
                .background(Colors.menuColor)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Colors.themeColor, lineWidth: 6)
                )
                .cornerRadius(10)
                
            }
            .buttonStyle(PlainButtonStyle())
            
            if verticalSizeClass == .compact {
                Spacer(minLength: 20)
            } else {
                Spacer()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            LinearGradient(gradient: Gradient(colors: [Colors.themeColor, Colors.menuColor]), startPoint: horizontalSizeClass == .compact ? .topLeading : .bottomTrailing,
                           endPoint: horizontalSizeClass == .compact ? .bottomTrailing : .topLeading)
        )
        .edgesIgnoringSafeArea(.all)
    }
}
