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
}
