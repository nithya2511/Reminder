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
    
    func tagsRowTapped() {
        
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
