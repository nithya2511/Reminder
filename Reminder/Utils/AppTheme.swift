//
//  AppTheme.swift
//  Reminder
//
//  Created by Nithya Vasudevan on 25.05.26.
//
import SwiftUI

enum AppTheme {
    static let background = Color(.systemGroupedBackground)
}

extension View {
    func appBackground() -> some View {
        frame(maxWidth: .infinity, maxHeight: .infinity)
            .background{
                AppTheme.background
                    .ignoresSafeArea()
            }
    }
}
