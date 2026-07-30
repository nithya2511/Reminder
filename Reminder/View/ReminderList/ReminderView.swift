//
//  ReminderView.swift
//  Reminder
//
//  Created by Nithya Vasudevan on 03.06.26.
//

import SwiftUI


struct ReminderView : View {
    @Binding var reminder : Reminder
    var shouldShowInfoButton : Bool = false
    @FocusState.Binding  var focusedField : ReminderFocusedField?
    
    let onSubmitReminder : () -> Void
    
    
    private var shouldShowNoteTextField : Bool {
        !reminder.notes.isEmpty ||
        focusedField == .title(reminder.id) ||
        focusedField == .info(reminder.id)
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
                TextField("New Reminder", text: $reminder.title)
                    .font(.headline)
                    .foregroundStyle(.primary)
                    .focused($focusedField, equals: .title(reminder.id))
                    .submitLabel(.return)
                    .onSubmit {
                        onSubmitReminder()
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
     @Previewable @State var reminder = Reminder(
         title: "rem 1",
         notes: "Added by You"
     )

     @Previewable @FocusState var focusedField: ReminderFocusedField?

     ReminderView(
         reminder: $reminder,
         focusedField: $focusedField, onSubmitReminder: {}
     )
 }
