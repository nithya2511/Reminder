//
//  DetailInfoSheetView.swift
//  Reminder
//
//  Created by Nithya Vasudevan on 01.07.26.
//

import SwiftUI

struct DetailInfoSheetView: View {
    @StateObject private var viewModel = DetailInfoViewModel()
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        NavigationStack {
            VStack{
                OrganisationSection(viewModel: viewModel)
                PlacesPeopleSection(viewModel: viewModel)
                ImageSection(viewModel : viewModel)
                Spacer()
                
            }
            .navigationTitle("Details")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .topBarTrailing) {
                    Button{
                        
                    } label: {
                        Image(systemName: "checkmark")
                    }
                    .disabled(!viewModel.hasUnsavedChanges)
                }
            }
        }
    }
}

struct OrganisationSection : View {
    @ObservedObject var viewModel : DetailInfoViewModel
    var body : some View {
        VStack(alignment: .leading){
            Text("Organization")
                .font(.title2)
                .foregroundStyle(.gray)
                .fontWeight(.medium)
            
            RowView(
                iconName: "number",
                iconForegroundColor: .gray,
                rowTitle: "Tags",
                subtitle: "",
                onTap: {viewModel.tagsRowTapped()}) {
                    Button{
                        viewModel.tagsRowTapped()
                    } label: {
                        Image(systemName: "chevron.right")
                    }
                    .foregroundStyle(.gray)
                }
                .sheet(isPresented: $viewModel.isShowingTagsSheet) {
                    TagSheetView(
                        tagText : $viewModel.tagText,
                        tags : $viewModel.tags,
                        selectedTags : $viewModel.selectedTags,
                        onAddTag: viewModel.addTag,
                        onToggleTag : viewModel.toggleTagSelection
                    )
                }
                .padding()
                .background {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.bar)
                }
            
            VStack{
                RowView(
                    iconName: "flag",
                    iconForegroundColor: .gray,
                    rowTitle: "Flag",
                    subtitle: "",
                    onTap: {viewModel.flagRowTapped()}) {
                        Toggle("", isOn: $viewModel.isFlagged)
                    }
                
                Divider()
                
                RowView(
                    iconName: "exclamationmark.3",
                    iconForegroundColor: .gray,
                    rowTitle: "Priority",
                    subtitle: "",
                    onTap: {viewModel.priorityRowTapped()}) {
                        Picker("", selection: $viewModel.priority) {
                            ForEach(PriorityRank.allCases) {
                                rank in
                                Text(rank.rawValue)
                                    .tag(rank)
                            }
                        }
                    }
            }
            .padding()
            .background{
                RoundedRectangle(cornerRadius: 20)
                    .fill(.bar)
            }
        }
        .padding()
        
    }
}

struct PlacesPeopleSection : View {
    @ObservedObject var viewModel : DetailInfoViewModel
    var body : some View {
        VStack(alignment : .leading) {
            Text( "Places & People")
                .font(.title)
                .foregroundStyle(.gray)
                .fontWeight(.medium)
            
            RowView(
                iconName: "location",
                iconForegroundColor: .gray,
                rowTitle: "Location",
                subtitle: "",
                onTap: {viewModel.locationRowTapped()}) {
                    Toggle("", isOn: $viewModel.isLocationEnabled)
                }
                .padding()
                .background{
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.bar)
                }
            
            RowView(
                iconName: "message",
                iconForegroundColor: .gray,
                rowTitle: "When Messaging",
                subtitle: "",
                onTap: {viewModel.whenMessagingRowTapped()}) {
                        Toggle("", isOn: $viewModel.isWhenMessagingEnabled)
                        .labelsHidden()
                }
                .padding()
                .background{
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.bar)
                }
            
            Text("Selecting this option will show the reminder notification when chatting with a person in Messages.")
                .foregroundStyle(.gray)
                .font(.footnote)
        }
        .padding()
    }
}

struct ImageSection : View {
    @ObservedObject var viewModel : DetailInfoViewModel
    var body : some View {
        VStack{
            RowView(
                iconName: "photo",
                iconForegroundColor: .gray,
                rowTitle: "Add Image",
                subtitle: "",
                onTap: {viewModel.addImageRowTapped()}) {
                    EmptyView()
                }
                .padding()
                .background{
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.bar)
                }
        }
        .padding()
    }
}

#Preview {
    DetailInfoSheetView()
}

