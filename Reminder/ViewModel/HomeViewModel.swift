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
    @Published private(set) var categories : [CardCategory] = []
    @Published private(set) var titleNames : [Title] = []
    @Published var navigationPath = NavigationPath()
    @Published var activeSheet : HomeSheet?
    
    init() {
        loadCategories()
        loadTitleNames()
    }
    
    func createNewListButtonTapped() {
        activeSheet = .createList
    }
    
//    func closeCreateNewListSheet() {
//        self.isShowingCreateNewListSheet = false
//    }
    
    
    func onAddButtonTapped() {
        activeSheet = .createReminder
    }
    
//    func closeCreateNewReminderSheet() {
//        self.isShowingCreateNewReminderSheet = false
//    }
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
    
    func loadTitleNames() {
        titleNames  = [
            Title(
                title: "Pantry",
                iconColor: Color.red,
                iconName: "list.bullet",
                info: nil,
                reminders: [
                    Reminder(text: "Item1", info: ""),
                    Reminder(text: "Item2", info: ""),
                    Reminder(text: "Item3", info: "")
                ]
            ),
            Title(
                title: "Reminder",
                iconColor: .blue,
                iconName: "list.bullet",
                info: nil,
                reminders: [Reminder(text: "Item1", info: ""), Reminder(text: "Item2", info: ""), Reminder(text: "Item3", info: "")]
            ),
            Title(
                title: "Use immediatly",
                iconColor: .orange,
                iconName: "list.bullet",
                info: nil,
                reminders: [Reminder(text: "Item1", info: ""), Reminder(text: "Item2", info: ""), Reminder(text: "Item3", info: "")]
            ),
            Title(
                title: "Shopping List",
                iconColor: .gray,
                iconName: "list.bullet",
                info: nil,
                reminders: [Reminder(text: "Item1", info: ""), Reminder(text: "Item2", info: ""), Reminder(text: "Item3", info: ""),
                    Reminder(text: "ItemLast", info: "")]
            ),
            Title(
                title: "Kaufland",
                iconColor: .black,
                iconName: "list.bullet",
                info: nil,
                reminders: [Reminder(text: "Item1", info: ""), Reminder(text: "Item2", info: ""), Reminder(text: "Item3", info: "")]
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
            info: oldTitle.info,
            reminders: reminders
        )
    }
    
    func filterTodayReminders() {
        let x = ForEach(titleNames){title in
            let todayReminders = title.reminders?.filter{ reminder in
                reminder.info != ""
                
            }
            
        }
    }
}

