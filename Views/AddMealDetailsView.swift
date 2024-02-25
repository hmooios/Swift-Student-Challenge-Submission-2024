//
//  SwiftUIView.swift
//
//
//  Created by Hmoo Myat Theingi on 24/02/2024.
//

import SwiftUI

struct AddMealDetailsView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var mealEntries: [MealEntry]
    var onSave: () -> Void
    
    @State private var selectedMealType = "Breakfast"
    @State private var mealDescription = ""
    @State private var mealDate = Date()
    @State private var mealTime = Date()
    @State private var symptomSeverityValue: Double = 5
    
    let mealTypes = ["Breakfast", "Lunch", "Snack", "Dinner"]
    
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
        NavigationView {
            Form {
                Picker("Meal Type", selection: $selectedMealType) {
                    ForEach(mealTypes, id: \.self) { Text($0) }
                }
                
                TextField("Description", text: $mealDescription)
                
                VStack(alignment: .center) {
                    Text("Rate your acid reflux symptoms after this meal")
                        .font(.headline)
                    Slider(value: $symptomSeverityValue, in: 1...10, step: 1)
                        .padding()
                    Text("Symptom Severity: \(symptomSeverityEmoji(for: Int(symptomSeverityValue)))")
                        .font(.title3)
                }
                
                DatePicker("Date", selection: $mealDate, displayedComponents: .date)
                
                DatePicker("Time", selection: $mealTime, displayedComponents: .hourAndMinute)
            }
            .navigationTitle("Add Meal")
            .navigationBarItems(trailing: Button("Save") {
                saveMeal()
            })
        }
        .accentColor(Colors.themeColor)
    }
    
    private func saveMeal() {
        let calendar = Calendar.current
        let combinedDateComponents = calendar.dateComponents([.year, .month, .day], from: mealDate)
        let combinedTimeComponents = calendar.dateComponents([.hour, .minute], from: mealTime)
        let combinedDateTime = calendar.date(from: DateComponents(year: combinedDateComponents.year, month: combinedDateComponents.month, day: combinedDateComponents.day, hour: combinedTimeComponents.hour, minute: combinedTimeComponents.minute))
        
        let entry = MealEntry(mealType: selectedMealType, description: mealDescription, time: combinedDateTime ?? Date(), symptomSeverity: Int(symptomSeverityValue))
        
        mealEntries.append(entry)
        onSave()
        dismiss()
    }
}
