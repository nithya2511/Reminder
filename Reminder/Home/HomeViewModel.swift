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
    private let store = ReminderStore()
    @Published var searchText: String = ""
    @Published private(set) var titleNames : [Title] = []
    @Published var navigationPath = NavigationPath()
    @Published var activeSheet : HomeSheet?
    
    private var allReminders : [Reminder] {
        titleNames.flatMap { title in
            title.reminders
        }
    }
    
    init() {
        let savedLists = store.loadLists()
        
        if savedLists.isEmpty {
            titleNames = [
                Title(
                    title: "Reminders", iconColor: .blue, info: nil
                )
            ]
            
            store.saveLists(titleNames)
        } else {
            titleNames = savedLists
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
            
        case .pinned : return 0
        }
    }
    
    var categories : [CardCategory]  {
        var cards = ReminderCategory.allCases
            .filter {$0 != .pinned}
            .map { category in
                CardCategory(
                    category: category,
                    reminderCount: count(for: category)
                )
            }
        
        let pinnedCards = titleNames
            .filter{ $0.isPinned }
            .map{ title in
                CardCategory(
                    category: .pinned,
                    reminderCount: title.count,customPinnedTitle: title.title
                )
            }
        
        cards.append(contentsOf : pinnedCards)
        
        return cards
    }

    
    
    
    func createNewListButtonTapped() {
        activeSheet = .createList
    }
    

    
    
    func onAddButtonTapped() {
        activeSheet = .createReminder
    }
    
    func addListAndOpen(named title : Title) {
        titleNames.append(title)
        store.saveLists(titleNames)
        
        activeSheet = nil
        navigationPath.append(title.id)
    }
    
    func title(for id: UUID) -> Title? {
        titleNames.first {$0.id == id }
    }
    
    func deleteList(id : UUID) {
        titleNames.removeAll{$0.id == id}
        store.saveLists(titleNames)
    }
    
    func infoTapped(id : UUID) {
        guard let title = title(for : id) else { return }
        activeSheet = .editList(title)
    }
    
    func pinList(id : UUID) {
        guard let index = titleNames.firstIndex(where: {$0.id == id }) else { return }
        let oldTitle = titleNames[index]
        titleNames[index] = Title(
            id : oldTitle.id,
            title: oldTitle.title,
            iconColor: oldTitle.iconColor,
            iconName: oldTitle.iconName,
            info: oldTitle.info,
            reminders: oldTitle.reminders,
            isPinned: !oldTitle.isPinned
        )
    }
    
    func updateList(_ updatedList : Title) {
        guard let index = titleNames.firstIndex(where: {$0.id == updatedList.id}) else { return }
        
        titleNames[index] = updatedList
        store.saveLists(titleNames)
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
        guard let listID = reminder.listID,
        let index = titleNames.firstIndex(where: { $0.id == listID }) else {
           return
       }

       titleNames[index].reminders.append(reminder)
       store.saveLists(titleNames)

       activeSheet = nil
    }
}

