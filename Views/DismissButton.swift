//
//  SwiftUIView.swift
//  
//
//  Created by Hmoo Myat Theingi on 24/02/2024.
//

import SwiftUI

struct DismissButton: View {
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            ZStack {
                Circle()
                    .stroke(Colors.themeColor, lineWidth: 2)
                    .frame(width: 30, height: 30)
                Text("✘")
                    .foregroundColor(Colors.themeColor)
                    .font(.system(size: 24, weight: .bold))
            }
        }
    }
}

