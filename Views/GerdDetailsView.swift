//
//  SwiftUIView.swift
//  
//
//  Created by Hmoo Myat Theingi on 24/02/2024.
//
import SwiftUI

struct GerdDetailsView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 44) {
                GerdTitle
                GerdDefinition
                GerdSymptoms
                GerdCauses
                GerdTreatment
                GerdPrevention
            }
            .padding()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(maxWidth: 700)
    }
    
    
    var GerdTitle: some View {
        VStack {
            Text("🩺")
                .font(.system(size: 60))
        }
        .frame(maxWidth: .infinity, alignment: .center)
    }
    
    var GerdDefinition: some View {
        Text("Gastroesophageal Reflux Disease (GERD) is a digestive disorder where stomach acid frequently flows back into the esophagus, leading to irritation and discomfort.It can make you feel a burning sensation in your chest (like heartburn), or you might taste something sour or bitter in your mouth.")
            .font(.title3)
    }
    
    var GerdSymptoms: some View {
        VStack(alignment: .leading, spacing: 04) {
            Text("💊 Common symptoms")
                .font(.title3)
                .bold()
                .padding(.bottom, 8)
                Text("• Heartburn")
                Text("• Sour Taste in the Mouth")
                Text("• Trouble Swallowing")

        }
    }
    
    var GerdCauses: some View {
        VStack(alignment: .leading, spacing: 04) {
            Text("🩻 Causes")
                .font(.title3)
                .bold()
                .padding(.bottom, 8)
            Text("• Poor Lifestyle Choices")
            Text("• Weak Stomach Valve")
            Text("• Stomach Pushing into Chest Area")

        }
    }
    
    var GerdTreatment: some View {
        VStack(alignment: .leading, spacing: 04) {
            Text("🧬 Treatment")
                .font(.title3)
                .bold()
                .padding(.bottom, 8)
            Text("Lifestyle modifications: Avoiding foods that trigger symptoms, eating smaller meals, not lying down after eating, losing weight if overweight, and quitting smoking.")
            Text("Prescription medications: Stronger H2 blockers or PPIs, prokinetics to help strengthen the LES and empty the stomach faster.")
        }
    }
    
    var GerdPrevention: some View {
        VStack(alignment: .leading, spacing: 04) {
            Text("🍀 Prevention")
                .font(.title3)
                .bold()
                .padding(.bottom, 8)
            Text("Preventive measures for GERD focus on lifestyle changes to manage symptoms and avoid triggers. This includes dietary adjustments, maintaining a healthy weight, elevating the head while sleeping, and avoiding smoking and alcohol.")
            
        }
    }
}

