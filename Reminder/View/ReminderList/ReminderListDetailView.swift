//
//  ReminderListDetailView.swift
//  Reminder
//
//  Created by Nithya Vasudevan on 26.05.26.
//

import SwiftUI
enum ReminderFocusedField: Hashable {
    case title(UUID)
    case info(UUID)
}

struct ReminderListDetailView: View {
    @StateObject private var viewModel : ReminderListDetailViewModel
    @FocusState private var focusedField : ReminderFocusedField?
    
    init(title : Title) {
        _viewModel = StateObject(
            wrappedValue: ReminderListDetailViewModel(title: title)
        )
    }
    
    var body: some View {
        
        ZStack {
            AppTheme.background
                .ignoresSafeArea()
            
            ScrollView{
                
                LazyVStack(alignment: .leading, spacing: 16) {
                    Text(viewModel.title.title)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundStyle(viewModel.title.iconColor)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ForEach($viewModel.reminders) { $reminder in
                        ReminderView(
                            reminder: $reminder,
                            focusedField: $focusedField
                        )
                    }
                }
                .toolbar {
                    if #available(iOS 26.0, *) {
                        keyboardToolBar
                        .sharedBackgroundVisibility(.hidden)
                    } else {
                        // Fallback on earlier versions
                        keyboardToolBar
                    }
                    
                }
                .padding()
            }
            .overlay(alignment : .bottomTrailing) {
                BottomBarView{
                    let newReminderID = viewModel.addNewReminder()
                    
                    DispatchQueue.main.async {
                        focusedField = .title(newReminderID)
                    }
                }
                    .padding(.trailing, 20)
                    .padding(.bottom, 20)
                
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItemGroup (placement : .topBarTrailing) {
                Button {
                    
                } label: {
                    Image(systemName: "person.crop.circle.badge.checkmark")
                }
                Button {
                } label: {
                    Image(systemName: "square.and.arrow.up")
                }
                
                Button {
                } label: {
                    Image(systemName: "ellipsis")
                }
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button{
                    
                }label: {
                    Image(systemName: "checkm")
                }
            }
        }
        
        
    }
}

@ToolbarContentBuilder
var keyboardToolBar: some ToolbarContent {
    ToolbarItemGroup (placement : .keyboard){
        Button {
        } label: {
            Image(systemName: "calendar")
        }
        
        Button {
        } label: {
            Image(systemName: "flag")
        }
        
        Button {
        } label: {
            Image(systemName: "info.circle")
        }
        
        Spacer()
        
        Button("Done") {
            // hide keyboard
        }
    }
}
struct ItemRowView : View {
    var body: some View {
        Text("Hellow world")
    }
}


#Preview {
    NavigationStack {
        TitleItemView(
            titleItem: Title(
                title: "Pantry",
                iconColor: .red,
                iconName: "list.bullet",
                info: "Created by Sid",
                count: 5,
                reminders: nil
            )
        )
    }
}
