//
//  TimeZoneSelectionSheetView.swift
//  Reminder
//
//  Created by Nithya Vasudevan on 26.06.26.
//

import SwiftUI

struct TimeZoneSelectionView: View {
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        NavigationStack {
                      Text("Select Time Zone")
                          .navigationTitle("Time Zone")
                          .navigationBarTitleDisplayMode(.inline)
                          .navigationBarBackButtonHidden(true)
                          .toolbar{
                              ToolbarItem(placement: .topBarLeading ){
                                  Button{
                                      dismiss()
                                  } label: {
                                      Image(systemName: "xmark")
                                  }
                              }
                              ToolbarItem(placement: .topBarTrailing ){
                                  Button{
                                  } label: {
                                      Image(systemName: "checkmark")
                                  }
                              }
                          }
                  }
    }
}

#Preview {
    TimeZoneSelectionView()
}
