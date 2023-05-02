//
//  WelcomeViewModel.swift
//  FitnessDietApp
//
//  Created by Irem Subası on 2.05.2023.
//

import Foundation
import SwiftUI

//let backgroundGradient = LinearGradient(gradient: Gradient(colors: [Color.brandColorOne,Color.brandColorOne,Color.brandColorOne,Color.brandColorOne,Color.brandColorTwo ]), startPoint: .trailing, endPoint: .leading)
// must switch brandColorOne

 enum WelcomeViewType {
    case welcomeViewOne
    case welcomeViewTwo
    
    var backgroundColor: [Color] {
        switch self {
        case .welcomeViewOne:
            return [Color.white]
        case .welcomeViewTwo:
            return  [Color.brandColorOne,Color.brandColorOne,Color.brandColorOne,Color.brandColorOne,Color.brandColorTwo ]
        }
    }
    
    var mainIcon: String {
        switch self {
        case .welcomeViewOne:
             return "FitnessX"
        case .welcomeViewTwo:
            return "FitnessX-2"
        }
    }
    
    var buttonBackgroundColor: [Color] {
        switch self {
        case .welcomeViewOne:
            return [Color.brandColorOne,Color.brandColorOne,Color.brandColorOne,Color.brandColorOne,Color.brandColorTwo ]
        case .welcomeViewTwo:
            return [Color.white]
        }
    }
    
    
    var buttonTextColor: [Color] {
        switch self {
        case .welcomeViewOne:
            return [Color.white]
        case .welcomeViewTwo:
            return [Color.brandColorOne,Color.brandColorOne,Color.brandColorOne,Color.brandColorOne,Color.brandColorTwo]
        }
    }
}


final class WelcomeViewModel: ObservableObject {
    private let router: WelcomeRouter
    private(set) var currentType: WelcomeViewType
    
    init(router: WelcomeRouter, type: WelcomeViewType) {
        self.router = router
        self.currentType = type
    }
    
    func getStartedOnTap() {
        if currentType == .welcomeViewOne {
            router.navigateToWelcomeView(type: .welcomeViewTwo)
        } else if currentType == .welcomeViewTwo {
            router.navigateToOnboardingView(type: .onboardingViewOne)
        }
        
    }
}
