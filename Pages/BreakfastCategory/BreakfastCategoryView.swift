//
//  BreakfastCategoryView.swift
//  FitnessDietApp
//
//  Created by Irem Subası on 10.05.2023.
//

import Foundation
import SwiftUI

struct BreakfastCategoryView: View{
    @ObservedObject private var viewModel: BreakfastCategoryViewModel
    @State private var searchText = ""
    
    init(viewModel: BreakfastCategoryViewModel) {
        self.viewModel = viewModel
    }
    var body: some View{
        ScrollView {
            contentView
                .onAppear {
                    viewModel.initialize()
                }
        }
    }
}

// MARK: - Content View
extension BreakfastCategoryView {
    @ViewBuilder
    private var contentView: some View {
        VStack(spacing: 30) {
            searchView
            categoryView
            recommendationForDietView
            popularView
        }
        .padding(.top, 30)
    }
}
// MARK: - Search View
extension BreakfastCategoryView{
    @ViewBuilder
    private var searchView: some View {
        VStack{
            HStack{
                Image("Search").resizable().frame(width: 16,height: 16)
                TextField("Search Pancake", text: $searchText)
                Text("|").foregroundColor(Color.appGrayThree)
                    .padding(.trailing,0)
                                    .frame(height: 50)
                                Spacer()
                                Button(action: {
                                    // Handle
                                }) {
                                        Image("Filter")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                }
            }
//            .cornerRadius(.infinity)
//            .shadow(color:Color.appBlackColor.opacity(0.07),radius: 40, x: 0, y:10)//?
            .padding(.horizontal,30)
             //           Spacer()
        }
    }
}

// MARK: - Category
extension BreakfastCategoryView{
    @ViewBuilder
    private var categoryView: some View {
        if let presentation = viewModel.categoriesViewPresentation{
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
                            categoryItemView(nextitem)
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
    private func categoryItemView(_ presentation: CategoryPresentation) -> some View{
        ZStack{
            RoundedRectangle(cornerRadius: 16)
                .foregroundColor(presentation.backgroundColor)
            VStack{
                ZStack{
                    Image("CategoryBg")
                        .resizable()
                        .frame(width: 40,height: 40)
                    Image(presentation.image)
                        .resizable()
                        .frame(width: 26,height: 16)
                }
                VStack{
                    Text(presentation.title)
                        .frame(height: 18)
                        .foregroundColor(Color.appBlackColor)
                        .font(Font.regularFont(12))
                }
            }
        }
        .frame(width: 80,height: 100)
    }
}

// MARK: - RecommendationForDiet
extension BreakfastCategoryView{
    @ViewBuilder
    private var recommendationForDietView: some View{
        if let presentation = viewModel.dietsViewPresentation{
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
                            recommendationForDietItemView(nextitem)
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
    private func recommendationForDietItemView(_ presentation: DietPresentation) -> some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(presentation.backgroundColor)
            VStack{
                Image(presentation.image)
                    .resizable()
                    .frame(width: 116,height: 80)
                Text(presentation.title)
                    .frame(height: 18)
                    .foregroundColor(Color.appBlackColor)
                    .font(Font.mediumFont(14))
                Text("\(presentation.difficulty) | \(presentation.time)mins | \(presentation.calorie)kCal")
                    .frame(height: 18)
                    .foregroundColor(Color.appGrayOne)
                    .font(Font.regularFont(12))
                    .padding(.bottom,15)
                Button(action: {
                    // Handle
                }){
                    Text("View")
                      .frame(width: 110, height:38)
                      .font(Font.semiBoldFont(12))
                      .foregroundColor(.white)
                      .background(presentation.buttonColor)
                      .cornerRadius(.infinity)
                   }
            }
        }
        .frame(width: 200,height: 240)
    }
}

// MARK: - Popular
extension BreakfastCategoryView{
    @ViewBuilder
    private var popularView: some View {
        if let presentation = viewModel.popularViewPresentation{
            VStack{
                HStack{
                    Text(presentation.title)
                        .font(Font.semiBoldFont(16))
                        .foregroundColor(Color.appBlackColor)
                }
                .padding(.bottom, 18)
                
                VStack(spacing: 15) {
                    ForEach(presentation.items) { item in
                        popularItemView(item)
                            .shadow(color:Color.appBlackColor.opacity(0.07),radius: 40, x: 0, y:10)
                    }
                }
            }
            .padding(.horizontal,30)
        } else {
            EmptyView()
        }
    }
    
    @ViewBuilder
    private func popularItemView(_ presentation: PopularItem) -> some View{
        ZStack{
            RoundedRectangle(cornerRadius: 16)
               .foregroundColor(.white)
            HStack{
                Image(presentation.image)
                    .resizable()
                    .frame(width: 90, height: 80)
                VStack{
                    HStack{
                        Text(presentation.title)
                            .font(Font.mediumFont(14))
                            .foregroundColor(Color.appBlackColor)
                        Spacer()
                    }
                    HStack {
                        Text("\(presentation.difficulty) | \(presentation.time)mins | \(presentation.calorie)kCal")
                            .font(Font.regularFont(12))
                            .foregroundColor(Color.appGrayOne)
                        Spacer()
                    }
                }
                Spacer()
            }
            .padding(.horizontal, 30)
        }
       // .frame(minHeight: 80)
    }
}

