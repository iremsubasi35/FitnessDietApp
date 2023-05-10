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
                 //   viewModel.initialize()
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
            .cornerRadius(.infinity)
            .shadow(color:Color.appBlackColor.opacity(0.07),radius: 40, x: 0, y:10)//?
            .padding(.horizontal,30)
                        Spacer()
        }
    }
}

