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
    
    
    private var shouldShowNoteTextField : Bool {
        !reminder.info.isEmpty ||
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
                TextField("New Reminder", text: $reminder.text)
                    .font(.headline)
                    .foregroundStyle(.primary)
                    .focused($focusedField, equals: .title(reminder.id))
                if shouldShowNoteTextField {
                    TextField("Add Note", text: $reminder.info)
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                        .focused($focusedField, equals: .info(reminder.id))
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
         text: "rem 1",
         info: "Added by You"
     )

     @Previewable @FocusState var focusedField: ReminderFocusedField?

     ReminderView(
         reminder: $reminder,
         focusedField: $focusedField
     )
 }
