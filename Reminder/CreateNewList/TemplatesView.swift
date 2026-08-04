//
//  TemplatesView.swift
//  Reminder
//
//  Created by Nithya Vasudevan on 09.07.26.
//

import SwiftUI

struct TemplatesView: View {
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: "macwindow.on.rectangle")
                .frame(width: 40, height: 40)
                .font(.system(size: 50))
            Text("No Templates")
                .fontWeight(.bold)
                .font(.title2)
            Text("You can create templates from lists by tapping settings icon inside  a list and choosing Save as Template")
                .font(.caption)
                .foregroundStyle(.gray)
                .padding(.leading, 20)
                .padding(.trailing, 20)
    
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
    }
}

#Preview {
    TemplatesView()
}
