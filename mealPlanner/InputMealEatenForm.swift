//
//  InputMealEatenForm.swift
//  mealPlanner
//
//  Created by Jai Pise on 30/4/2021.
//

import SwiftUI

struct InputMealEatenForm: View {
    
    init(){
        UITableView.appearance().backgroundColor = .clear
    }
    
//    @State private var mealType = "Breakfast"
//    var mealTypeArray = ["Breakfast", "Lunch", "Dinner"]

    @State private var breakfastSelection = breakfastSelectionArr[0]
    @State private var lunchSelection = lunchDinnerSelectionArr[0]
    @State private var dinnerSelection = lunchDinnerSelectionArr[1]
    
    // to go back to main screen when meal is entered
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {

        VStack {            
            Text("Input Eaten Meal")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(20.0)
        
            Form {
                Section(header: Text("Breakfast")) {
                    Picker("What meal did you eat for breakfast?", selection: $breakfastSelection) {
                        ForEach(breakfastSelectionArr, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section(header: Text("Lunch")) {
                    Picker("What meal did you eat for lunch?", selection: $lunchSelection) {
                        ForEach(lunchDinnerSelectionArr, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section(header: Text("Dinner")) {
                    Picker("What meal did you eat for dinner?", selection: $dinnerSelection) {
                        ForEach(lunchDinnerSelectionArr, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                
                    
                
                
                Section {
                    Button(action: {
                        
                        latestBreakfast = breakfastSelection
                        latestLunch = lunchSelection
                        latestDinner = dinnerSelection
 
                        // go back to home page
                        self.mode.wrappedValue.dismiss()
                        
                        
                    }, label: {
                        HStack {
                            Image(systemName: "highlighter")
                            Text("Enter Meal Eaten")
                        }
                    })
                }
            }
//            Text("\(mealType)")
//            Text("\(mealSelection)")
        }
        .background(
            Image("purpleBg")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
        )
    }
}

struct InputMealEatenForm_Previews: PreviewProvider {
    static var previews: some View {
        InputMealEatenForm()
    }
}
