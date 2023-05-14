//
//  MealPlannerRouter.swift
//  FitnessDietApp
//
//  Created by Irem Subası on 3.05.2023.
//

import Foundation
final class MealPlannerRouter{
    func navigateToBreakfastCategory() {
        let router = BreakfastCategoryRouter()
        let viewModel = BreakfastCategoryViewModel(router: router)
        let view = BreakfastCategoryView(viewModel: viewModel)
        RoutingManager.shared.push(view, isNavigationBarHidden: false)
    }
    func navigateToMealSchedule() {
        let router = MealScheduleRouter()
        let viewModel = MealScheduleViewModel(router: router)
        let view = MealScheduleView(viewModel: viewModel)
        RoutingManager.shared.push(view, isNavigationBarHidden: false)
    }
}


