//
//  ReminderListItem.swift
//  Reminder
//
//  Created by Nithya Vasudevan on 26.05.26.
//

import SwiftUI


struct ReminderCategoryListItem : Identifiable {
    let id = UUID()
    let title: String
    let iconColor : Color
    let iconName : String
    let info : String?
    let count : Int
    let reminders : [Reminder]?
}

struct Reminder : Identifiable {
    let id = UUID()
    let text : String
    let info : String?
}
