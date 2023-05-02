//
//  OnboardingViewModel.swift
//  FitnessDietApp
//
//  Created by Irem Subası on 2.05.2023.
//

import Foundation
import SwiftUI

 enum OnboardingViewType {
    case onboardingViewOne
    case onboardingViewTwo
    case onboardingViewThree
    case onboardingViewFour
    
    var onboardingImage: String {
        switch self {
        case .onboardingViewOne:
             return "Onboarding1"
        case .onboardingViewTwo:
            return "Onboarding2"
        case .onboardingViewThree:
             return "Onboarding3"
        case .onboardingViewFour:
            return "Onboarding4"
        }
    }
    
    var onboardingTitle: String {
        switch self {
        case .onboardingViewOne:
             return "Track Your Goal"
        case .onboardingViewTwo:
            return "Get Burn"
        case .onboardingViewThree:
             return "Eat Well"
        case .onboardingViewFour:
            return "Improve Sleep\nQuality"
        }
    }
    
    var onboardingDescription: String {
        switch self {
        case .onboardingViewOne:
             return "Don't worry if you have trouble determining your goals, We can help you determine your goals and track your goals"
        case .onboardingViewTwo:
            return "Let’s keep burning, to achive yours goals, it hurts only temporarily, if you give up now you will be in pain forever"
        case .onboardingViewThree:
             return "Let's start a healthy lifestyle with us, we can determine your diet every day. healthy eating is fun"
        case .onboardingViewFour:
            return "Improve the quality of your sleep with us, good quality sleep can bring a good mood in the morning"
        }
    }
    
    var onboardingButtonImage: String {
        switch self {
        case .onboardingViewOne:
             return "OnboardingButton1"
        case .onboardingViewTwo:
            return "OnboardingButton2"
        case .onboardingViewThree:
             return "OnboardingButton3"
        case .onboardingViewFour:
            return "OnboardingButton4"
        }
    }
    
}

final class OnboardingViewModel: ObservableObject {
    private let router: OnboardingRouter
    private(set) var currentType: OnboardingViewType
    
    init(router: OnboardingRouter, type: OnboardingViewType) {
        self.router = router
        self.currentType = type
    }
    
    
    func nextButtonOnTap(){
        if currentType == .onboardingViewOne{
            router.navigateToOnboardingView(type: .onboardingViewTwo)
        } else if currentType == .onboardingViewTwo{
            router.navigateToOnboardingView(type: .onboardingViewThree)
        } else if currentType == .onboardingViewThree{
            router.navigateToOnboardingView(type: .onboardingViewFour)
        } else if currentType == .onboardingViewFour {
            router.navigateToRegisterView()
        }
    }
}
