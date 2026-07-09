//
//  BottomBarView.swift
//  Reminder
//
//  Created by Nithya Vasudevan on 26.05.26.
//

import SwiftUI

struct BottomBarView: View {
    let onAdd : () -> Void
    
    var body: some View {
            Button {
                onAdd()
            } label: {
                Image(systemName: "plus")
            }
            .font(Font.system(size: 24, weight: .medium))
            .foregroundStyle(Color.white)
            .frame(width: 50, height : 50)
            .background{
                Circle()
                    .fill(Color.blue)
            }
            .padding([.trailing, .bottom], 20)
            
    }
}
