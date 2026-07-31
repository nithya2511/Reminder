//
//  ReminderListItem.swift
//  Reminder
//
//  Created by Nithya Vasudevan on 26.05.26.
//

import SwiftUI


struct Title : Identifiable {
    let id : UUID
    let title: String
    let iconColor : Color
    let iconName : String
    let info : String?
    let reminders : [Reminder]?
    
    var count : Int {
        reminders?.count ?? 0
    }
    
    init(
        id: UUID = UUID(),
        title: String,
        iconColor: Color,
        iconName: String = "list.bullet",
        info: String?,
        reminders: [Reminder]?
    ) {
        self.id = id
        self.title = title
        self.iconColor = iconColor
        self.iconName = iconName
        self.info = info
        self.reminders = reminders
    }
}


