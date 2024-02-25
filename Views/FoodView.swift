//
//  SwiftUIView.swift
//  
//
//  Created by Hmoo Myat Theingi on 24/02/2024.
//

import SwiftUI

struct FoodView: View {
    @Binding var isPresented: Bool
    @Environment(\.colorScheme) var colorScheme
    var foods: Food
    var title: String
    
    var body: some View {
            GeometryReader { geometry in

                        VStack {
                            ScrollView(showsIndicators: false) {
                                HStack {
                                    Text(foods.emojiHeader)
                                        .font(.system(size: 30))
                                    Text(foods.nameHeader)
                                        .font(.headline)
                                        .fontWeight(.semibold)
                                        .foregroundColor(colorScheme == .light ? .secondary : .primary)
                                    Spacer()
                                    DismissButton {
                                        isPresented = false
                                    }
                                }
                                Text(title)
                                    .font(.body)
                                    .foregroundColor(colorScheme == .light ? .black : .white)
                                
                                HStack(spacing: 44) {
                                    VStack {
                                        ZStack {
                                            Circle()
                                                .fill(Colors.menuColor)
                                                .frame(width: 80, height: 80)
                                            Text(foods.emoji1)
                                                .font(.system(size: 40))
                                        }
                                        Text(foods.name1)
                                            .foregroundColor(colorScheme == .light ? .primary : .white)
                                    }
                                    VStack {
                                        ZStack {
                                            Circle()
                                                .fill(Colors.menuColor)
                                                .frame(width: 80, height: 80)
                                            Text(foods.emoji2)
                                                .font(.system(size: 40))
                                        }
                                        Text(foods.name2)
                                            .foregroundColor(colorScheme == .light ? .primary : .white)
                                    }
                                }
                                
                                HStack(spacing: 44) {
                                    VStack {
                                        ZStack {
                                            Circle()
                                                .fill(Colors.menuColor)
                                                .frame(width: 80, height: 80)
                                            Text(foods.emoji3)
                                                .font(.system(size: 40))
                                        }
                                        Text(foods.name3)
                                            .foregroundColor(colorScheme == .light ? .primary : .white)
                                    }
                                    VStack {
                                        ZStack {
                                            Circle()
                                                .fill(Colors.menuColor)
                                                .frame(width: 80, height: 80)
                                            Text(foods.emoji4)
                                                .font(.system(size: 40))
                                        }
                                        Text(foods.name4)
                                            .foregroundColor(colorScheme == .light ? .primary : .white)
                                    }
                                }
                                
                                ZStack {
                                    Rectangle()
                                        .fill(Colors.menuColor)
                                        .frame(width: .infinity, height: 240)
                                        .cornerRadius(10)
                                    
                                    VStack(alignment: .leading, spacing: 11) {
                                        Text("🍀 Tips for Consumption")
                                            .font(.title3)
                                            .bold()
                                            .foregroundColor( .black)
                                        Text("• Begin with very small amounts to gauge how your body reacts.")
                                        Text("• Drink plenty of water while consuming ")
                                        Text("• Avoid eating or drinking close to bedtime")
                                    }
                                    .padding()
                                    .foregroundColor(.black)
                                }
                            }
                            .padding(.horizontal, 20)
                            .padding(.vertical,20)
                            .frame(width: geometry.size.width * 0.9 , height: geometry.size.height * 0.8)
                            .background(colorScheme == .light ? Color.white : Color(UIColor.systemGray6))
                            .cornerRadius(10)
                            .shadow(radius: 5)
                            .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                        }
                    .navigationBarHidden(true)

                
            }

    }
    
}
