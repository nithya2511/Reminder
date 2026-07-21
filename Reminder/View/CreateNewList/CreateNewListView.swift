//
//  CreateNewListView.swift
//  Reminder
//
//  Created by Nithya Vasudevan on 02.07.26.
//

import SwiftUI

struct CreateNewListView: View {
    @StateObject private var viewModel = CreateNewListViewModel()
    @Environment(\.dismiss) private var dismiss
    
    @FocusState private var isListNameFocused : Bool
    
    let onSave : (Title) -> Void
    
    init(onSave : @escaping (Title) -> Void) {
        self.onSave = onSave
    }
    
    var body: some View {
        NavigationStack{
                VStack{
                    Picker("", selection: $viewModel.selectedSection) {
                        ForEach(NewListSection.allCases){ section in
                            Text(section.rawValue).tag(section)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    switch viewModel.selectedSection {
                    case .newList:
                        NewListView(
                            viewModel: viewModel,
                            isListNameFocused : $isListNameFocused
                        )
                    case .templates:
                        TemplatesView()
                    }
                    Spacer()
                }
            .padding()
            .appBackground()
            .navigationTitle("New List")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear{
                DispatchQueue.main.async {
                    isListNameFocused = true
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button{
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button{
                        guard let list = viewModel.makeList() else {
                            return
                        }
                        onSave(list)
                        dismiss()
                    } label: {
                        Image(systemName: "checkmark")
                    }
                    .disabled(!viewModel.canSave)
                }
            }
        }
    }
}



#Preview {
    CreateNewListView{ list in
        print(list.title)
    }
}
