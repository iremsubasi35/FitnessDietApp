//
//  MealPlannerViewModel.swift
//  FitnessDietApp
//
//  Created by Irem Subası on 3.05.2023.
//

import Foundation
import SwiftUI
struct MealNutritions: Identifiable {
    let id = UUID()
    let day: String
    let percent: Int
}
extension MealNutritions {
    static let consumed: [MealNutritions] = [
        .init(day: "Sun", percent: 23),
        .init(day: "Mon", percent: 35),
        .init(day: "Tue", percent: 55),
        .init(day: "Wed", percent: 30),
        .init(day: "Thi", percent: 15),
        .init(day: "Fri", percent: 65),
        .init(day: "Sat", percent: 81),
    ]
}
final class MealPlannerViewModel: ObservableObject {
    private let router: MealPlannerRouter
    
    init(router: MealPlannerRouter) {
        self.router = router
        
    }
}
