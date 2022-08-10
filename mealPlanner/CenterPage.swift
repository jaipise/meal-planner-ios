//  ContentView.swift
//  mealPlanner
//
///  Created by Jai Pise on 11/4/2021.
/// background image: https://img.freepik.com/free-photo/uncooked-dry-whole-pasta-shells-fresh-ingredients-red-tomatoes-pepper-rosemary-trying-best-recipe-traditional-italian-pasta-white-background-view-from-flat-lay-composition_273609-38332.jpg?size=626&ext=jpg&ga=GA1.2.855662366.1617235200
/// App Icon: https://www.medicalnewstoday.com/articles/paleo-meal-delivery

import SwiftUI

//var mealTypeArray = ["Breakfast", "Lunch/Dinner"]

//let pastMealsToBeLookedAt = 2;

//var latestBreakfastIndex = 0
//var latestLunchIndex = 0
//var latestDinnerIndex = 2

var latestBreakfast = ""
var latestLunch = ""
var latestDinner = ""


//var latestMealsArray = latestBreakfastArray + latestLunchDinnerArray

let numberOfBreakfasts = breakfastSelectionArr.count
let numberOfLunchesAndDinners = lunchDinnerSelectionArr.count
let totalMeals = numberOfBreakfasts + numberOfLunchesAndDinners

let breakfastSelectionArr = ["Omelette", "Boiled Eggs", "Pancakes", "Scrambled eggs", "Cereal", "Fruit", "Bagel"]
let lunchDinnerSelectionArr = ["Pizza", "Hamburger", "Salad", "Pasta", "Noodles", "Sushi", "Chicken Curry", "Kimchi", "Dal Makhani", "Pad Thai", "Chicken Keema (Minced Chicken)", "Sandwich", "Buffalo wings", "Chicken wrap"]

let mealSelectionArr = breakfastSelectionArr + lunchDinnerSelectionArr


    
struct CenterPage: View {
    var body: some View {
        NavigationView {
            VStack {
                MainScreen()
                    .navigationTitle("Recommendations")
            }
        }
    }
}
//struct RightPage: View {
//
//    var body: some View {
//        NavigationView {
//            VStack {
//                MealDirectory()
//            }
//        }
//    }
//}

struct MainScreen: View {
    @State var suggestedMealArray = recommender(latestB: latestBreakfast, latestL: latestLunch, latestD: latestDinner)
    
    var body: some View {
        let colorPink = Color(red: 1.0, green: 0.75, blue: 0.796, opacity: 1.0)
            
        VStack {
            Spacer()
            
                .onAppear {
                    suggestedMealArray = recommender(latestB: latestBreakfast, latestL: latestLunch, latestD: latestDinner)
                }
            

            NavigationLink(
                destination: MealDirectory(),
                label: {
                    VStack {
                        HStack {
                            
                            Text("Meal Directory")
                            Image(systemName: "hand.point.right.fill")
                        }
                        .font(.title2)
                    }
            })
            .padding(15.0)
            .background(colorPink)
            .cornerRadius(/*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.pink, lineWidth: 3)
                ) //gives curved border
            
            
            Spacer()
            
            NavigationLink(
                destination: InputMealEatenForm(),
                label: {
                    HStack {
                        Image(systemName: "square.and.pencil")
                            .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)

                        Text("Input Meal Eaten")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            
                    }
                    .padding(26.0)
                    .background(Color.orange)
                    .cornerRadius(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.white, lineWidth: 5)
                    )
                    
            })
            
        
            Spacer()


            VStack {
            
                Text("Suggestions:")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .padding(20.0)

                Text("Breakfast: " + suggestedMealArray[0])
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(20.0)
                Text("Lunch: " + suggestedMealArray[1])
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(20.0)
                Text("Dinner: " + suggestedMealArray[2])
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(20.0)
            }
            .background(colorPink)
            .cornerRadius(/*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.pink, lineWidth: 5)
            )
            
            Spacer()

        }
        .background(
            Image("background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
                .opacity(0.4)
        )
        
        
    }
}

func recommender (latestB: String, latestL: String, latestD: String) -> [String] {
    var recommended: [String] = ["","",""]
    var eatenBreakfastIndex = 0
    var eatenLunchIndex = 0
    var eatenDinnerIndex = 0
    
    // breakfast recommendation
    for index in 0...breakfastSelectionArr.count-1 {
        if breakfastSelectionArr[index] == latestB {
            eatenBreakfastIndex = index
        }
    }
    
    var breakfastNums = [Int](1...numberOfBreakfasts)
    breakfastNums.remove(at: eatenBreakfastIndex)
    let recommendedBreakfastIndex = Int(arc4random_uniform(UInt32(breakfastNums.count)))
    recommended[0] = breakfastSelectionArr[recommendedBreakfastIndex]
    
    // lunch and dinner recommendation
    
    for index in 0...lunchDinnerSelectionArr.count-1 {
        if lunchDinnerSelectionArr[index] == latestL {
            eatenLunchIndex = index
        }
        else if lunchDinnerSelectionArr[index] == latestD {
            eatenDinnerIndex = index
        }
    }
    var lunchDinnerNums = [Int](1...numberOfLunchesAndDinners)
    lunchDinnerNums.remove(at: eatenLunchIndex)
    lunchDinnerNums.remove(at: eatenDinnerIndex)
    
    let recommededLunchIndex = Int(arc4random_uniform(UInt32(lunchDinnerNums.count)))
    recommended[1] = lunchDinnerSelectionArr[recommededLunchIndex]
    
    lunchDinnerNums.remove(at: recommededLunchIndex)
    let recommendedDinnerIndex = Int(arc4random_uniform(UInt32(lunchDinnerNums.count)))
    recommended[2] = lunchDinnerSelectionArr[recommendedDinnerIndex]
    

    return recommended
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CenterPage()
    }
}
