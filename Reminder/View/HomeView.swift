//
//  HomeView.swift
//  Reminder
//
//  Created by Nithya Vasudevan on 23.05.26.
//

import SwiftUI

struct HomeView : View {
    @State private var searchText = ""
    var body: some View {
        NavigationStack {
            VStack(){
                
            }
            .searchable(text: $searchText)
            .toolbar{
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        print("Top right button clicked")
                    }label: {
                        Image(systemName: "ellipsis.circle")
                    }
                }
            }
            .defualtPageRightPadding()
        }
    }
}

struct TileView : View {
    var body : some View {
        Text("")
    }
}

struct ListView : View {
    var body : some View {
        Text("")
    }
}

struct BottomBarView : View {
    var body : some View {
        Text("")
    }
}
#Preview {
    HomeView()
}
