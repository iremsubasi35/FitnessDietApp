//
//  BreakfastCategoryViewModel.swift
//  FitnessDietApp
//
//  Created by Irem Subası on 10.05.2023.
//

import Foundation
import SwiftUI

// MARK: - CategoriesPresentation
struct CategoryPresentation: Identifiable {
    let id: UUID = .init()
    let itemId: Int
    let title: String
    let image: String
    let backgroundColor: Color
}

// MARK: - CategoriesViewPresentation
struct CategoriesViewPresentation {
    let items: [CategoryPresentation]
    let title: String
}

extension CategoriesViewPresentation {
    static let fakeData: CategoriesViewPresentation = {
        let items: [CategoryPresentation] = [
            CategoryPresentation(itemId: 0, title: "Salad", image: "CategorySalad",backgroundColor: Color.brandColorOne.opacity(0.2)),
            CategoryPresentation(itemId: 1, title: "Cake", image: "CategoryPancakes",backgroundColor: Color.secondaryColorOne.opacity(0.2)),
            CategoryPresentation(itemId: 2, title: "Pie", image: "MealPlanner-Breakfast",backgroundColor: Color.brandColorOne.opacity(0.2)),
            CategoryPresentation(itemId: 3, title: "Smoothies", image: "CategorySmoothies",backgroundColor: Color.secondaryColorOne.opacity(0.2))
        ]
        let title = "Category"
        return .init(items: items, title: title)
    }()
}

// MARK: - RecommendationForDietPresentation
struct DietPresentation: Identifiable {
    let id: UUID = .init()
    let itemId: Int
    let title: String
    let image: String
    let difficulty: String
    let time: Int
    let calorie: Int
    let backgroundColor: Color
    let buttonColor: Color
}

// MARK: - DietViewPresentation
struct DietsViewPresentation {
    let items: [DietPresentation]
    let title: String
}

extension DietsViewPresentation {
    static let fakeData: DietsViewPresentation = {
        let items: [DietPresentation] = [
            DietPresentation(itemId: 0, title: "Honey Pancake", image: "HoneyPancakes",difficulty: "Easy", time:30, calorie: 180, backgroundColor: Color.brandColorOne.opacity(0.2), buttonColor: Color.brandColorOne),
            DietPresentation(itemId: 1, title: "Canai Bread", image: "MealPlanner-Lunch",difficulty: "Easy", time:20, calorie: 230, backgroundColor: Color.secondaryColorOne.opacity(0.2),buttonColor: Color.secondaryColorOne),
            DietPresentation(itemId: 2, title: "Chicken Steak", image: "MealPlanner-Dinner",difficulty: "Medium", time:15, calorie: 210,backgroundColor: Color.brandColorOne.opacity(0.2),buttonColor: Color.brandColorOne)
        ]
        let title = "Recommendation \n for Diet"
        return .init(items: items, title: title)
    }()
}

// MARK: - PopularPresentation

struct PopularItem: Identifiable {
    let id: UUID = .init()
    let itemId: Int
    let title: String
    let difficulty: String
    let time: Int
    let calorie: Int
    let image: String
}

struct PopularViewPresentation {
    let title: String
    let items: [PopularItem]
}

extension PopularViewPresentation {
    static let fakeData: PopularViewPresentation = {
        let items: [PopularItem] = [
            .init(itemId: 1, title: "Blueberry Pancake", difficulty: "Medium",time:30 ,calorie:230 , image: "pancake2"),
            .init(itemId: 2, title: "Lowfat Milk", difficulty: "Medium",time:30 ,calorie:230, image: "nigiri 1")
        ]
        return .init(title: "Popular", items: items)
    }()
}
// MARK: - BreakfastCategoryViewModel
final class BreakfastCategoryViewModel: ObservableObject{
    private let router: BreakfastCategoryRouter
    
    @Published var categoriesViewPresentation: CategoriesViewPresentation?
    @Published var dietsViewPresentation: DietsViewPresentation?
    @Published var popularViewPresentation: PopularViewPresentation?
    
    init(router: BreakfastCategoryRouter) {
        self.router = router
    }
    
    func initialize() {
        categoriesViewPresentation = .fakeData
        dietsViewPresentation = .fakeData
        popularViewPresentation = .fakeData
    }
    func popularItemTapped(){
        router.navigateToMealDetails()
    }
    
}

