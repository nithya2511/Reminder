//
//  Reminder.swift
//  Reminder
//
//  Created by Nithya Vasudevan on 31.07.26.
//
import SwiftUI

struct Reminder : Identifiable, Codable {
    let id : UUID
    var title : String
    var notes : String
    var url : String
    var date : Date?
    var time : Date?
    var repeatOption : RepeatOption
    var isUrgent : Bool
    var listID : UUID?
    var details : String?
    var isCompleted : Bool
    var tags : [String]?
    
    init(
        id : UUID = UUID(),
        title: String,
        notes: String = "",
        url: String = "" ,
        date: Date? = nil,
        time: Date? = nil,
        repeatOption : RepeatOption = .never,
        isUrgent: Bool = false,
        listID: UUID? = nil,
        details: String = "",
        isCompleted : Bool = false,
        tags : [String]? = nil
    ) {
        self.id = id
        self.title = title
        self.notes = notes
        self.url = url
        self.date = date
        self.time = time
        self.repeatOption = repeatOption
        self.isUrgent = isUrgent
        self.listID = listID
        self.isCompleted = isCompleted
        self.details = details
        self.tags = tags
    }
}
