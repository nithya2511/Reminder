//
//  DetailInfoViewModel.swift
//  Reminder
//
//  Created by Nithya Vasudevan on 02.07.26.
//
import SwiftUI

enum PriorityRank : String, CaseIterable, Identifiable {
    case none = "None"
    case low = "Low"
    case medium = "Medium"
    case high = "High"
    
    var id : Self {self}
}

class DetailInfoViewModel : ObservableObject {
    
    @Published var isFlagged = false
    @Published var priority : PriorityRank = .none
    @Published var isLocationEnabled = false
    @Published var isWhenMessagingEnabled = false
    var imageNames : [String] = []
    @Published var tags : [String] = []
    @Published var tagText : String = ""
    @Published var isShowingTagsSheet = false
    @Published var selectedTags : Set<String> = []
    
    var hasUnsavedChanges : Bool {
        isFlagged || priority != .none || isLocationEnabled || isWhenMessagingEnabled || !tags.isEmpty || !imageNames.isEmpty
    }
    
    func tagsRowTapped() {
        isShowingTagsSheet = true
    }
    
    func addTag() {
        let trimmedTag = tagText.trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard !trimmedTag.isEmpty else {
            return
        }
        tags.append(trimmedTag)
        selectedTags.insert(trimmedTag)
        tagText = ""
    }
    
    func toggleTagSelection(_ tag : String) {
        if selectedTags.contains(tag) {
            selectedTags.remove(tag)
        } else {
            selectedTags.insert(tag)
        }
    }
    
    func flagRowTapped() {
        
    }
    
    func priorityRowTapped() {
        
    }
    
    func locationRowTapped() {
        
    }
    
    func whenMessagingRowTapped() {
        
    }
    
    func addImageRowTapped() {
        
    }
}
