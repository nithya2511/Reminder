//
//  HomeViewModel.swift
//  Reminder
//
//  Created by Nithya Vasudevan on 24.05.26.
//

import SwiftUI

class HomeViewModel : ObservableObject {
    @Published var searchText: String = ""
    @Published private(set) var categories : [CardCategory] = []
    @Published private(set) var reminderCategoryList : [ReminderCategoryListItem] = []
    
    init() {
        loadCategories()
        loadReminderCategoryList()
    }
    
    //TODO: These categories are hardcoded - need to fix dynamic loading of values 
    func loadCategories() {
        categories = [
            CardCategory(
                cardTitle: "Today",
                iconName: "calendar",
                iconColor: .blue,
                reminderCount: 1
            ),
            CardCategory(
                cardTitle: "Scheduled",
                iconName: "calendar.badge.clock",
                iconColor:.red,
                reminderCount: 1
            ),
            CardCategory(
                cardTitle: "Flagged",
                iconName: "flag.fill",
                iconColor:.orange,
                reminderCount: 1
            ),
            CardCategory(
                cardTitle: "Completed",
                iconName: "checkmark.circle",
                iconColor:.gray,
                reminderCount: 1
            ),
            CardCategory(
                cardTitle: "All",
                iconName: "tray.full.fill",
                iconColor:.black,
                reminderCount: 1
            )
        ]
    }
    
    func loadReminderCategoryList() {
        reminderCategoryList = [
            ReminderCategoryListItem(
                title: "Pantry",
                iconColor: .red,
                iconName: "list",
                info: nil,
                count: 3,
                reminders: [
                    Reminder(text: "Item1", info: nil),
                    Reminder(text: "Item2", info: nil),
                    Reminder(text: "Item3", info: nil)
                ]
            ),
            ReminderCategoryListItem(
                title: "Reminder",
                iconColor: .blue,
                iconName: "list",
                info: nil,
                count: 3,
                reminders: [Reminder(text: "Item1", info: nil), Reminder(text: "Item2", info: nil), Reminder(text: "Item3", info: nil)]
            ),
            ReminderCategoryListItem(
                title: "Use immediatly",
                iconColor: .orange,
                iconName: "list",
                info: nil,
                count: 3,
                reminders: [Reminder(text: "Item1", info: nil), Reminder(text: "Item2", info: nil), Reminder(text: "Item3", info: nil)]
            ),
            ReminderCategoryListItem(
                title: "Shopping List",
                iconColor: .gray,
                iconName: "list",
                info: nil,
                count: 3,
                reminders: [Reminder(text: "Item1", info: nil), Reminder(text: "Item2", info: nil), Reminder(text: "Item3", info: nil),
                    Reminder(text: "ItemLast", info: nil)]
            ),
            ReminderCategoryListItem(
                title: "Kauflans",
                iconColor: .black,
                iconName: "list",
                info: nil,
                count: 3,
                reminders: [Reminder(text: "Item1", info: nil), Reminder(text: "Item2", info: nil), Reminder(text: "Item3", info: nil)]
            )
        ]
    }
}

