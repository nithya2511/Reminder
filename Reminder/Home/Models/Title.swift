//
//  ReminderListItem.swift
//  Reminder
//
//  Created by Nithya Vasudevan on 26.05.26.
//

import SwiftUI


struct Title : Identifiable, Codable {
    var id : UUID
    var title: String
    var iconColor : ListColor
    var iconName : String
    var info : String?
    var reminders : [Reminder]
    var isPinned : Bool
    
    var count : Int {
        reminders.count
    }
    
    init(
        id: UUID = UUID(),
        title: String,
        iconColor: ListColor,
        iconName: String = "list.bullet",
        info: String?,
        reminders: [Reminder] = [],
        isPinned : Bool = false
    ) {
        self.id = id
        self.title = title
        self.iconColor = iconColor
        self.iconName = iconName
        self.info = info
        self.reminders = reminders
        self.isPinned = isPinned
    }
}


