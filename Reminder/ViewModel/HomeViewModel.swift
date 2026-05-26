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
    
    init() {
        loadCategories()
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
}

