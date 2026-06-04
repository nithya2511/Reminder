//
//  ReminderListDetailView.swift
//  Reminder
//
//  Created by Nithya Vasudevan on 26.05.26.
//

import SwiftUI

struct ReminderListDetailView: View {
    
    let reminderListItem : ReminderCategoryListItem
    
    var body: some View {
        
        ZStack {
            AppTheme.background
                .ignoresSafeArea()
            
            ScrollView{
                
                LazyVStack(alignment: .leading, spacing: 16) {
                    Text(reminderListItem.title)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundStyle(reminderListItem.iconColor)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    if let reminders = reminderListItem.reminders {
                        ForEach(reminders) { reminder in
                            ReminderView(reminder : reminder)
                        }
                    }
                    
                }
                .padding()
                
            }
            .overlay(alignment : .bottomTrailing) {
                BottomBarView()
                    .padding(.trailing, 20)
                    .padding(.bottom, 20)
                    
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItemGroup (placement : .topBarTrailing) {
                Button {
                    
                } label: {
                    Image(systemName: "person.crop.circle.badge.checkmark")
                }
                Button {
                } label: {
                    Image(systemName: "square.and.arrow.up")
                }
                
                Button {
                } label: {
                    Image(systemName: "ellipsis")
                }
            }
        }
        
        
    }
}

struct ItemRowView : View {
    var body: some View {
        Text("Hellow world")
    }
}


#Preview {
    NavigationStack {
        ReminderListDetailView(
            reminderListItem: ReminderCategoryListItem(
                title: "Pantry",
                iconColor: .red,
                iconName: "list.bullet",
                info: "Created by Sid",
                count: 5,
                reminders: nil
            )
        )
    }
}
