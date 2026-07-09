//
//  ReminderView.swift
//  Reminder
//
//  Created by Nithya Vasudevan on 03.06.26.
//

import SwiftUI


struct ReminderView : View {
    @State private var reminder : Reminder
    var shouldShowInfoButton : Bool = false
    @State private var reminderText : String = ""
    @State private var reminderSubText : String = ""
//    @FocusState.Binding  var focusedField : ReminderFocusedField? = nil
    
    init(reminder : Reminder){
        self.reminder = reminder
    }
    
    var body : some View {
        HStack (spacing : 10){
            //radio button
            Button{
                
            }label: {
                Image(systemName: "circle")
            }
            .foregroundStyle(.gray)
            .font(.system(size: 28))
            //text and subtext
            VStack (alignment : .leading){
                TextField(reminder.text, text: $reminderText)
                    .font(.headline)
                    .foregroundStyle(.primary)
                if let subtext = reminder.info {
                    TextField(subtext, text: $reminderSubText)
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                }
            }
            
            Spacer()
            
            HStack(spacing : 24) {
                Button{
                    
                } label : {
                    Image(systemName : "flag.fill")
                }
                .foregroundStyle(.orange)
                
                if shouldShowInfoButton {
                    Button{
                        
                    } label: {
                        Image(systemName: "info.circle")
                    }
                }
            }
            //flag
            //info icon
        }
    }
}



#Preview {
    ReminderView(reminder: Reminder(text: "rem 1", info: "Added by You"))
}
