//
//  OnboardingRouter.swift
//  FitnessDietApp
//
//  Created by Irem Subası on 2.05.2023.
//

import Foundation

final class OnboardingRouter{
    func navigateToOnboardingView(type: OnboardingViewType) {
        let router = OnboardingRouter()
        let viewModel = OnboardingViewModel(router: router, type: type)
        let view = OnBoardingView(viewModel: viewModel)
        RoutingManager.shared.push(view, isNavigationBarHidden: true)
    }
    func navigateToRegisterView() {
        let router = MealPlannerRouter()
        let viewModel = MealPlannerViewModel(router: router)
        let view = MealPlannerView(viewModel: viewModel)
        RoutingManager.shared.push(view, isNavigationBarHidden: true)
    }
}
