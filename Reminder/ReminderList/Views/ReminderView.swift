//
//  ReminderView.swift
//  Reminder
//
//  Created by Nithya Vasudevan on 03.06.26.
//

import SwiftUI

enum InfoPart {
    case text(String, Color)
    case symbol(String, Color)
}


struct ReminderView : View {
    @Binding var reminder : Reminder
    var shouldShowInfoButton : Bool = false
    @FocusState.Binding  var focusedField : ReminderFocusedField?
    let infoParts : [InfoPart]
    
    let onSubmitReminder : () -> Void
    
    
    private var shouldShowNoteTextField : Bool {
        !reminder.notes.isEmpty ||
        focusedField == .title(reminder.id) ||
        focusedField == .info(reminder.id)
    }
    
    var body : some View {
        HStack (alignment : .top, spacing : 10){
            
            Button{
                
            }label: {
                Image(systemName: "circle")
            }
            .foregroundStyle(.gray)
            .font(.system(size: 26))
            
            VStack (alignment : .leading){
                HStack {
                    Text("!!!")
                        .foregroundStyle(.orange)
                    TextField("New Reminder", text: $reminder.title)
                        .font(.headline)
                        .foregroundStyle(.primary)
                        .focused($focusedField, equals: .title(reminder.id))
                        .submitLabel(.return)
                        .onSubmit {
                            onSubmitReminder()
                        }
                    Spacer()
                    HStack (spacing: 20) {
                        Button{
                            
                        } label : {
                            Image(systemName : "flag.fill")
                        }
                        .foregroundStyle(.orange)
                        
                        //                    if shouldShowInfoButton {
                        Button{
                            
                        } label: {
                            Image(systemName: "info.circle")
                        }
                        .foregroundStyle(.orange)
                        //                    }
                    }
                }
                
                if shouldShowNoteTextField {
                    TextField("Add Note", text: $reminder.notes)
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                        .focused($focusedField, equals: .info(reminder.id))
                        .submitLabel(.return)
                        .onSubmit {
                            onSubmitReminder()
                        }
                }
                if !infoParts.isEmpty {
                    WrapLayout(spacing: 4, lineSpacing: 4) {
                        ForEach(Array(infoParts.enumerated()), id : \.offset) {
 _,
 part in
                            switch (part) {
                            case .text(let text, let color) : Text(text)
                                    .foregroundStyle(color)
                            case .symbol(let name, let color) : Image(
                                systemName: name).foregroundStyle(color)
                            }
                        }
                    }
                    .font(.caption)
                }
                        
            }
            
            Spacer()
            
            HStack(spacing : 24) {
               
            }
        }
    }
}


#Preview {
     @Previewable @State var reminder = Reminder(
         title: "rem 1",
         notes: "Added by You"
     )

     @Previewable @FocusState var focusedField: ReminderFocusedField?

     ReminderView(
         reminder: $reminder,
         focusedField: $focusedField, infoParts: [], onSubmitReminder: {}
     )
 }

