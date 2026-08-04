//
//  ReminderView.swift
//  Reminder
//
//  Created by Nithya Vasudevan on 03.06.26.
//

import SwiftUI

struct InfoPart {
    let text : String
    let color : Color 
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
                    Text(buildInfoText(from: infoParts))
                        .font(.caption)
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                }
                        
            }
            
            Spacer()
            
            HStack(spacing : 24) {
               
            }
            //flag
            //info icon
        }
    }
    
    private func buildInfoText(from parts : [InfoPart]) -> AttributedString {
        var result = AttributedString()
        for part in parts {
            var attributedPart = AttributedString(part.text)
            attributedPart.foregroundColor = part.color
            result.append(attributedPart)
        }
        return result
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
