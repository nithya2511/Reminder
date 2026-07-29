//
//  CreateNewListViewModel.swift
//  Reminder
//
//  Created by Nithya Vasudevan on 02.07.26.
//
import SwiftUI

enum NewListSection : String, CaseIterable, Identifiable {
    case newList = "New List"
    case templates = "Templates"
    
    var id : Self {self}
}

enum ListType : String, CaseIterable, Identifiable {
    case standard = "Standard"
    case shopping = " Shopping"
    case smart = "smart"
    
    var id : Self {self}
}

enum ListColor : String, CaseIterable, Identifiable {
    case red
    case yellow
    case green
    case pink
    case orange
    case black
    case gray
    case teal
    case purple
    case brown
    case blue
    case indigo
    
    var id : Self {self}
    
    var color : Color {
        switch self {
        case .red : .red
        case .yellow : .yellow
        case .green : .green
        case .pink : .pink
        case .orange : .orange
        case .black : .black
        case .gray : .gray
        case .teal : .teal
        case .purple : .purple
        case .brown : .brown
        case .blue : .blue
        case .indigo : .indigo
        }
    }
}

extension ListColor {
    static func from(color: Color) -> ListColor {
        switch color {
        case .red: return .red
        case .yellow: return .yellow
        case .green: return .green
        case .pink: return .pink
        case .orange: return .orange
        case .black: return .black
        case .gray: return .gray
        case .teal: return .teal
        case .purple: return .purple
        case .brown: return .brown
        case .blue: return .blue
        case .indigo: return .indigo
        default: return .blue
        }
    }
}

enum ListIcon : String, CaseIterable, Identifiable {
    case list = "list.bullet"
    case checklist = "checklist"
    case numberedList = "list.number"
    case shopping = "cart"
    case shoppingBag = "bag"
    case home = "house"
    case work = "briefcase"
    case gift = "gift"
    case reading = "book"
    case education = "graduationcap"
    case food = "fork.knife"
    case coffee = "cup.and.saucer"
    case groceries = "basket"
    case travel = "airplane"
    case car = "car"
    case bicycle = "bicycle"
    case walking = "figure.walk"
    case running = "figure.run"
    case fitness = "dumbbell"
    case health = "heart"
    case medication = "pills"
    case appointment = "calendar"
    case weather = "cloud.sun"
    case music = "music.note"
    case movies = "film"
    case games = "gamecontroller"
    case photography = "camera"
    case ideas = "lightbulb"
    case tools = "hammer"
    case documents = "doc"
    case messages = "message"
    case favorite = "star"
    
    var id : Self {self}
}

class CreateNewListViewModel : ObservableObject {
    
    @Published var selectedSection : NewListSection = .newList
    @Published var listName : String = ""
    @Published var selectedListType : ListType = .standard
    @Published var selectedColor : ListColor = .blue
    @Published var selectedIcon : ListIcon = .list
    private let existingID : UUID?
    
    init(title : Title? = nil) {
        self.existingID = title?.id
        if let title {
            self.listName = title.title
            self.selectedIcon = ListIcon(rawValue: title.iconName) ?? .list
            self.selectedColor = ListColor.from(color: title.iconColor)
        }
    }
    
    func listTypeRowTapped() {
        
    }
    
    var canSave : Bool {
       !listName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    
    func makeList() -> Title? {
        let trimmedName = listName.trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard !trimmedName.isEmpty else { return nil }
        
        return Title(
            id: existingID ?? UUID(),
            title: trimmedName,
            iconColor: selectedColor.color,
            iconName: selectedIcon.rawValue,
            info: nil,
            reminders: []
        )
    }
    
}
