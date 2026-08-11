//
//  RowView.swift
//  Reminder
//
//  Created by Nithya Vasudevan on 02.07.26.
//

import SwiftUI

struct RowView<Trailing:View> : View {
    var iconName : String
    var iconForegroundColor : Color?
    var rowTitle : String
    var subtitle : String
    let onTap: () -> Void
    let trailing : () -> Trailing
    
    var body: some View {
        HStack{
            Button(action: onTap) {
                HStack(spacing : 20) {
                    Image(systemName: iconName)
                        .foregroundStyle(iconForegroundColor ?? .black)
                    VStack(alignment : .leading){
                        Text(rowTitle)
                        if !subtitle.isEmpty {
                            Text(subtitle)
                                .font(.system(size: 13))
                                .foregroundStyle(.blue)
                                .lineLimit(1)
                        }
                    }
                    Spacer()
                }
                .contentShape(Rectangle())
            }
            .buttonStyle(.plain)
            trailing()
        }
    }
}
