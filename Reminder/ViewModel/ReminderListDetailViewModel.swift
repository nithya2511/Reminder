//
//  ReminderListDetailViewModel.swift
//  Reminder
//
//  Created by Nithya Vasudevan on 11.06.26.
//

import SwiftUI

class ReminderListDetailViewModel: ObservableObject {
    @Published var reminders : [Reminder]
    
    init(reminders: [Reminder]) {
        self.reminders = reminders
    }
}
