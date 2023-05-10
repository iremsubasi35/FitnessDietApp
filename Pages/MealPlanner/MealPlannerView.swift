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
    @ObservedObject private var viewModel: MealPlannerViewModel
    @State var showPopover = false
    
    @State private var selectedMealIndex = 0
    @State private var isShowingSheet = false
    
    let meals = ["breakfast", "lunch", "dinner"]
    
    init(viewModel: MealPlannerViewModel) {
        self.viewModel = viewModel
    }
    
    var backgroundGradient = LinearGradient(gradient: Gradient(colors: [Color.brandColorOne,Color.brandColorOne,Color.brandColorOne,Color.brandColorOne,Color.brandColorTwo ]), startPoint: .trailing, endPoint: .leading)
    
    var body: some View{
        ScrollView {
            contentView
                .onAppear {
                    viewModel.initialize()
                }
        }
    }
    

//                }
//            .navigationBarTitle("Meal Planner", displayMode: .inline)
//                        .navigationBarBackButtonHidden(true)
//                        .navigationBarItems(leading:
//                            Button(action: {
//                                // Handle
//                            }) {
//                                Image("BackNavigationButton")
//                                .frame(width: 32, height: 32)
//                                .padding(.horizontal)
//                }
//            )
    
}

// MARK: - Content View
extension MealPlannerView {
    @ViewBuilder
    private var contentView: some View {
        VStack(spacing: 30) {
            chartView
            dailyMealView
            todayMealsView
            findSomethingToEat
            
        }
        .padding(.top, 30)
    }
}

// MARK: - Chart View
extension MealPlannerView {
    @ViewBuilder
    private var chartView: some View {
        if let presentation = viewModel.nutritionsViewPresentation {
            VStack {
                HStack{
                    Text(presentation.title)
                        .frame(width: 123, height: 23)
                        .font(Font.semiBoldFont(16))
                        .foregroundColor(Color.appBlackColor)
                        .padding(.trailing,104)
                    Button(action: {
                        // Handle
                    }){
                        HStack {
                            Text("Calories")
                                .font(Font.regularFont(10))
                                .foregroundColor(.white)
                                .padding(.leading, 10)
                              
                            Image("DownArrow")
                                .resizable()
                                .foregroundColor(.white)
                                .frame(width: 15, height: 15)
                                .padding(.trailing, 10)
                        }
                        .frame(height: 30)
                       
                        .background(backgroundGradient)
                        .cornerRadius(.infinity)
                    }
                    Spacer()
                }

                Chart {
                    ForEach(presentation.items) { f in
                        LineMark(x: .value("Day", f.day), y: .value("Percent", f.percent))
                    }
                    .foregroundStyle(backgroundGradient)
                    .interpolationMethod(.catmullRom)
                    .symbol(Circle())
                }
                .padding(.top, 8)
                .frame(height: 220)
            }
            .padding(.horizontal, 30)
          
        } else {
            EmptyView()
        }
    }
}

// MARK: - DailyMealView
extension MealPlannerView {
    @ViewBuilder
    private var dailyMealView: some View {
        ZStack {
            backgroundGradient.opacity(0.2)
                .cornerRadius(16)
            HStack(spacing: 0) {
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
                        .cornerRadius(.infinity)
                        .padding(.trailing, 20)
                }
                
            }
        }
        .padding(.horizontal, 30)
    }
}

// MARK: - DailyMealView
extension MealPlannerView {
    @ViewBuilder
    private var todayMealsView: some View {
        if let presentation = viewModel.todayMealsViewPresentation {
            VStack {
                HStack {
                    Text(presentation.title)
                        .font(Font.semiBoldFont(16))
                        .foregroundColor(Color.appBlackColor)
                    Spacer()
                    
                    Button(action: {
                        // Handle
                    }){
                        HStack {
                            Text("Breakfast")
                                .font(Font.regularFont(10))
                                .foregroundColor(.white)
                                .padding(.leading, 10)
                              
                            Image("DownArrow")
                                .resizable()
                                .foregroundColor(.white)
                                .frame(width: 15, height: 15)
                                .padding(.trailing, 10)
                        }
                        .frame(height: 30)
                        .background(backgroundGradient)
                        .cornerRadius(.infinity)
                       
                    }
                }
                .padding(.bottom, 18)
                
                VStack(spacing: 15) {
                    ForEach(presentation.items) { item in
                        todayMealItemView(item)
                            .shadow(color:Color.appBlackColor.opacity(0.07),radius: 40, x: 0, y:10)
                    }
                }
             
            }
            .padding(.horizontal, 30)
        } else {
            EmptyView()
        }
    }
    
    @ViewBuilder
    private func todayMealItemView(_ presentation: TodayMealsItem) -> some View {
       ZStack {
            RoundedRectangle(cornerRadius: 16)
               .foregroundColor(.white)
           HStack(spacing: 24) {
               Image(presentation.image)
                   .resizable()
                   .frame(width: 42, height: 42)
               VStack {
                   HStack {
                       Text(presentation.title)
                           .font(Font.semiBoldFont(14))
                           .foregroundColor(Color.appBlackColor)
                       Spacer()
                   }
                   
                   HStack {
                       Text(presentation.subtitle)
                           .font(Font.semiBoldFont(12))
                           .foregroundColor(Color.appGrayOne)
                       Spacer()
                   }
               }
               Spacer()
           }
           .padding(.horizontal, 24)
        }
       .frame(minHeight: 80)
    }
    // MARK: - FindSomethingToEatView
    @ViewBuilder
    private var findSomethingToEat: some View {
        if let presentation = viewModel.boxesViewPresentation{
            VStack{
                HStack{
                    Text(presentation.title)
                        .font(Font.semiBoldFont(16))
                        .foregroundColor(Color.appBlackColor)
                    Spacer()
                }
                ScrollView(.horizontal){
                    HStack{
                        ForEach(presentation.items){ nextitem in
                            findSomethingToEatItemView(nextitem)
                        }
                    }
                }
                
            }
            .padding(.leading,30)
        } else{
            EmptyView()
        }
    }
    
    @ViewBuilder
    private func findSomethingToEatItemView(_ presentation: BoxPresentation) -> some View{
        ZStack{
            RoundedRectangle(cornerRadius: 22)
                .foregroundColor(presentation.backgroundColor)
            HStack{
                Spacer()
                VStack{
                    Image(presentation.image).resizable()
                        .frame(width: 118,height: 74)
                    Spacer()
                }
            }
            HStack{
                VStack{
                    HStack{
                        Text(presentation.title)
                            .frame(height: 18)
                            .foregroundColor(Color.appBlackColor)
                            .font(Font.mediumFont(14))
                        Spacer()
                    }
                    HStack{
                        Text("\(presentation.foodValue)+ Foods")
                            .frame(height: 18)
                            .foregroundColor(Color.appGrayOne)
                            .font(Font.regularFont(12))
                        Spacer()
                    }
                    HStack{
                        buttonView(title: "Select",
                                   backgroundColor: presentation.buttonColor) {
                            viewModel.someThingToEatModelTapped(presentation)
                        }
                        
//                        Button(action: {
//                            // Handle
//                        }){
//                            Text("Select")
//                                .frame(width: 98, height:30)
//                                .font(Font.semiBoldFont(12))
//                                .foregroundColor(.white)
//                                .background(presentation.buttonColor)
//                                .cornerRadius(.infinity)
//                        }
                        Spacer()
                    }
                }
                .padding(.leading,20)
                   .padding(.top,94)
                   .padding(.bottom,20)
                Spacer()
            }
            
               
 
        }
        .frame(width: 200,height: 200)
    }
}

extension MealPlannerView {
    @ViewBuilder
    private func buttonView(title: String,
                            backgroundColor: Color,
                            closure: @escaping () -> Void) -> some View {
        Button {
            closure()
        } label: {
            Text(title)
                .frame(width: 98, height:30)
                .font(Font.semiBoldFont(12))
                .foregroundColor(.white)
                .background(backgroundColor)
                .cornerRadius(.infinity)
        }

    }
}


