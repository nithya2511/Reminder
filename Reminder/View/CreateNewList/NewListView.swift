//
//  NewListView.swift
//  Reminder
//
//  Created by Nithya Vasudevan on 09.07.26.
//

import SwiftUI

struct NewListView : View {
    @ObservedObject var viewModel : CreateNewListViewModel
    var body: some View {
        ScrollView{
            VStack  (alignment : .center) {
                if #available(iOS 26.0, *) {
                    Image(systemName: viewModel.selectedIcon.rawValue)
                        .frame(width: 80, height: 80)
                        .font(.system(size: 32))
                        .foregroundStyle(.white)
                        .glassEffect(
                            .regular.tint(viewModel.selectedColor.color),
                            in:Circle()
                        )
                } else {
                    Image(systemName: "list.bullet")
                        .frame(width: 80, height: 80)
                        .font(.system(size: 32))
                        .foregroundStyle(.white)
                        .background{
                            Circle()
                                .fill(.blue)
                        }
                }
                TextField("List Name", text: $viewModel.listName)
                    .multilineTextAlignment(.center)
                    .padding()
                    .background {
                        RoundedRectangle(cornerRadius: 15)
                            .fill(.bar)
                    }
                
            }
            .padding()
            .background{
                RoundedRectangle(cornerRadius: 20)
                    .fill(.white)
            }
            
            RowView(
                iconName: "list.bullet",
                rowTitle: "List Type",
                subtitle: "",
                onTap: {viewModel
                    .listTypeRowTapped()}) {
                        Picker(
                            "",
                            selection: $viewModel.selectedListType,
                            content: {
                                Text("Standard").tag(ListType.standard)
                                Text("Shopping").tag(ListType.shopping)
                                
                                Divider()
                                
                                Text("Smart").tag(ListType.smart)
                            })
                    }
                    .padding()
                    .background {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.white)
                    }
            ColorSelectionPanelView(viewModel: viewModel)
            IconSelectionPanelView(viewModel: viewModel)
        }
    }
}

struct ColorSelectionPanelView : View {
    @ObservedObject var viewModel : CreateNewListViewModel
    private let columns = [GridItem(.adaptive(minimum:48))]
    var body: some View {
        LazyVGrid(columns: columns, spacing: 20) {
            ForEach(ListColor.allCases) { option in
                Button{
                    viewModel.selectedColor = option
                } label: {
                    Circle()
                        .fill(option.color)
                        .frame(width: 48, height: 48)
                }
                .buttonStyle(.plain)
            }
           
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 20)
                .fill(.white)
        }
    }
}

struct IconSelectionPanelView : View {
    @ObservedObject var viewModel :CreateNewListViewModel
    private let columns = [GridItem(.adaptive(minimum: 48))]
    var body: some View {
        LazyVGrid(columns: columns, spacing: 20) {
            ForEach(ListIcon.allCases){ icon in
                Button{
                    viewModel.selectedIcon = icon
                } label: {
                    Image(systemName: icon.rawValue)
                }
                .frame(width: 48, height: 48)
                .foregroundStyle(.gray)
                .background{
                    Circle()
                        .fill(.bar)
                }
            }
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 20)
                .fill(.white)
        }
    }
}

#Preview {
    NewListView(viewModel: CreateNewListViewModel())
}
