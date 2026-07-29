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
        HStack{
            Image(systemName: titleItem.iconName)
                .foregroundStyle(.white)
                .frame(width: 36, height: 36)
                .background{
                    Circle()
                        .fill(titleItem.iconColor)
                }
            
            VStack(spacing : 0){
                HStack {
                    VStack (alignment : .leading){
                        Text(titleItem.title)
                            .font(
                                Font
                                    .system(
                                        size: 22,
                                        weight: .regular,
                                        design: .rounded
                                    )
                            )
                            .foregroundStyle(.black)
                        if(titleItem.info != "" ) {
                            Text(titleItem.info ?? "")
                                .foregroundStyle(.gray)
                                .font(Font.system(size: 14, weight: .regular, design: .rounded))
                        }
                    }
                    .padding(.leading, 5)
                    
                    Spacer()
                    
                    Text("\(titleItem.count)")
                        .font(
                            Font.system(size: 22, weight: .semibold, design: .rounded)
                        )
                        .foregroundStyle(.gray)
                }
            }
            
        }

    }
}

#Preview(traits: .sizeThatFitsLayout) {
    TitleItemView(
        titleItem: Title(
            title: "Pantry",
            iconColor: .red,
            iconName: "list.bullet",
            info: "Created by Sid",
            reminders: nil
        )
    )
}

