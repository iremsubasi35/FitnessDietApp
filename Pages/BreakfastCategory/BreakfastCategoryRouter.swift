//
//  BreakfastCategoryRouter.swift
//  FitnessDietApp
//
//  Created by Irem Subası on 10.05.2023.
//

import Foundation

final class BreakfastCategoryRouter{
    func navigateToMealDetails(){
        let router = MealDetailsRouter()
        let viewModel = MealDetailsViewModel(router: router)
        let view = MealDetailsView(viewModel: viewModel)
        RoutingManager.shared.push(view, isNavigationBarHidden: false)
    }
}

