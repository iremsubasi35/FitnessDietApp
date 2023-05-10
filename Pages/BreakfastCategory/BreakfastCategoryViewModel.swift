//
//  BreakfastCategoryViewModel.swift
//  FitnessDietApp
//
//  Created by Irem Subası on 10.05.2023.
//

import Foundation
import SwiftUI

final class BreakfastCategoryViewModel: ObservableObject{
    private let router: BreakfastCategoryRouter
    
    init(router: BreakfastCategoryRouter) {
        self.router = router
        
    }
}
