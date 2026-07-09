//
//  CreateNewReminderViewModel.swift
//  Reminder
//
//  Created by Nithya Vasudevan on 16.06.26.
//

import SwiftUI

enum RepeatOption : String, CaseIterable, Identifiable {
    case never = "Never"
    case daily = "Daily"
    case weekly = "Weekly"
    case monthly = "Monthly"
    case yearly = "Yearly"
    
    var id : Self {self}
}

class CreateNewReminderViewModel: ObservableObject {
    
    let reminderListTitles : [Title]
    
    @Published var title = ""
    @Published var notes = ""
    @Published var url = ""
    
    @Published var isDateEnabled = false
    @Published var selectedDate = Date()
    @Published var shouldShowDatePicker = false
    var selectedDateString : String {
        guard isDateEnabled else {return ""}
        
        return selectedDate.formatted(date: .abbreviated, time: .omitted)
    }
    
    @Published var isTimeEnabled = false
    @Published var selectedTime = Date()
    @Published var shouldShowTimePicker = false
    var selectedTimeString : String {
        guard isTimeEnabled else {return ""}
        return selectedTime.formatted(date: .omitted, time:.shortened)
    }
    @Published var isShowingTimeZoneSheet = false
    
    @Published var isUrgent = false
    var urgentInfoSTring : String {
        guard isUrgent else { return ""}
        return "Alarm on : Nithya's iPhone"
    }
    var urgentFooterText : String {
        if !isUrgent {
            return "Mark this reminder as urgent to set an alarm"
        } else {
            return "Alarms will activate even when a Focus is on or your device is muted. Learn more how to change where alarms activate."
        }
    }
    
    @Published var repeatOption : RepeatOption = .never
    
    @Published var selectedListName : String = ""
    
    @Published var isShowingDetailInfoSheet = false
    
    init(titles : [Title]) {
        self.reminderListTitles = titles
        self.selectedListName = titles.first?.title ?? ""
    }
    
    
    func dateRowTapped() {
        guard isDateEnabled else {return}
        
        shouldShowDatePicker.toggle()
        
        if shouldShowDatePicker {
            shouldShowTimePicker = false
        }
    }
    
    func dateSelected(_ date : Date) {
        selectedDate = date
    }
    
    func dateToggleChanged(_ isOn : Bool) {
        isDateEnabled = isOn
        shouldShowDatePicker = isOn
        if(isOn){
            shouldShowTimePicker = false
        }
    }
    
    func timeRowTapped() {
        shouldShowTimePicker.toggle()
        shouldShowDatePicker = false
    }
    
    func timeSelected(_ time : Date) {
        selectedTime = time
        isTimeEnabled = true
    }
    
    func timeToggleChanged(_ isOn : Bool) {
        isTimeEnabled = isOn
        shouldShowTimePicker = isOn
        if isOn {
            shouldShowDatePicker = false
        }
    }
    
    func timeZoneRowTapped() {
        isShowingTimeZoneSheet = true
    }
    
    func closeTimeZoneSheet() {
        isShowingTimeZoneSheet = false
    }
    
    func urgentRowTapped() {
        isUrgent.toggle()
    }
    
    func urgentToggleChanged(_ isOn : Bool) {
        isUrgent = isOn
    }
    
    func repeatRowTapped() {
        
    }
    
    func listRowTapped() {
        
    }
    
    func detailInfoRowTapped() {
        isShowingDetailInfoSheet = true
    }
    
    func closeDetailInfoSheet() {
        isShowingDetailInfoSheet = false
    }
   
    

    
    

}
