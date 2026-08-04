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
        self.reminders = title.reminders ?? []
    }
    
    func addNewReminder() -> UUID {
        let reminder = Reminder(title : "", notes: "")
        reminders.append(reminder)
        return reminder.id
    }
    
    func infoParts(for reminder : Reminder) -> [InfoPart] {
        var parts : [InfoPart] = []
        
        if let date = reminder.date {
            parts.append(
                    InfoPart(
                        text: date
                            .formatted(date: .abbreviated, time: .omitted),
                        color: .red
                    )
                )
            
            if let time = reminder.time {
                parts.append(
                    InfoPart(
                        text: time.formatted(date: .omitted, time: .shortened),
                        color: .red
                    )
                )
            }
            
            if reminder.repeatOption != .never {
                parts.append(InfoPart(text: "􀊞", color: .red))
                parts
                    .append(
                        InfoPart(
                            text: reminder.repeatOption.rawValue,
                            color: .red
                        )
                    )
            }
            
            if reminder.isUrgent {
                parts.append(InfoPart(text: "􀐭", color: .gray))
            }
            
           
        }
        
        return parts
    }
}
