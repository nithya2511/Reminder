//
//  CardModel.swift
//  Reminder
//
//  Created by Nithya Vasudevan on 25.05.26.
//
import SwiftUI

enum ReminderCategory : String, Identifiable, CaseIterable {
    case today = "Today"
    case scheduled = "Scheduled"
    case flagged = "Flagged"
    case completed = "Completed"
    case all = "All"
    
    var id : Self { self }
    
    var iconName : String {
        switch self {
        case .today : return "calendar"
        case .scheduled : return "calendar.badge.clock"
        case .flagged : return "flag.fill"
        case .completed: return "checkmark.circle"
        case .all: return "tray.full.fill"
        }
    }
    
    var iconColor : Color {
        switch self {
        case .today: return .blue
        case .scheduled: return .red
        case .flagged: return .orange
        case .completed: return .gray
        case .all: return .black
        }

    }
}

struct CardCategory : Identifiable {
    let category : ReminderCategory
    let reminderCount : Int
    
    var id : ReminderCategory {category}

    var cardTitle : String {
        category.rawValue
    }
    var iconName : String {
        category.iconName
    }
    var iconColor : Color {
        category.iconColor
    }
}
