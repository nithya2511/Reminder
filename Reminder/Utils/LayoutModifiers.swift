//
//  LayoutModifiers.swift
//  Reminder
//
//  Created by Nithya Vasudevan on 23.05.26.
//

import SwiftUI


struct DefaultPageRightPadding: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.trailing, 20)
    }
}

extension View {
    func defualtPageRightPadding() -> some View {
        self.modifier(DefaultPageRightPadding())
    }
}
