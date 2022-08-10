//
//  MealDirectory.swift
//  mealPlanner
//
//  Created by Jai Pise on 30/4/2021.
//
// pizza image: https://pixabay.com/photos/pizza-food-italian-baked-cheese-3007395/

import SwiftUI

    
struct MealDirectory: View {
    
    // array of meal models
//    @State var mealModels: [MealModel] = []
    
//    @State var numRows = Int(ceil(Double(totalMealTypes / 3)))
//    @State var numCol = 3
//
//    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        VStack {

            HStack {
                Text("Meal Directory")
                Image(systemName: "doc.plaintext")
            }
            .font(.largeTitle)
               .padding(30.0)
               .background(Image("orangeBg"))
               .cornerRadius(30)
                   .overlay(
                       RoundedRectangle(cornerRadius: 30)
                           .stroke(Color.orange, lineWidth: 5)
                   )// gives curved border
            
            
            
            
                        
            ScrollView {
                
                    VStack (alignment: .leading){
                        Text("Breakfast:")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.pink)
                        
                        ForEach(breakfastSelectionArr, id: \.self) { meal in
                            Text("• " + meal)
                                .font(.title2)
                                .fontWeight(.semibold)
                                .padding()
                        }
                    }
                    .padding(.leading, -100.0) // FIXME - if this is not here, then the Breakfast section indents forward for some reason
                    .frame(maxWidth: .infinity)
                                        
                    VStack (alignment: .leading){
                        Text("Lunch/Dinner:")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.pink)
                        
                        ForEach(lunchDinnerSelectionArr, id: \.self) { meal in
                            Text("• " + meal)
                                .font(.title2)
                                .fontWeight(.semibold)
                                .padding()
                        }
                    }
                    .frame(maxWidth: .infinity)
            
            }
            
            Spacer()
            
            
//            NavigationLink(
//                destination: NewMealTypeForm(),
//                label: {
//                    HStack {
//                        Image(systemName: "square.and.pencil")
//                            .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
//
//                        Text("Input New Meal Type")
//                            .font(.title)
//                            .fontWeight(.bold)
//                            .foregroundColor(Color.white)
//
//                    }
//                    .padding(30.0)
//                    .background(Color.purple)
//                    .cornerRadius(30)
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 30)
//                            .stroke(Color.pink, lineWidth: 5)
//                    )// gives curved border
//            })
            
 
                         
//            List (self.mealModels) { (model) in
//
//                HStack {
//                    Text(model.mealType)
//                    Text(model.mealName)
//                }
//            }
                
        }
        // load data in meal models array
//        .onAppear(perform: {
//            print("Done")
//            self.mealModels = DB_Manager().getMeals()
//        })
        
        .background(
            Image("greenBg")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
        )
        
        
        
    }
}


struct MealDirectory_Previews: PreviewProvider {
    static var previews: some View {
        MealDirectory()
    }
}
