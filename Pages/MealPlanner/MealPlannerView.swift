//
//  MealPlannerView.swift
//  FitnessDietApp
//
//  Created by Irem Subası on 3.05.2023.
//

import Foundation
import SwiftUI
import Charts




struct MealPlannerView: View {
    @State private var food = MealNutritions.consumed
    @ObservedObject private var viewModel: MealPlannerViewModel
    
    init(viewModel: MealPlannerViewModel) {
        self.viewModel = viewModel
    }
    
    var backgroundGradient = LinearGradient(gradient: Gradient(colors: [Color.brandColorOne,Color.brandColorOne,Color.brandColorOne,Color.brandColorOne,Color.brandColorTwo ]), startPoint: .trailing, endPoint: .leading)
    
    var body: some View{
        NavigationView{
            VStack{
                HStack{
                    Text("Meal Nutritions")
                        .frame(width: 123, height: 23)
                        .font(Font.semiBoldFont(16))
                        .foregroundColor(Color.appBlackColor)
                     //   .padding(.top, 37)
                        .padding(.leading,30)
                        .padding(.trailing,222)
                }
                Chart {
                                ForEach(food) { f in
                                    LineMark(x: .value("Day", f.day), y: .value("Percent", f.percent))
                                }
                                .foregroundStyle(backgroundGradient)
                                .interpolationMethod(.catmullRom)
                                .symbol(Circle())
                            }
                .frame(height: 220)
                .padding(.bottom,30)
                VStack{
                    
                    HStack{
                            Text("Daily Meal Schedule")
                            .font(Font.mediumFont(14))
                            .padding(.vertical,18)
                            .padding(.leading,20)
                            .padding(.trailing,65)
                            Button(action: {
                                // Handle
                            }){
                                Text("Check")
                                    .frame(width: 68, height:28)
                                    .font(Font.regularFont(12))
                                    .foregroundColor(.white)
                                    .background(backgroundGradient)
                            }
                        }
                    
                    .background(backgroundGradient)
                  //  .opacity(0.2)// will check
                    .cornerRadius(16)
                    .padding(.horizontal,30)
                }
                VStack{
                    Text("Today Meals")
                        .frame(width: 103, height: 24)
                        .font(Font.semiBoldFont(16))
                        .foregroundColor(Color.appBlackColor)
                        .padding(.leading,30)
                }
            }
            .navigationBarTitle("Meal Planner", displayMode: .inline)
                        .navigationBarBackButtonHidden(true)
                        .navigationBarItems(leading:
                            Button(action: {
                                // Handle 
                            }) {
                                Image("BackNavigationButton")
                                .frame(width: 32, height: 32)
                                .padding(.horizontal)
                }
            )
                        
        }
    }
}
