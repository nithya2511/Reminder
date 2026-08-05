//
//  ReminderListItemView.swift
//  Reminder
//
//  Created by Nithya Vasudevan on 26.05.26.
//

import SwiftUI

struct TitleItemView: View {
    var titleItem : Title
    
    var body : some View {
        HStack(alignment : .center){
            Image(systemName: titleItem.iconName)
                .foregroundStyle(.white)
                .frame(width: 32, height: 32)
                .background{
                    Circle()
                        .fill(titleItem.iconColor.color)
                }
            
            
            VStack(alignment : .leading) {
                Text(titleItem.title)
                    .font(Font.system(
                        size: 20,
                        weight: .regular,
                        design: .rounded))
                    .foregroundStyle(.black)
                if(titleItem.info != nil ) {
                    Text(titleItem.info ?? "")
                        .foregroundStyle(.gray)
                        .font(Font.system(size: 12, weight: .regular, design: .rounded))
                }
            }
            Spacer()
            
            Text("\(titleItem.count)")
                .font(
                    Font.system(size: 20, weight: .semibold, design: .rounded)
                )
                .foregroundStyle(.gray)
        }
        .frame(height: 60, alignment: .center)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    TitleItemView(
        titleItem: Title(
            title: "Pantry",
            iconColor: .red,
            iconName: "list.bullet",
            info: "Created by Sid",
            reminders: []
        )
    )
}

