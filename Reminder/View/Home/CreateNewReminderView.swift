//
//  CreateNewReminderView.swift
//  Reminder
//
//  Created by Nithya Vasudevan on 16.06.26.
//

import SwiftUI

struct CreateNewReminderView: View {
    @StateObject private var viewModel : CreateNewReminderViewModel
    
    init(titleNames : [Title]){
        _viewModel = StateObject(
            wrappedValue: CreateNewReminderViewModel(titles:
                      titleNames)
                  )

    }
    var body: some View {
        NavigationStack {
            
            VStack (spacing : 30){
                NotesSection()
                ScheduleSection(viewModel: viewModel)
                if (viewModel.isDateEnabled || viewModel.isTimeEnabled){
                    RepeatSection(viewModel: viewModel)
                }
                MoreOptionsSection(viewModel: viewModel)
                Spacer()
            }
            .navigationDestination(
                isPresented: $viewModel.isShowingDetailInfoSheet,
                destination: {
                    DetailInfoSheetView()
                }
            )
            .navigationDestination(
                isPresented: $viewModel.isShowingTimeZoneSheet) { TimeZoneSelectionView()
                }
            .padding()
            .navigationTitle("New Reminder")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem (placement : .topBarTrailing) {
                    Button{
                    } label: {
                        Image(systemName: "checkmark")
                    }
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    Button{
                    } label: {
                        Image(systemName: "x.circle")
                    }
                }
            }
        }
        
    }
}

struct NotesSection : View {
    @State private var title: String = ""
    @State private var notes : String = ""
    @State private var url : String = ""
    
    var body: some View {
        VStack (spacing: 20) {
            TextField("Title", text: $title)
            TextField("Notes", text: $notes)
            Divider()
            TextField("URL", text: $url)
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 20)
                .fill(.bar)
        }
    }
}

struct ScheduleSection : View {
    @ObservedObject var viewModel : CreateNewReminderViewModel
    
    
    var body: some View {
        VStack(alignment : .leading) {
            Text("Date & Time")
                .padding()
                .font(.title2)
                .font(Font.headline.weight(.bold))
            
            VStack(alignment : .leading) {
                RowView(
                    iconName: "calendar",
                    rowTitle: "Date",
                    subtitle:viewModel.selectedDateString,
                    onTap: {viewModel.dateRowTapped()})
                {
                    Toggle("", isOn: $viewModel.isDateEnabled)
                        .labelsHidden()
                        .onChange(of: viewModel.isDateEnabled) { _ , newValue in
                            viewModel.dateToggleChanged(newValue)
                        }
                }
                if (viewModel.shouldShowDatePicker){
                    DatePicker(
                        "",
                        selection: $viewModel.selectedDate,
                        displayedComponents: .date
                    )
                    .datePickerStyle(.graphical)
                    .onChange(of: viewModel.selectedDate) {
                        _, newDate in viewModel.dateSelected(newDate)
                    }
                }
                RowView(
                    iconName: "clock",
                    rowTitle: "Time",
                    subtitle: viewModel.selectedTimeString,
                    onTap: {viewModel.timeRowTapped()}){
                        Toggle("", isOn: $viewModel.isTimeEnabled)
                            .labelsHidden()
                            .onChange(of: viewModel.isTimeEnabled) { _, newValue in
                                viewModel.timeToggleChanged(newValue)
                            }
                    }
                if(viewModel.shouldShowTimePicker) {
                    VStack {
                        DatePicker(
                            "",
                            selection: $viewModel.selectedTime,
                            displayedComponents: .hourAndMinute
                        )
                        .datePickerStyle(.wheel)
                        .onChange(of: viewModel.selectedTime) {
                            _, newTime in viewModel.timeSelected(newTime)
                        }
                    }
                    
                    RowView(
                        iconName: "globe",
                        rowTitle: "Time Zone",
                        subtitle: "",
                        onTap: {viewModel.timeZoneRowTapped()}){
                            HStack{
                                Text("Berlin")
                                Button{
                                    viewModel.timeZoneRowTapped()
                                }label: {
                                    Image(systemName: "chevron.right")
                                }
                            }
                        }
                }
                RowView(
                    iconName: "alarm",
                    rowTitle: "Urgent",
                    subtitle: viewModel.urgentInfoSTring,
                    onTap: {viewModel.urgentRowTapped()}) {
                        Toggle("", isOn: $viewModel.isUrgent)
                            .labelsHidden()
                            .onChange(of: viewModel.isUrgent) { _, newValue in
                                viewModel.urgentToggleChanged(newValue)
                            }
                    }
            }
            .padding()
            .background{
                RoundedRectangle(cornerRadius: 20)
                    .fill(.bar)
            }
            Text(viewModel.urgentFooterText)
                .foregroundStyle(.gray)
                .padding()
        }
    }
}

struct RepeatSection : View {
    @ObservedObject var viewModel : CreateNewReminderViewModel
    
    var body: some View {
        RowView(
            iconName: "repeat",
            rowTitle: "Repeat",
            subtitle: "",
            onTap: {viewModel.repeatRowTapped()}
        ) {
            Picker("", selection: $viewModel.repeatOption) {
                ForEach(RepeatOption.allCases) {
                    option in
                    Text(option.rawValue)
                        .tag(option)
                }
            }
            .pickerStyle(.menu)
        }
    }
}

struct MoreOptionsSection : View {
    @ObservedObject var viewModel : CreateNewReminderViewModel
    
    var body : some View {
        VStack (alignment: .leading){
            Text("More Options")
                .padding()
                .font(.title2)
                .font(Font.headline.weight(.bold))
            
            RowView(
                iconName: "checklist",
                rowTitle: "List",
                subtitle: "",
                onTap:  {viewModel.listRowTapped()}) {
                    Picker("", selection: $viewModel.selectedListName) {
                        ForEach(viewModel.reminderListTitles){
                            title in
                            Text(title.title)
                                .tag(title.title)
                        }
                    }
                    .pickerStyle(.menu)
                }
                .padding()
                .background {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.bar)
                }
            
            RowView(
                iconName: "info",
                rowTitle: "Details",
                subtitle: "",
                onTap: {viewModel.detailInfoRowTapped()},
                trailing: {Button{
                    viewModel.detailInfoRowTapped()
                } label : {
                    Image(systemName: "chevron.right")
                }
                }
            )
            .padding()
            .background{
                RoundedRectangle(cornerRadius: 20)
                    .fill(.bar)
            }
        }
    }
}



#Preview {
    CreateNewReminderView(
             titleNames: HomeViewModel().titleNames
         )
}
    
