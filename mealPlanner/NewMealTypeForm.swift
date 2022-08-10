//
//  NewMealTypeForm.swift
//  mealPlanner
//
//  Created by Jai Pise on 30/4/2021.
//

import SwiftUI

struct NewMealTypeForm: View {
    
    init(){
        UITableView.appearance().backgroundColor = .clear
    }
    
    
    // create variable values to store user input
    
    @State var mealName = ""
    
    var mealTypeArray = ["Breakfast", "Lunch", "Dinner"]
    @State private var mealType = "Breakfast"
    
    // to go back to meal directory screen when meal type is added
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    
    var body: some View {
        VStack {
            Text("Input New Meal Type")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(30.0)
            
            
            Form {
                Picker("Breakfast, lunch, or dinner?", selection: $mealType) {
                    ForEach(mealTypeArray, id: \.self) {
                        Text($0)
                    }
                }

                                
                // create meal type field
                HStack {
                    Spacer()
                    TextField("Hamburger", text: $mealName)
                        .padding(10)
                        .background(Color(.systemGray6))
                        .cornerRadius(5)
                        .disableAutocorrection(true)
                    Spacer()
                    
                }
                
                // button to add meal
                Button(action: {
                    // call function to add row in sqlite database
                    // DB_Manager().addMealType(mealTypeValue: self.mealType, mealNameValue: self.mealName)

                    
                    // go back to home page
                  //  self.mode.wrappedValue.dismiss()
                                                
                    }, label: {
                        HStack {
                            Image(systemName: "highlighter")
                            Text("Enter New Meal Type")
                        }
                    })
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.top, 10)
                    .padding(.bottom, 10)
                
            }
            Text("\(mealName)")
            Text("\(mealType)")
            
            
        }
        .background(
            Image("orangeBg")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
        )

    }
}


struct NewMealTypeForm_Previews: PreviewProvider {
    static var previews: some View {
        NewMealTypeForm()
    }
}
