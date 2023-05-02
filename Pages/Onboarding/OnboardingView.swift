//
//  OnboardingView.swift
//  FitnessDietApp
//
//  Created by Irem Subası on 2.05.2023.
//

import Foundation
import SwiftUI

struct OnBoardingView: View {
    
    @ObservedObject private var viewModel: OnboardingViewModel
    
    init(viewModel: OnboardingViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View{
        VStack{
            Image(viewModel.currentType.onboardingImage)
                .resizable()
                .frame(height: 442)
                .edgesIgnoringSafeArea(.all)
                                
                                .padding(.top, 0)
                                .padding(.bottom, 64)
                                
            VStack(alignment: .leading){
                HStack{
                    Text(viewModel.currentType.onboardingTitle)
                        .multilineTextAlignment(.leading)
                        .frame(height: viewModel.currentType == .onboardingViewFour ? 72 : 36)
                        .font(Font.boldFont(24))
                        .foregroundColor(Color.appBlackColor)
                        
                        .padding(.leading ,30)
                        .padding(.bottom, 15)
                    Spacer()
                }
            
                Text(viewModel.currentType.onboardingDescription)
                    .frame(height: 63)
                    .multilineTextAlignment(.leading)
                    .font(Font.regularFont(14))
                    .lineSpacing(2)
                    .foregroundColor(Color.appGrayOne)
                    .padding(.leading,30)
                    .padding(.trailing,30)
                    .padding(.bottom,viewModel.currentType == .onboardingViewFour ? 92 : 128)
                
            }
           
            Button(action:{
                viewModel.nextButtonOnTap()
            } ){
                Image(viewModel.currentType.onboardingButtonImage)
                    .frame(width: 60,height: 60)
                    .padding(.leading, 285)
                    .padding(.trailing, 30)
                    .padding(.bottom, 48)
            }
            
        }
    }
}
