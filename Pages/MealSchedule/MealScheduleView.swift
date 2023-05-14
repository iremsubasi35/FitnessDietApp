//
//  MealScheduleView.swift
//  FitnessDietApp
//
//  Created by Irem Subası on 11.05.2023.
//

import Foundation
import SwiftUI

struct MealScheduleView: View {
    @ObservedObject private var viewModel: MealScheduleViewModel
    
    init(viewModel: MealScheduleViewModel){
        self.viewModel = viewModel
    }
    
    var body: some View {
        ScrollView {
            contentView
                .onAppear{
                    viewModel.initialize()
                }
                .navigationBarTitle("Meal Schedule", displayMode: .inline)
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
extension MealScheduleView{
    @ViewBuilder
    private var contentView: some View{
        VStack(spacing: 30) {
            Rectangle()
                .frame(height: 16)
                .foregroundColor(.clear)
            breakfastView
            lunchView
            snackView
            dinnerView
        }
    }
}

// MARK: - Breakfast
extension MealScheduleView {
    @ViewBuilder
    private var breakfastView: some View {
        if let presentation = viewModel.breakfastViewPresentation {
            VStack{
                HStack{
                    Text(presentation.title)
                        .font(Font.semiBoldFont(16))
                        .foregroundColor(Color.appBlackColor)
                    Spacer()
                    Text("\(presentation.items.count) meals | \(presentation.calorie) calories")
                }
                .padding(.bottom,10)
                VStack(spacing: 15){
                    ForEach(presentation.items) { item in
                        breakfastItemView(item)
                    }
                }
            }
            .padding(.horizontal,30)
        } else {
            EmptyView()
        }
    }
    
    @ViewBuilder
    private func breakfastItemView (_ presentation: BreakfastItem) -> some View {
        ZStack{
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(.white)
            HStack{
                ZStack{
                    Rectangle()
                        .frame(width: 60 ,height: 60)
                        .foregroundColor(presentation.backgroundColor)
                        .cornerRadius(12)
                    Image(presentation.image)
                        .resizable()
                        .frame(width: 40,height: 35)
                }
                VStack{
                    HStack {
                        Text(presentation.title)
                            .font(Font.mediumFont(14))
                            .foregroundColor(Color.appBlackColor)
                        Spacer()
                    }
                    
                    HStack {
                        Text(presentation.subtitle)
                            .font(Font.regularFont(12))
                            .foregroundColor(Color.appGrayOne)
                        Spacer()
                    }
                }
                Spacer()
                Button(action:{
                    //handle
                }){
                    Image("Icon-Arrow")
                        .resizable()
                        .frame(width: 24,height: 24)
                }
                
            }
        }
    }
}


// MARK: - Breakfast
extension MealScheduleView {
    @ViewBuilder
    private var lunchView: some View {
        if let presentation = viewModel.lunchViewPresentation {
            VStack{
                HStack{
                    Text(presentation.title)
                        .font(Font.semiBoldFont(16))
                        .foregroundColor(Color.appBlackColor)
                    Spacer()
                    Text("\(presentation.items.count) meals | \(presentation.calorie) calories")
                }
                .padding(.bottom,10)
                VStack(spacing: 15){
                    ForEach(presentation.items) { item in
                        lunchItemView(item)
                    }
                }
            }
            .padding(.horizontal,30)
        } else {
            EmptyView()
        }
    }
    
    @ViewBuilder
    private func lunchItemView(_ presentation: LunchItem) -> some View {
        ZStack{
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(.white)
            HStack{
                ZStack{
                    Rectangle()
                        .frame(width: 60 ,height: 60)
                        .foregroundColor(presentation.backgroundColor)
                        .cornerRadius(12)
                    Image(presentation.image)
                        .resizable()
                        .frame(width: 40,height: 35)
                }
                VStack{
                    HStack {
                        Text(presentation.title)
                            .font(Font.mediumFont(14))
                            .foregroundColor(Color.appBlackColor)
                        Spacer()
                    }
                    
                    HStack {
                        Text(presentation.subtitle)
                            .font(Font.regularFont(12))
                            .foregroundColor(Color.appGrayOne)
                        Spacer()
                    }
                    
                }
                Spacer()
                Button(action:{
                    //handle
                }){
                    Image("Icon-Arrow")
                        .resizable()
                        .frame(width: 24,height: 24)
                }
                
            }
        }
    }
    
}


// MARK: - Breakfast
extension MealScheduleView {
    @ViewBuilder
    private var snackView: some View {
        if let presentation = viewModel.snacksViewPresentation {
            VStack{
                HStack{
                    Text(presentation.title)
                        .font(Font.semiBoldFont(16))
                        .foregroundColor(Color.appBlackColor)
                    Spacer()
                    Text("\(presentation.items.count) meals | \(presentation.calorie) calories")
                }
                .padding(.bottom,10)
                VStack(spacing: 15){
                    ForEach(presentation.items) { item in
                        snackItemView(item)
                    }
                }
            }
            .padding(.horizontal,30)
        } else {
            EmptyView()
        }
    }
    
    @ViewBuilder
    private func snackItemView (_ presentation: SnacksItem) -> some View {
        ZStack{
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(.white)
            HStack{
                ZStack{
                    Rectangle()
                        .frame(width: 60 ,height: 60)
                        .foregroundColor(presentation.backgroundColor)
                        .cornerRadius(12)
                    Image(presentation.image)
                        .resizable()
                        .frame(width: 40,height: 35)
                }
                VStack{
                    HStack {
                        Text(presentation.title)
                            .font(Font.mediumFont(14))
                            .foregroundColor(Color.appBlackColor)
                        Spacer()
                    }
                    
                    HStack {
                        Text(presentation.subtitle)
                            .font(Font.regularFont(12))
                            .foregroundColor(Color.appGrayOne)
                        Spacer()
                    }
                    
                }
                Spacer()
                Button(action:{
                    //handle
                }){
                    Image("Icon-Arrow")
                        .resizable()
                        .frame(width: 24,height: 24)
                }
                
            }
        }
    }
    
}



// MARK: - Breakfast
extension MealScheduleView {
    @ViewBuilder
    private var dinnerView: some View {
        if let presentation = viewModel.dinnerViewPresentation {
            VStack{
                HStack{
                    Text(presentation.title)
                        .font(Font.semiBoldFont(16))
                        .foregroundColor(Color.appBlackColor)
                    Spacer()
                    Text("\(presentation.items.count) meals | \(presentation.calorie) calories")
                }
                .padding(.bottom,10)
                VStack(spacing: 15){
                    ForEach(presentation.items) { item in
                        dinnerItemView(item)
                    }
                }
            }
            .padding(.horizontal,30)
        } else {
            EmptyView()
        }
    }
    
    @ViewBuilder
    private func dinnerItemView (_ presentation: DinnerItem) -> some View {
        ZStack{
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(.white)
            HStack{
                ZStack{
                    Rectangle()
                        .frame(width: 60 ,height: 60)
                        .foregroundColor(presentation.backgroundColor)
                        .cornerRadius(12)
                    Image(presentation.image)
                        .resizable()
                        .frame(width: 40,height: 35)
                }
                VStack{
                    HStack {
                        Text(presentation.title)
                            .font(Font.mediumFont(14))
                            .foregroundColor(Color.appBlackColor)
                        Spacer()
                    }
                    
                    HStack {
                        Text(presentation.subtitle)
                            .font(Font.regularFont(12))
                            .foregroundColor(Color.appGrayOne)
                        Spacer()
                    }
                    
                }
                Spacer()
                Button(action:{
                    //handle
                }){
                    Image("Icon-Arrow")
                        .resizable()
                        .frame(width: 24,height: 24)
                }
                
            }
        }
    }
    
}





