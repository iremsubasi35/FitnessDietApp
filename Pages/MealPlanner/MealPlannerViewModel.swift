//
//  MealPlannerViewModel.swift
//  FitnessDietApp
//
//  Created by Irem Subası on 3.05.2023.
//

import Foundation
import SwiftUI

// MARK: - MealNutritions
struct MealNutritions: Identifiable {
    let id = UUID()
    let day: String
    let percent: Int
}

extension MealNutritions {
    static let fakeData: [MealNutritions] = [
        .init(day: "Sun", percent: 23),
        .init(day: "Mon", percent: 35),
        .init(day: "Tue", percent: 55),
        .init(day: "Wed", percent: 30),
        .init(day: "Thi", percent: 15),
        .init(day: "Fri", percent: 65),
        .init(day: "Sat", percent: 81),
    ]
}

struct MealNutritionViewPresentation {
    let title: String
    let items: [MealNutritions]
}

extension MealNutritionViewPresentation {
    static let fakeData: MealNutritionViewPresentation = {
        let items: [MealNutritions] = MealNutritions.fakeData
        return .init(title: "Meal Nutritions", items: items)
    }()
}

// MARK: - BoxPresentation
struct BoxPresentation: Identifiable {
    let id: UUID = .init()
    let itemId: Int
    let foodValue: Int
    let title: String
    let image: String
    let backgroundColor: Color
    let buttonColor: Color
}

// MARK: - BoxesViewPresentation
struct BoxesViewPresentation {
    let items: [BoxPresentation]
    let title: String
}

extension BoxesViewPresentation {
    static let fakeData: BoxesViewPresentation = {
        let items: [BoxPresentation] = [
            BoxPresentation(itemId: 0, foodValue: 120, title: "Breakfast", image: "MealPlanner-Breakfast",backgroundColor: Color.brandColorOne.opacity(0.2),buttonColor: Color.brandColorOne),
            BoxPresentation(itemId: 1, foodValue: 130, title: "Lunch", image: "MealPlanner-Lunch",backgroundColor: Color.secondaryColorOne.opacity(0.2),buttonColor: Color.secondaryColorOne),
            BoxPresentation(itemId: 2, foodValue: 150, title: "Dinner", image: "MealPlanner-Dinner",backgroundColor: Color.brandColorOne.opacity(0.2),buttonColor: Color.brandColorOne)
        ]
        let title = "Find Something to Eat"
        return .init(items: items, title: title)
    }()
}

struct TodayMealsItem: Identifiable {
    let id: UUID = .init()
    let itemId: Int
    let title: String
    let subtitle: String
    let image: String
}

struct TodayMealsViewPresentation {
    let title: String
    let items: [TodayMealsItem]
}

extension TodayMealsViewPresentation {
    static let fakeData: TodayMealsViewPresentation = {
        let items: [TodayMealsItem] = [
            .init(itemId: 1, title: "Solmon Nigiri", subtitle: "Today | 7 am", image: "nigiri 1"),
            .init(itemId: 2, title: "Lowfat Milk", subtitle: "Today | 8 am", image: "glass-of-milk 1")
        ]
        
        return .init(title: "Today Meals", items: items)
    }()
}

// MARK: - MealPlannerViewModel
final class MealPlannerViewModel: ObservableObject {
    private let router: MealPlannerRouter
    private let dataController: MealPlannerDataController
    
    @Published var boxesViewPresentation: BoxesViewPresentation?
    @Published var nutritionsViewPresentation: MealNutritionViewPresentation?
    @Published var todayMealsViewPresentation:  TodayMealsViewPresentation?
    
    init(router: MealPlannerRouter, dataController: MealPlannerDataController) {
        self.router = router
        self.dataController = dataController
    }
    
    func initialize() {
        boxesViewPresentation = .fakeData
        nutritionsViewPresentation = .fakeData
        todayMealsViewPresentation = .fakeData
    }
    
    func someThingToEatModelTapped() {
        router.navigateToBreakfastCategory()
    }
    func dailyMealCheckTapped(){
        router.navigateToMealSchedule()
    }
}


