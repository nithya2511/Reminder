//
//  ReminderListItemView.swift
//  Reminder
//
//  Created by Nithya Vasudevan on 26.05.26.
//

import SwiftUI

struct ReminderListItemView: View {
    var reminderListItem : ReminderCategoryListItem
    
    var body : some View {
        HStack{
            Image(systemName: "list.bullet")
                .foregroundStyle(.white)
                .frame(width: 36, height: 36)
                .background{
                    Circle()
                        .fill(reminderListItem.iconColor)
                }
            
            VStack(spacing : 0){
                HStack {
                    VStack (alignment : .leading){
                        Text(reminderListItem.title)
                            .font(
                                Font
                                    .system(
                                        size: 22,
                                        weight: .regular,
                                        design: .rounded
                                    )
                            )
                            .foregroundStyle(.black)
                        
                        Text(reminderListItem.info ?? "")
                            .foregroundStyle(.gray)
                            .font(Font.system(size: 14, weight: .regular, design: .rounded))
                    }
                    .padding(.leading, 5)
                    
                    Spacer()
                    
                    Text("\(reminderListItem.count)")
                        .padding()
                        .font(
                            Font.system(size: 22, weight: .semibold, design: .rounded)
                        )
                        .foregroundStyle(.gray)
                    
                    Button{
                        
                    }label: {
                        Image(systemName: "chevron.right")
                            .foregroundStyle(.gray)
                    }
                }
                
                Divider()
            }
            
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    ReminderListItemView(
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

