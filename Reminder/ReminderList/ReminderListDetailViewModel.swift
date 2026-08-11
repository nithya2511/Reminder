//
//  ReminderListDetailViewModel.swift
//  Reminder
//
//  Created by Nithya Vasudevan on 11.06.26.
//

import SwiftUI

class ReminderListDetailViewModel: ObservableObject {
    var title : Title
    @Published var reminders : [Reminder]
    
    
    init(title : Title) {
        self.title = title
        self.reminders = title.reminders 
    }
    
    func addNewReminder() -> UUID {
        let reminder = Reminder(title : "", notes: "")
        reminders.append(reminder)
        return reminder.id
    }
    
    func infoParts(for reminder : Reminder) -> [InfoPart] {
        var parts : [InfoPart] = []
        
        if let date = reminder.date {
            parts.append(.text(date
                .formatted(date: .abbreviated, time: .omitted), .red))
                
            
            if let time = reminder.time {
                parts.append(.text( time.formatted(date: .omitted, time: .shortened), .red))
            }
            
            if reminder.repeatOption != .never {
                parts.append(.symbol("repeat", .red))
                parts.append(.text(reminder.repeatOption.rawValue, .red))
            }
            
            if reminder.isUrgent {
                parts.append(.symbol("alarm", .red))
            }
            
            if let tags = reminder.tags {
                  for tag in tags {
                      parts.append(.text("#\(tag)", .blue))
                  }
              }
            
           
        }
        
        return parts
    }
}
