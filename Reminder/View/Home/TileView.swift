//
//  TileView.swift
//  Reminder
//
//  Created by Nithya Vasudevan on 26.05.26.
//

import SwiftUI

struct TileView : View {
    let categories : [CardCategory]
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body : some View {
            LazyVGrid(columns : columns , spacing: 10){
                ForEach(categories) {
                    category in CardView(category : category)
                }
        }
    }
}

