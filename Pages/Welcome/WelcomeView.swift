//
//  WelcomeView.swift
//  FitnessDietApp
//
//  Created by Irem Subası on 1.05.2023.
//

import Foundation
import SwiftUI

let backgroundGradient = LinearGradient(gradient: Gradient(colors: [Color.brandColorOne,Color.brandColorOne,Color.brandColorOne,Color.brandColorOne,Color.brandColorTwo ]), startPoint: .trailing, endPoint: .leading)
struct WelcomeView: View {
    @ObservedObject private var viewModel: WelcomeViewModel
    
    init(viewModel: WelcomeViewModel) {
        self.viewModel = viewModel
    }
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: viewModel.currentType.backgroundColor), startPoint: .trailing, endPoint: .leading)
                .ignoresSafeArea(.all)
            VStack{
                Image(viewModel.currentType.mainIcon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 168, height: 75)
                    .padding(.bottom, -15)
                
                Text("Everdybody Can Train")
                    .font(.regularFont(18))
                    .foregroundColor(Color.appGrayOne)
                Button(action: {
                    viewModel.getStartedOnTap()
                }){
                    Text("Get Started")
                        .frame(width: 315, height: 60)
                        .font(.system(size: 16))//buttonTextColor
                        .foregroundStyle(LinearGradient(gradient: Gradient(colors: viewModel.currentType.buttonTextColor), startPoint: .trailing, endPoint: .leading))
                        .fontWeight(.bold)
                        .background(
                            LinearGradient(gradient: Gradient(colors: viewModel.currentType.buttonBackgroundColor), startPoint: .trailing, endPoint: .leading)
                        )
                        .cornerRadius(.infinity)
                        .shadow(color:Color.blueShadow,radius: 99, x: 0, y:10)
                }
                .padding(.horizontal, 30)
                .padding(.bottom, 40)
                .offset(y: 300)//271
        }
    }
       
  }

}

