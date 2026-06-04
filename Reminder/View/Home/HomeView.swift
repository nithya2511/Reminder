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
                ScrollView {
                    VStack(){
                        TileView(categories: homeViewModel.categories)
                        ListView(reminderCategoryList : homeViewModel.reminderCategoryList)
                    }
                }
                .defaultPageRightPadding()
            }
            .toolbar{
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button{
                    } label: {
                        Image(systemName: "magnifyingglass")
                    }
                    //TODO: CHange icon later
                    Button{
                    } label: {
                        Image(systemName: "list.bullet.rectangle")
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                    }label: {
                        Image(systemName: "ellipsis.circle")
                    }
                }
            }
            .overlay(alignment : .bottomTrailing) {
                BottomBarView()
                    .padding(.trailing, 20)
                    .padding(.bottom, 20)
                    
            }
            
        }
        
    }
}






struct ListView : View {
    let reminderCategoryList : [ReminderCategoryListItem]
    var body : some View {
        VStack {
            Text("My Lists")
                .font(Font.system(size: 26, weight: .bold, design: .rounded))
                .frame(maxWidth: .infinity, alignment: .leading)
            VStack {
                ForEach(reminderCategoryList) { listItem in
                    NavigationLink{
                        ReminderListDetailView(reminderListItem : listItem)
                    } label: {
                        ReminderListItemView(reminderListItem: listItem)
                        
                    }
                }
            }
            .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 10))
            .background{
                RoundedRectangle(cornerRadius: 10)
                    .fill(.white)
            }
        }
        
    }
}

#Preview {
    HomeView()
}
