//
//  Calendar.swift
//  mealPlanner
//
//  Created by Jai Pise on 18/4/2021.
//

import Foundation
import SwiftUI

struct Calendar: View {
    var body: some View {
        VStack {
            Text("Calendar")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(20.0)
                
                
            
            DatePicker(selection: .constant(Date()), label: { Text("Choose a date (within the last 10 months)")
            })
                .padding(30.0)
            
            Spacer()
                
            
            VStack {
                
                Text("Breakfast: ")
                Text("Lunch: ")
                Text("Dinner: ")
                
            }
            
        }
        .background(
            Image("blueBg")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
        )
    }
}


