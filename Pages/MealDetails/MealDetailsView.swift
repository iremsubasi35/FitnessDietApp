//
//  MealDetailsView.swift
//  FitnessDietApp
//
//  Created by Irem Subası on 11.05.2023.
//

import Foundation
import SwiftUI

struct MealDetailsView: View{
    @ObservedObject private var viewModel: MealDetailsViewModel
    
    init(viewModel: MealDetailsViewModel){
        self.viewModel = viewModel
    }
    var body: some View {
        ScrollView{
            contentView
                .onAppear{
                 viewModel.initialize()
                }
                .navigationBarBackButtonHidden(true)
                .navigationBarItems(leading:
                                        Button(action: {
                    RoutingManager.shared.pop()
                                        }) {
                                            Image("BackNavigationButton")
                                                .frame(width: 32, height: 32)
                                                .padding(.horizontal)
                                        }
                )
        }
    }
}

// MARK: - Content View
extension MealDetailsView{
    @ViewBuilder
    private var contentView: some View{
        VStack(spacing: 30) {
            mealView
            nutritionCollectionView
            descriptionView
            ıngredientsView
            stepByStepView
        }
    }
}

// MARK: - MEAL DETAİL
extension MealDetailsView {
    @ViewBuilder
    private var mealView: some View {
            VStack{
                ZStack{
                    Image("Blue-Bg")
                        .resizable()
                        .frame(height: 400)
                        .padding(.horizontal,0)
                    Image("MealDetailsPancake")
                        .resizable()
                        .frame(width: 288,height: 288)
                }
                HStack{
                    VStack{
                        Text("Blueberry Pancake")
                            .font(Font.semiBoldFont(16))
                            .foregroundColor(.appBlackColor)
                        HStack{
                            Text("by James Ruth")
                                .foregroundColor(.appGrayOne)
                                .font(Font.regularFont(12))
                        }
                    }
                    .padding(.trailing,30)
                    Spacer()
                    Button(action: {
                        // Handle
                    }){
                        Image("Calories-Icon")
                            .resizable()
                          .frame(width: 32, height:32)
                       }
                    .padding(.horizontal,30)
                }
            }
    }
}

extension MealDetailsView{
    @ViewBuilder
    private var nutritionCollectionView: some View {
        if let presentation = viewModel.nutritionViewPresentation {
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
                            nutritionItemView(nextitem)
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
    private func nutritionItemView(_ presentation: NutritionPresentation) -> some View {
        ZStack{
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(Color.brandColorOne.opacity(0.2))
            HStack{
                Image(presentation.image)
                    .resizable()
                    .frame(width: 18,height: 18)
                Text(presentation.description)
                    .font(Font.regularFont(10))
                    .foregroundColor(.appBlackColor)
                
            }
            .padding(.horizontal,10)
        }
        .frame(height: 38)
    }
}

extension MealDetailsView{
    @ViewBuilder
    private var descriptionView: some View {
        VStack{
            HStack{
                Text("Descriptions")
                    .font(Font.semiBoldFont(16))
                    .foregroundColor(Color.appBlackColor)
                Spacer()
                   
            }
            .padding(.leading,30)
            Text("Pancakes are some people's favorite breakfast, who doesn't like pancakes? Especially with the real honey splash on top of the pancakes, of course everyone loves that! besides being Read More...")
                .font(Font.regularFont(12))
                .foregroundColor(.appGrayOne)
                .padding(.horizontal,30)
        }
    }
}
extension MealDetailsView{
    @ViewBuilder
    private var ıngredientsView: some View {
        if let presentation = viewModel.ıngredientsViewPresentation {
            VStack{
                HStack{
                    Text(presentation.title)
                        .font(Font.semiBoldFont(16))
                        .foregroundColor(Color.appBlackColor)
                    Spacer()
                    Text("6 items")
                        .font(Font.regularFont(12))
                        .foregroundColor(.appGrayOne)
                    Spacer()
                }
                ScrollView(.horizontal){
                    HStack{
                        ForEach(presentation.items){ nextitem in
                            ıngredientsItemView(nextitem)
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
    private func ıngredientsItemView(_ presentation: IngredientsPresentation) -> some View{
        VStack{
            ZStack{
                Image("MealDetails-Bg")
                    .resizable()
                    .frame(width: 80,height: 80)
                Image(presentation.image)
                    .resizable()
                    .frame(width: 40,height: 43)
            }
            .frame(width: 80,height: 122)
            Text(presentation.title)
                .font(Font.regularFont(12))
                .foregroundColor(Color.appBlackColor)
            Text(presentation.subtitle)
                .font(Font.regularFont(10))
                .foregroundColor(Color.appGrayOne)
        }
        
    }
}

extension MealDetailsView{
    @ViewBuilder
    private var stepByStepView: some View {
        if let presentation = viewModel.stepByStepViewPresentation{
            VStack{
                HStack{
                    Text(presentation.title)
                        .font(Font.semiBoldFont(16))
                        .foregroundColor(Color.appBlackColor)
                    Spacer()
                    Text("\(presentation.items.count) steps")
                        .font(Font.regularFont(12))
                        .foregroundColor(.appGrayOne)
                    Spacer()
                    VStack(spacing: 15) {
                        ForEach(presentation.items) { item in
                            stepByStepItemView(item)
                        }
                    }
                }
                .padding(.horizontal,30)
            }
        }else {
            EmptyView()
        }
    }
    
    @ViewBuilder
    private func stepByStepItemView(_ presentation: StepByStepPresentation) -> some View{
        HStack(spacing: 15){
            ZStack{
                Circle()
                    .foregroundColor(Color.brandColorOne)
                    .frame(width: 24, height: 24)
                Text("\(presentation.itemId + 1)")
                    .foregroundColor(.white)
            }
            Divider()
                            .frame(height: 2)
                            .background(Color.appGrayOne)
                        Text(presentation.step)
                            .font(.regularFont(14))
                            .foregroundColor(.appBlackColor)
                            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}


