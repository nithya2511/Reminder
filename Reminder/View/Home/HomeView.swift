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
        NavigationStack(path: $homeViewModel.navigationPath) {
            ZStack{
                AppTheme.background.ignoresSafeArea()
                ScrollView {
                    VStack(){
                        TileView(categories: homeViewModel.categories)
                        ListView(
                            titleNames : homeViewModel.titleNames,
                            onDelete : { id in
                                homeViewModel.deleteList(id: id)
                            },
                            onInfo : { id in
                                homeViewModel.infoTapped(id: id)
                            }
                        )
                    }
                }
                .defaultPageRightPadding()
            }
            .navigationDestination(for: UUID.self) { id in
                if let title = homeViewModel.title(for: id) {
                    ReminderListDetailView(title: title) { reminders in
                        homeViewModel
                            .updateReminders(for: title.id, reminders: reminders)
                        
                    }
                }
            }
            .toolbar{
                toolbarContent
            }
            .overlay(alignment : .bottomTrailing) {
                BottomBarView {
                    homeViewModel.onAddButtonTapped()
                }
            }
            .sheet(item: $homeViewModel.activeSheet) { sheet in
                switch sheet {
                case .createList : CreateNewListView(onSave:{ newList in
                    homeViewModel.addListAndOpen(named: newList)})
                .presentationBackground(AppTheme.background)
                    
                case .editList(let title): CreateNewListView(title: title) { editedList in
                    homeViewModel.updateList(editedList)
                }
                .presentationBackground(AppTheme.background)
                    
                case .createReminder: CreateNewReminderView(
                    titleNames: homeViewModel
                        .titleNames)
                }
            }

//            .sheet(isPresented: $homeViewModel.isShowingCreateNewReminderSheet) {
//                CreateNewReminderView(titleNames: homeViewModel.titleNames)
//            }
        }
    }
    
    
    @ToolbarContentBuilder
    private var toolbarContent: some ToolbarContent {
        ToolbarItemGroup(placement: .topBarTrailing) {
            Button{
            } label: {
                Image(systemName: "magnifyingglass")
            }
            //TODO: Change icon later
            Button{
                homeViewModel.createNewListButtonTapped()
            } label: {
                Image(systemName: "list.bullet.rectangle")
            }
            Button {
            }label: {
                Image(systemName: "ellipsis.circle")
            }
        }
    }
}







struct ListView : View {
    let titleNames : [Title]
    let onDelete : (UUID) -> Void
    let onInfo : (UUID) -> Void
    
    var body : some View {
        VStack {
            Text("My Lists")
                .font(Font.system(size: 26, weight: .bold, design: .rounded))
                .frame(maxWidth: .infinity, alignment: .leading)
            List {
                ForEach(titleNames) { title in
                    NavigationLink(value: title.id) {
                        TitleItemView(titleItem: title)
                    }
                    .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                            Button(role:.destructive) {
                                onDelete(title.id)
                            } label: {
                                Image(systemName: "trash")
                            }
                            Button {
                                     onInfo(title.id)
                                 } label: {
                                     Image(systemName: "info.circle")
                                 }
                    }
                }
            }
            .listStyle(.plain)
            .frame(height: CGFloat(titleNames.count) * 70)
            .clipShape(RoundedRectangle(cornerRadius: 10))
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
