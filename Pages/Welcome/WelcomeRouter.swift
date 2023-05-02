//
//  WelcomeRouter.swift
//  FitnessDietApp
//
//  Created by Irem Subası on 2.05.2023.
//

import Foundation

final class WelcomeRouter {
    func navigateToWelcomeView(type: WelcomeViewType) {
        let router = WelcomeRouter()
        let viewModel = WelcomeViewModel(router: router, type: type)
        let view = WelcomeView(viewModel: viewModel)
        RoutingManager.shared.push(view, isNavigationBarHidden: true)
    }
    
    func navigateToOnboardingView(type: OnboardingViewType) {
        let router = OnboardingRouter()
        let viewModel = OnboardingViewModel(router: router, type: type)
        let view = OnBoardingView(viewModel: viewModel)
        RoutingManager.shared.push(view, isNavigationBarHidden: true)
        
    }
}
