//
//  HomeViewModel.swift
//  Reminder
//
//  Created by Nithya Vasudevan on 24.05.26.
//

import SwiftUI
enum HomeSheet : Identifiable {
    case createList
    case editList(Title)
    case createReminder
    
    var id : String {
        switch self {
        case .createList : return "createList"
        case .editList(let title) : return "editList-\(title.id)"
        case .createReminder : return "createReminder"
        }
    }
}


class HomeViewModel : ObservableObject {
    @Published var searchText: String = ""
    @Published private(set) var titleNames : [Title] = []
    @Published var navigationPath = NavigationPath()
    @Published var activeSheet : HomeSheet?
    
    private var allReminders : [Reminder] {
        titleNames.flatMap { title in
            title.reminders ?? []
        }
    }
    
    var categories : [CardCategory] {
        ReminderCategory.allCases.map { category in
            CardCategory(
                category: category,
                reminderCount: count(for : category)
            )
        }
    }
    
    private func count(for category : ReminderCategory) -> Int {
        switch category {
        case .today  : return allReminders.filter { reminder in
            guard let date = reminder.date else { return false }
            return Calendar.current.isDateInToday(date)
        }.count
        case .scheduled : return allReminders.filter { reminder in
            reminder.date != nil || reminder.time != nil
        }.count
        
        case .flagged : return allReminders.filter { reminder in
            reminder.isUrgent
        }.count
            
        case .completed : return allReminders.filter { $0.isCompleted }.count
            
        case .all : return allReminders.count
        }
    }
    
    init() {
        loadTitleNames()
    }
    
    
    
    func createNewListButtonTapped() {
        activeSheet = .createList
    }
    

    
    
    func onAddButtonTapped() {
        activeSheet = .createReminder
    }
    

    //TODO: These categories are hardcoded - need to fix dynamic loading of values
//    func loadCategories() {
//        categories = [
//            CardCategory(
//                cardTitle: "Today",
//                iconName: "calendar",
//                iconColor: .blue,
//                reminderCount: 1
//            ),
//            CardCategory(
//                cardTitle: "Scheduled",
//                iconName: "calendar.badge.clock",
//                iconColor:.red,
//                reminderCount: 1
//            ),
//            CardCategory(
//                cardTitle: "Flagged",
//                iconName: "flag.fill",
//                iconColor:.orange,
//                reminderCount: 1
//            ),
//            CardCategory(
//                cardTitle: "Completed",
//                iconName: "checkmark.circle",
//                iconColor:.gray,
//                reminderCount: 1
//            ),
//            CardCategory(
//                cardTitle: "All",
//                iconName: "tray.full.fill",
//                iconColor:.black,
//                reminderCount: 1
//            )
//        ]
//    }
    
    func loadTitleNames() {
        titleNames  = [
            Title(
                title: "Pantry",
                iconColor: Color.red,
                iconName: "list.bullet",
                info: nil,
                reminders: [
                    Reminder(title: "Item1", notes: ""),
                    Reminder(title: "Item2", notes: ""),
                    Reminder(title: "Item3", notes: "")
                ]
            ),
            Title(
                title: "Reminder",
                iconColor: .blue,
                iconName: "list.bullet",
                info: nil,
                reminders: [
                    Reminder(title: "Item1", notes: ""),
                    Reminder(title: "Item2", notes: ""),
                    Reminder(title: "Item3", notes: "")
                ]
            ),
            Title(
                title: "Use immediatly",
                iconColor: .orange,
                iconName: "list.bullet",
                info: nil,
                reminders: [
                    Reminder(title: "Item1", notes: ""),
                    Reminder(title: "Item2", notes: ""),
                    Reminder(title: "Item3", notes: "")
                ]
            ),
            Title(
                title: "Shopping List",
                iconColor: .gray,
                iconName: "list.bullet",
                info: nil,
                reminders: [
                    Reminder(title: "Item1", notes: ""),
                    Reminder(title: "Item2", notes: ""),
                    Reminder(
                        title: "Item3",
                        notes: ""
                    ),
                    Reminder(title: "ItemLast", notes: "")
]
            ),
            Title(
                title: "Kaufland",
                iconColor: .black,
                iconName: "list.bullet",
                info: nil,
                reminders: [
                    Reminder(title: "Item1", notes: ""),
                    Reminder(title: "Item2", notes: ""),
                    Reminder(title: "Item3", notes: "")
                ]
            )
        ]
    }
    
    func addListAndOpen(named title : Title) {
        titleNames.append(title)
        activeSheet = nil
        navigationPath.append(title.id)
    }
    
    func title(for id: UUID) -> Title? {
        titleNames.first {$0.id == id }
    }
    
    func deleteList(id : UUID) {
        titleNames.removeAll{$0.id == id}
    }
    
    func infoTapped(id : UUID) {
        guard let title = title(for : id) else { return }
        activeSheet = .editList(title)
    }
    
    func updateList(_ updatedList : Title) {
        guard let index = titleNames.firstIndex(where: {$0.id == updatedList.id}) else { return }
        
        titleNames[index] = updatedList
        activeSheet = nil
    }
    
    func updateReminders(for titleID : UUID, reminders : [Reminder]) {
        guard let index = titleNames.firstIndex(where: {$0.id == titleID}) else {return}
        
        let oldTitle = titleNames[index]
        
        titleNames[index] = Title(
            id: oldTitle.id,
            title: oldTitle.title,
            iconColor: oldTitle.iconColor,
            iconName: oldTitle.iconName,
            info: oldTitle.info,
            reminders: reminders
        )
    }
    
    func addReminder(_ reminder : Reminder) {
        guard let index = titleNames.firstIndex(
            where: {$0.title == reminder.list
            }) else { return }
        
        let oldTitle = titleNames[index]
        var reminders = oldTitle.reminders ?? []
        reminders.append(reminder)
        
        titleNames[index] = Title(
            id: oldTitle.id,
            title: oldTitle.title,
            iconColor: oldTitle.iconColor,
            iconName: oldTitle.iconName,
            info: oldTitle.info,
            reminders: reminders
        )
        activeSheet = nil 
    }
}

