//
//  ReminderStore.swift
//  Reminder
//
//  Created by Nithya Vasudevan on 05.08.26.
//

import Foundation

final class ReminderStore {
    private let fileName = "reminder_lists.json"
    
    private var fileURL : URL {
        FileManager.default
            .urls(for: .documentDirectory, in: .userDomainMask)[0]
            .appendingPathComponent(fileName)
    }
    
    func loadLists() -> [Title] {
        do {
            let data = try Data(contentsOf: fileURL)
            return try JSONDecoder().decode([Title].self, from: data)
        } catch {
            return []
        }
    }
    
    func saveLists(_ lists : [Title]) {
        do {
            let data = try JSONEncoder().encode(lists)
            try data.write(to: fileURL)
        } catch {
            print("Failed to save lists", error)
        }
    }
}
