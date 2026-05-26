//
//  HomeView.swift
//  Reminder
//
//  Created by Nithya Vasudevan on 23.05.26.
//

import SwiftUI

struct HomeView : View {
    @StateObject private var homeViewModel = HomeViewModel()

    var body: some View {
        NavigationStack {
            ZStack{
                AppTheme.background.ignoresSafeArea()
                
                VStack(){
                    TileView(homeViewModel: homeViewModel)
                    ListView()
                }
                .defaultPageRightPadding()
            }
            .searchable(
                text: $homeViewModel.searchText,
                placement: .navigationBarDrawer(displayMode: .always)
            )
            .toolbar{
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                    }label: {
                        Image(systemName: "ellipsis.circle")
                    }
                }
            }
            
        }
    }
}




struct ListView : View {
    var body : some View {
        VStack {
            Text("My Lists")
                .font(Font.system(size: 32, weight: .bold, design: .rounded))
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        
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
