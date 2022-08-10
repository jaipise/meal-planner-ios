//
//  DB_Manager.swift
//  mealPlanner
//
//  Created by Jai Pise on 21/4/2021.
//

//import Foundation
//
//// import library
//import SQLite
//
//class DB_Manager {
//
//    // sqlite instance
//    private var db: Connection!
//
//    // table instance
//    private var meals: Table!
//
//    // columns instances of table
//    private var id: Expression<Int64>?
//    private var mealType: Expression<String>?
//    private var mealName: Expression<String>?
//
//    //constructor of this class
//    init() {
//
//
//        // exception handling
//        do {
//
//            // path of document directory
//            let path = NSSearchPathForDirectoriesInDomains(
//                .applicationSupportDirectory, .userDomainMask, true
//            ).first! + "/" + Bundle.main.bundleIdentifier!
//
//            // create parent directory iff it doesn’t exist
//            try FileManager.default.createDirectory(
//                atPath: path, withIntermediateDirectories: true, attributes: nil
//            )
//
//            // creating database connection
//            let db = try Connection("\(path)/db.sqlite3")
//
//            // creating table object
//            meals = Table("meals")
//
//            // create instances of each column
//            id = Expression<Int64>("id")
//            mealType = Expression<String>("mealType")
//            mealName = Expression<String>("mealName")
//
//            // check if the user's table is already created
//            if (!UserDefaults.standard.bool(forKey: "is_db_created")) {
//                // if not, then create the table
//                try db.run(meals.create { (t) in
//                    t.column(id!, primaryKey: true)
//                    t.column(mealType!)
//                    t.column(mealName!, unique: true)
//                })
//                print("worked?")
//
//                // set the value to true, so it will not attempt to create the table again
//                UserDefaults.standard.set(true, forKey: "is_db_created")
//            }
//
//        }
//        catch {
//            // show error message (if any)
//            print("Creation of table failed")
//        }
//    }
//
//    public func addMealType (mealTypeValue: String, mealNameValue: String) {
//        // meals.insert(mealType <- mealTypeValue, mealName <- mealNameValue)
//        do {
//            try db.run(meals.insert(mealType! <- mealTypeValue, mealName! <- mealNameValue))
//        }
//        catch {
//            print("Insertion failed")
//        }
//    }
//
//    // return array of meal models
//    public func getMeals () -> [MealModel] {
//
//        // create empty array
//        var mealModels: [MealModel] = []
//
//        // get all meals in descending order
//        meals = meals.order(id!.desc)
//
//        // exception handling
//        do {
//            try print("good")
//            // loop through all users
////            for meal in try db.prepare(meals) {
////
////                // create new model in each loop iteration
////                let mealModel: MealModel = MealModel()
////
////                // set values in model from database
////                mealModel.id = meal[id]
////                mealModel.mealType = meal[mealType]
////                mealModel.mealName = meal[mealName]
////
////                // append in new array
////                mealModels.append(mealModel)
////
////            }
//        }
//        catch {
//            print("Getting meals failed")
//        }
//
//        // return array
//        return mealModels
//    }
//
//
//}
