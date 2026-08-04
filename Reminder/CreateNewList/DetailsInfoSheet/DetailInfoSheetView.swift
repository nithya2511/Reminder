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
                }
            }
        }
    }
}

struct OrganisationSection : View {
    @ObservedObject var viewModel : DetailInfoViewModel
    var body : some View {
        VStack(alignment: .leading){
            Text("Organisation")
                .font(.title)
                .foregroundStyle(.gray)
                .fontWeight(.medium)
            
            RowView(
                iconName: "number",
                rowTitle: "Tags",
                subtitle: "",
                onTap: {viewModel.tagsRowTapped()}) {
                    Button{
                        
                    } label: {
                        Image(systemName: "chevron.right")
                    }
                    .foregroundStyle(.gray)
                }
                .padding()
                .background {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.bar)
                }
            
            VStack{
                RowView(
                    iconName: "Flag",
                    rowTitle: "Flag",
                    subtitle: "",
                    onTap: {viewModel.flagRowTapped()}) {
                        Toggle("", isOn: $viewModel.isFlagged)
                    }
                
                Divider()
                
                RowView(
                    iconName: "exclamationmark.3",
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

