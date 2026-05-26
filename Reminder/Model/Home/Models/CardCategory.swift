//
//  CardModel.swift
//  Reminder
//
//  Created by Nithya Vasudevan on 25.05.26.
//
import SwiftUI

struct CardCategory : Identifiable {
    let id = UUID()
    var cardTitle : String
    var iconName : String
    var iconColor : Color
    var reminderCount : Int
}
