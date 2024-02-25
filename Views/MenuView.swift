//
//  SwiftUIView.swift
//  
//
//  Created by Hmoo Myat Theingi on 24/02/2024.
//

import SwiftUI

struct MenuView: View {
    
    @State private var gerdViewPopUpVisible = false
    @State private var avoidFoodPopUpVisible = false
    @State private var quickQuizPopUpVisible = false
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        
            ZStack{
                ScrollView(showsIndicators: false) {
                    HStack {
                        Button(action: {
                            gerdViewPopUpVisible.toggle()
                        }){
                            VStack(alignment: .leading){
                                Text("🩺")
                                    .font(.system(size: 60))
                                    .frame(width: 100, height: 100)
                                    .padding(40)
                                    .background {
                                        RoundedRectangle(cornerRadius: 15, style: .continuous)
                                            .foregroundColor(Colors.menuColor)
                                    }
                                Text("What's GERD?")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.secondary)
                            }
                            
                        }
                        .buttonStyle(PlainButtonStyle())
                        Button(action: {
                            avoidFoodPopUpVisible.toggle()
                        }){
                            VStack(alignment: .leading){
                                Text("🍽️")
                                    .font(.system(size: 60))
                                    .frame(width: 100, height: 100)
                                    .padding(40)
                                    .background {
                                        RoundedRectangle(cornerRadius: 15, style: .continuous)
                                            .foregroundColor(Colors.menuColor)
                                    }
                                Text("Foods To Avoid")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.secondary)
                            }
                            
                        }
                        
                        .buttonStyle(PlainButtonStyle())
                    }
                    .padding()
                    
                    HStack {
                        Button(action: {
                            quickQuizPopUpVisible.toggle()
                        }){
                            VStack(alignment: .leading){
                                Text("❓")
                                    .font(.system(size: 60))
                                    .frame(width: 100, height: 100)
                                    .padding(40)
                                    .background {
                                        RoundedRectangle(cornerRadius: 15, style: .continuous)
                                            .foregroundColor(Colors.menuColor)
                                    }
                                Text("Test Yourself")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.secondary)
                            }
                            
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        NavigationLink(destination: FoodJournalView()){
                            VStack(alignment: .leading){
                                Text("📝")
                                    .font(.system(size: 60))
                                    .frame(width: 100, height: 100)
                                    .padding(40)
                                    .background {
                                        RoundedRectangle(cornerRadius: 15, style: .continuous)
                                            .foregroundColor(Colors.menuColor)
                                    }
                                Text("My Food Journal")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.secondary)
                            }
                        }

                        .buttonStyle(PlainButtonStyle())
                    }
                    .padding()
                   
                }
                Rectangle()
                    .fill(
                        colorScheme == .light ? Color.black.opacity(gerdViewPopUpVisible || avoidFoodPopUpVisible || quickQuizPopUpVisible ? 0.4 : 0) : Colors.menuColor.opacity(gerdViewPopUpVisible || avoidFoodPopUpVisible || quickQuizPopUpVisible ? 0.4 : 0)
                        
                    )
                    .edgesIgnoringSafeArea(.all)
                    .animation(.easeInOut(duration: 0.3), value: gerdViewPopUpVisible || avoidFoodPopUpVisible || quickQuizPopUpVisible)
                
                if gerdViewPopUpVisible {
                    GerdView(isPresented: $gerdViewPopUpVisible)
                } else if avoidFoodPopUpVisible {
                    FoodsToAvoidView(isPresented: $avoidFoodPopUpVisible)
                }else if quickQuizPopUpVisible{
                    QuickQuizView(isPresented: $quickQuizPopUpVisible)
                }
                
            }
            .navigationBarHidden(false)
            .navigationTitle("GERD Relief")
            .navigationBarTitleDisplayMode(.inline)
        
    }
}
