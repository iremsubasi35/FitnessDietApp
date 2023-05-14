//
//  MealScheduleViewModel.swift
//  FitnessDietApp
//
//  Created by Irem Subası on 11.05.2023.
//

import Foundation
import SwiftUI


// MARK: - breakfast
struct BreakfastItem: Identifiable {
    let id: UUID = .init()
    let itemId: Int
    let title: String
    let subtitle: String
    let image: String
    let backgroundColor: Color
}

struct BreakfastViewPresentation {
    let title: String
    let calorie: Int
    let items: [BreakfastItem]
}

extension BreakfastViewPresentation {
    static let fakeData: BreakfastViewPresentation = {
        let items: [BreakfastItem] = [
            .init(itemId: 1, title: "Blueberry Pancake",subtitle: "07:00am", image: "honeyPancake",backgroundColor: Color.brandColorOne.opacity(0.2)),
            .init(itemId: 2, title: "Lowfat Milk", subtitle: "07:30am", image: "coffee",backgroundColor: Color.secondaryColorOne.opacity(0.2))
        ]
        return .init(title: "Breakfast",calorie: 230, items: items)
    }()
}

// MARK: - Lunch
struct LunchItem: Identifiable {
    let id: UUID = .init()
    let itemId: Int
    let title: String
    let subtitle: String
    let image: String
    let backgroundColor: Color
}

struct LunchViewPresentation {
    let title: String
    let calorie: Int
    let items: [LunchItem]
}

extension LunchViewPresentation {
    static let fakeData: LunchViewPresentation = {
        let items: [LunchItem] = [
            .init(itemId: 1, title: "Blueberry Pancake",subtitle: "01:00pm", image: "MealPlanner-Dinner",backgroundColor: Color.brandColorOne.opacity(0.2)),
            .init(itemId: 2, title: "Lowfat Milk", subtitle: "01:20pm", image: "glass-of-milk 1",backgroundColor: Color.secondaryColorOne.opacity(0.2))
        ]
        return .init(title: "Lunch",calorie: 500, items: items)
    }()
}

// MARK: - Snacks
struct SnacksItem: Identifiable {
    let id: UUID = .init()
    let itemId: Int
    let title: String
    let subtitle: String
    let image: String
    let backgroundColor: Color
}

struct SnacksViewPresentation {
    let title: String
    let calorie: Int
    let items: [SnacksItem]
}

extension SnacksViewPresentation {
    static let fakeData: SnacksViewPresentation = {
        let items: [SnacksItem] = [
            .init(itemId: 1, title: "Blueberry Pancake",subtitle: "04:30pm", image: "CategorySmoothies",backgroundColor: Color.brandColorOne.opacity(0.2)),
            .init(itemId: 2, title: "Lowfat Milk", subtitle: "04:40pm", image: "applePie",backgroundColor: Color.secondaryColorOne.opacity(0.2))
        ]
        return .init(title: "Snacks",calorie: 140, items: items)
    }()
}

// MARK: - Dinner
struct DinnerItem: Identifiable {
    let id: UUID = .init()
    let itemId: Int
    let title: String
    let subtitle: String
    let image: String
    let backgroundColor: Color
}

struct DinnerViewPresentation {
    let title: String
    let calorie: Int
    let items: [DinnerItem]
}

extension DinnerViewPresentation {
    static let fakeData: DinnerViewPresentation = {
        let items: [DinnerItem] = [
            .init(itemId: 1, title: "Blueberry Pancake",subtitle: "", image: "salad",backgroundColor: Color.brandColorOne.opacity(0.2)),
            .init(itemId: 2, title: "Lowfat Milk", subtitle: "", image: "oatmeal",backgroundColor: Color.secondaryColorOne.opacity(0.2))
        ]
        return .init(title: "Dinner",calorie: 120, items: items)
    }()
}
// MARK: - Process part
struct ProcessItem: Identifiable {
    let id: UUID = .init()
    let itemId: Int
    let title: String
    let icon: String
    let subtitle: String
    let percent: Int
}

struct TodayMealViewPresentation {
    let title: String
    let items: [ProcessItem]
}

extension TodayMealViewPresentation {
    static let fakeData: TodayMealViewPresentation = {
        let items: [ProcessItem] = [
            .init(itemId: 0, title: "Calories", icon: "Calories-Icon", subtitle: "320 kCal",percent: 70),
            .init(itemId: 1, title: "Proteins", icon: "Proteins-Icon", subtitle: "300g",percent: 45),
            .init(itemId: 2, title: "Fats", icon: "Fat-Icon", subtitle: "140g",percent: 35),
            .init(itemId: 3, title: "Carbo", icon: "Carbo-Icon", subtitle: "140g",percent: 20)
        ]
        return .init(title: "Today Meal Nutritions", items: items)
    }()
}


// MARK: - BreakfastCategoryViewModel
final class MealScheduleViewModel: ObservableObject{
    private let router: MealScheduleRouter
    
    @Published var breakfastViewPresentation: BreakfastViewPresentation?
    @Published var lunchViewPresentation: LunchViewPresentation?
    @Published var snacksViewPresentation: SnacksViewPresentation?
    @Published var dinnerViewPresentation: DinnerViewPresentation?
    @Published var todayMealViewPresentation: TodayMealViewPresentation?
    
    init(router: MealScheduleRouter) {
        self.router = router
    }
    
    func initialize() {
        breakfastViewPresentation = .fakeData
        lunchViewPresentation = .fakeData
        snacksViewPresentation = .fakeData
        dinnerViewPresentation = .fakeData
        todayMealViewPresentation = .fakeData
    }
}

