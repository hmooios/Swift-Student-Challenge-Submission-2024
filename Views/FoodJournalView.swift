//
//  SwiftUIView.swift
//
//
//  Created by Hmoo Myat Theingi on 24/02/2024.
//

import SwiftUI

struct FoodJournalView: View {
    @State private var mealEntries: [MealEntry] = []
    @State private var showingAddMealView = false
    
    private func loadMeals() {
        if let savedMeals = UserDefaults.standard.data(forKey: "meals") {
            if let decodedMeals = try? JSONDecoder().decode([MealEntry].self, from: savedMeals) {
                mealEntries = decodedMeals
                return
            }
        }
        mealEntries = []
    }
    
    private func saveMeals() {
        if let encoded = try? JSONEncoder().encode(mealEntries) {
            UserDefaults.standard.set(encoded, forKey: "meals")
        }
    }
    func symptomSeverityEmoji(for severity: Int) -> String {
        switch severity {
        case 1...4:
            return "😞"
        case 5:
            return "😐"
        case 6...10:
            return "😊"
        default:
            return "🤔"
        }
    }
    
    
    var body: some View {
        List {
            ForEach(mealEntries) { entry in
                VStack(alignment: .leading) {
                    Text(entry.mealType).font(.headline)
                    HStack {
                        Text(symptomSeverityEmoji(for: entry.symptomSeverity))
                        Text(entry.description)
                    }
                    Text(entry.time, style: .date)
                    Text(entry.time, style: .time)
                }
            }
            .onDelete(perform: removeMeals)
        }
        
        .navigationTitle("Food Journal")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(trailing: Button(action: {
            showingAddMealView = true
        }) {
            Image(systemName: "plus")
        })
        .sheet(isPresented: $showingAddMealView) {
            AddMealDetailsView(mealEntries: $mealEntries, onSave: {
                self.saveMeals()
            })
        }
        .onAppear(perform: loadMeals)
    }
    
    func removeMeals(at offsets: IndexSet) {
        mealEntries.remove(atOffsets: offsets)
        saveMeals()
    }
}
