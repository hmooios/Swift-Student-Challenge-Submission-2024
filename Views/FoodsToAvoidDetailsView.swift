//
//  SwiftUIView.swift
//
//
//  Created by Hmoo Myat Theingi on 24/02/2024.
//

import SwiftUI

struct FoodsToAvoidDetailsView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    @State private var spicyFoodPopUpVisible = false
    @State private var alcoholPopUpVisible = false
    @State private var caffeinePopUpVisible = false
    @State private var mintPopUpVisible = false
    
    
    var body: some View {
        ZStack{
            ScrollView(showsIndicators: false) {
                VStack{
                    FoodToAvoidTitlte
                    FoodToAvoidCategory
                }
            }
            
            Rectangle()
                .fill(Color.black.opacity(spicyFoodPopUpVisible || alcoholPopUpVisible || caffeinePopUpVisible || mintPopUpVisible  ? 0.4 : 0))
                .animation(.easeInOut(duration: 0.3), value: spicyFoodPopUpVisible || alcoholPopUpVisible || caffeinePopUpVisible || mintPopUpVisible)
                .ignoresSafeArea(.all)
            
            
            if spicyFoodPopUpVisible{
                FoodView(isPresented: $spicyFoodPopUpVisible, colorScheme: _colorScheme, foods: Food(emojiHeader: "🌶️", emoji1: "🥘", emoji2: "🍟", emoji3: "🥫", emoji4: "🌶️", nameHeader: "Spicy Food", name1: "Curries", name2: "Spicy snacks", name3: "Hot Sauces", name4: "Chili Pepper"),  title: "Common spicy food to avoid")
            }else if alcoholPopUpVisible{
                FoodView(isPresented: $alcoholPopUpVisible, colorScheme: _colorScheme, foods: Food(emojiHeader: "🍺", emoji1: "🍺", emoji2: "🍷", emoji3: "🥂", emoji4: "🍸",nameHeader: "Alcohol", name1: "Beer", name2: "Wine", name3: "Spirits", name4: "Cocktails"),  title: "Common alcohols to avoid")
            }else if caffeinePopUpVisible {
                FoodView(isPresented: $caffeinePopUpVisible
                         , colorScheme: _colorScheme, foods: Food(emojiHeader: "☕️", emoji1: "🥤", emoji2: "🧋", emoji3: "🥃", emoji4: "☕️",nameHeader: "Caffeine Drinks", name1: "Energy Drinks", name2: "Tea", name3: "Cola", name4: "Coffee"),  title: "Common Caffeine Drinks to avoid")
            }else if mintPopUpVisible{
                FoodView(isPresented: $mintPopUpVisible, colorScheme: _colorScheme, foods: Food(emojiHeader: "🍵", emoji1: "🤮", emoji2: "🍵", emoji3: "🍵", emoji4: "🤢",nameHeader: "Mint", name1: "Peppermint", name2: "Spearmint", name3: "Menthol", name4: "Wild Mint"),  title: "Common mints to avoid")
            }
            
        }.animation(.easeInOut(duration: 0.3), value: spicyFoodPopUpVisible || alcoholPopUpVisible || caffeinePopUpVisible || mintPopUpVisible)
    }
    
    var FoodToAvoidTitlte: some View {
        VStack{
            Text("🍽️")
                .font(.system(size: 60))
                
            Text("Click On Them To Discover Tips for Safe Consumption And Common Foods")
                .font(.title3)
                .padding(.vertical)
        }
    }
    
    var FoodToAvoidCategory: some View {
        VStack{
            HStack(alignment: .center,spacing: 55) {
                
                Button(action: {
                    spicyFoodPopUpVisible.toggle()
                }){
                    VStack{
                        ZStack {
                            Circle()
                                .fill(colorScheme == .light ? Colors.lightSpicyFood : Colors.darkSpicyFood)
                                .frame(width: 120,height: 120)
                            Text("🌶️")
                                .font(.system(size: 60))
                            
                        }
                        Text("Spicy Foods")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.secondary)
                        
                    }
                }
                Button(action: {
                    alcoholPopUpVisible.toggle()
                }){
                    VStack{
                        ZStack {
                            Circle()
                                .fill(colorScheme == .light ? Colors.lightBeer : Colors.darkBeer)
                                .frame(width: 120,height: 120)
                            Text("🍺")
                                .font(.system(size: 66))
                            
                        }
                        Text("Alcohol")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.secondary)
                        
                    }
                }
                
            }
            
            HStack(alignment: .center,spacing: 55) {
                
                Button(action: {
                    caffeinePopUpVisible.toggle()
                }){
                    VStack{
                        ZStack {
                            Circle()
                                .fill(colorScheme == .light ? Colors.lightBlack : Colors.darkCoffee)                                .frame(width: 120,height: 120)
                            Text("☕️")
                                .font(.system(size: 60))
                            
                        }
                        Text("Caffeine Drinks")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.secondary)
                        
                    }
                }
                Button(action: {
                    mintPopUpVisible.toggle()
                }){
                    VStack{
                        ZStack {
                            Circle()
                                .fill(colorScheme == .light ? Colors.lightMint : Colors.darkMint)                                .frame(width: 120,height: 120)
                            Text("🍵")
                                .font(.system(size: 66))
                            
                        }
                        Text("Mint")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.secondary)
                        
                    }
                }
                
            }
        }
        .padding(.vertical,12)
    }
    
}
