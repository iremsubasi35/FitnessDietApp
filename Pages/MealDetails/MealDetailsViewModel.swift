//
//  MealDetailsViewModel.swift
//  FitnessDietApp
//
//  Created by Irem Subası on 11.05.2023.
//

import Foundation
import SwiftUI


// MARK: - Nutrition
struct NutritionPresentation: Identifiable {
    let id: UUID = .init()
    let itemId: Int
    let image: String
    let description: String
}

struct NutritionViewPresentation {
    let items: [NutritionPresentation]
    let title: String
}
// should coonect dataController- fakeData JSON
extension NutritionViewPresentation {
    static let fakeData:  NutritionViewPresentation = {
        let items: [NutritionPresentation] = [
            NutritionPresentation(itemId: 0, image: "Calories-Icon", description: "180kCal"),
            NutritionPresentation(itemId: 1, image: "Fat-Icon", description: "30g fats"),
            NutritionPresentation(itemId: 2, image: "Proteins-Icon", description: "20g proteins"),
            NutritionPresentation(itemId: 3, image: "Carbo-Icon", description: "35g carbohydrate")
        ]
        
        let title = "Nutrition"
        return .init(items: items,title: title)
    }()
}

// MARK: - Ingredients That You Will Need
struct IngredientsPresentation: Identifiable {
    let id: UUID = .init()
    let itemId: Int
    let image: String
    let title: String
    let subtitle: String
}

struct IngredientsViewPresentation {
    let items: [IngredientsPresentation]
    let title: String
}
extension IngredientsViewPresentation {
    static let fakeData: IngredientsViewPresentation = {
        let items: [IngredientsPresentation] = [
            IngredientsPresentation(itemId: 0, image: "Flour-Icon", title: "Wheat Flour", subtitle: "100gr"),
            IngredientsPresentation(itemId: 0, image: "Sugar-Icon", title: "Sugar", subtitle: "3 tbsp"),
            IngredientsPresentation(itemId: 0, image: "BakingSoda-Icon", title: "Baking Soda", subtitle: "2 tsp"),
            IngredientsPresentation(itemId: 0, image: "Eggs-Icon", title: "Eggs", subtitle: "2 items"),
            IngredientsPresentation(itemId: 0, image: "glass-of-milk 1", title: "Milk", subtitle: "1 glass"),
            IngredientsPresentation(itemId: 0, image: "glass-of-milk 1", title: "Milk", subtitle: "1 glass")
        ]
        
        let title = "Ingredients That You \nWill Need"
        return .init(items: items,title: title)
    }()
}

// MARK: - StepByStepPresentation
struct StepByStepPresentation: Identifiable{
    let id : UUID = .init()
    let itemId: Int
    let step: String
}
struct StepByStepViewPresentation{
    let items: [StepByStepPresentation]
    let title: String
}
extension StepByStepViewPresentation {
    static let fakeData: StepByStepViewPresentation = {
        let items: [StepByStepPresentation] = [
            StepByStepPresentation(itemId: 0, step: "Prepare all of the ingredients that needed"),
        StepByStepPresentation(itemId: 1, step: "Prepare all of the ingredients that needed"),
        StepByStepPresentation(itemId: 2, step: "In a seperate place, mix the eggs and liquid milk until blended"),
        StepByStepPresentation(itemId: 3, step: "asdsdnkjsndkabkdhbak"),
        StepByStepPresentation(itemId: 4, step: "södjnajödandkankab")
        ]
        
        let title = "Step by Step"
        return .init(items: items, title: title)
    }()
}

// MARK: - BreakfastCategoryViewModel
final class MealDetailsViewModel: ObservableObject{
    private let router: MealDetailsRouter
    
    @Published var nutritionViewPresentation: NutritionViewPresentation?
    @Published var ıngredientsViewPresentation: IngredientsViewPresentation?
    @Published var stepByStepViewPresentation: StepByStepViewPresentation?
    
    init(router: MealDetailsRouter) {
        self.router = router
    }
    
    func initialize() {
        nutritionViewPresentation = .fakeData
        ıngredientsViewPresentation = .fakeData
        stepByStepViewPresentation = .fakeData
    }
    
}
