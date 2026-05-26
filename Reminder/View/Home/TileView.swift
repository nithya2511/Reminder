//
//  TileView.swift
//  Reminder
//
//  Created by Nithya Vasudevan on 26.05.26.
//

import SwiftUI

struct TileView : View {
    @ObservedObject var homeViewModel : HomeViewModel
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body : some View {
        ScrollView {
            LazyVGrid(columns : columns , spacing: 10){
                ForEach(homeViewModel.categories) {
                    category in CardView(category : category)
                }
            }
        }
    }
}

