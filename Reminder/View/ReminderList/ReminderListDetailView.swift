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
    
    let title : Title
    
    //    @StateObject private var viewModel: ReminderListDetailViewModel
    //    @FocusState private var focusedField : ReminderFocusedField?
    //
    //    init(title : Title) {
    //            self.title = title
    //
    //            _viewModel = StateObject(
    //                     wrappedValue: ReminderListDetailViewModel(
    //                         reminders: reminderListItem.reminders ?? []
    //                     )
    //                 )
    //    }
    var body: some View {
        
        ZStack {
            AppTheme.background
                .ignoresSafeArea()
            
            ScrollView{
                
                LazyVStack(alignment: .leading, spacing: 16) {
                    Text(title.title)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundStyle(title.iconColor)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    if let reminders = title.reminders {
                        ForEach(reminders) { reminder in
                            ReminderView(reminder : reminder)
                        }
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
                BottomBarView(onAdd: {
                    print("Add Button Tapped")
                })
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
