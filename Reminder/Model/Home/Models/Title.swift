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

struct Reminder : Identifiable {
    let id : UUID
    var title : String
    var notes : String
    var url : String
    var date : Date?
    var time : Date?
    var repeatOption : RepeatOption
    var isUrgent : Bool
    var list : String
    var details : String?
    
    init(
        id : UUID = UUID(),
        title: String,
        notes: String = "",
        url: String = "" ,
        date: Date? = nil,
        time: Date? = nil,
        repeatOption : RepeatOption = .never,
        isUrgent: Bool = false,
        list: String = "",
        details: String = ""
    ) {
        self.id = id
        self.title = title
        self.notes = notes
        self.url = url
        self.date = date
        self.time = time
        self.repeatOption = repeatOption
        self.isUrgent = isUrgent
        self.list = list
        
        self.details = details
    }
    
}
