//
//  CardView.swift
//  Reminder
//
//  Created by Nithya Vasudevan on 26.05.26.
//

import SwiftUI

struct CardView : View {
    let category : CardCategory
    
    var body: some View {
        if #available(iOS 26.0, *) {
            Button{
            } label: {
                HStack{
                    VStack (alignment : .leading){
                        Image(systemName: category.iconName)
                            .foregroundStyle(.white)
                            .frame(width: 32, height: 32)
                            .foregroundStyle(Color.white)
                        Spacer()
                        Text(category.cardTitle)
                    }
                    
                    Spacer()
                    
                    VStack {
                        Text("\(category.reminderCount)")
                            .fontWeight(.bold)
                            .font(Font.system(size: 24))
                        Spacer()
                    }
                }
                .foregroundStyle(Color.white)
            }
            .padding()
            .glassEffect(
                .regular.tint(category.iconColor.opacity(0.8)),
                
                in: RoundedRectangle(cornerRadius: 20)
            )
            
            .overlay(alignment: .topLeading) {
                RoundedRectangle(cornerRadius: 16)
                    .fill(
                        LinearGradient(
                            colors: [
                                .white.opacity(0.45),
                                .white.opacity(0.05),
                                .clear
                            ],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .allowsHitTesting(false)
            }
            .shadow(color: .black.opacity(0.18), radius: 6, x: 0, y: 3)
        }
        else {
            Button{
            } label: {
                HStack{
                    VStack (alignment : .leading){
                        Image(systemName: category.iconName)
                            .foregroundStyle(.white)
                            .frame(width: 32, height: 32)
                            .foregroundStyle(Color.white)
                        Spacer()
                        Text(category.cardTitle)
                    }
                    
                    Spacer()
                    
                    VStack {
                        Text("\(category.reminderCount)")
                            .fontWeight(.bold)
                            .font(Font.system(size: 24))
                        Spacer()
                    }
                }
                .foregroundStyle(Color.white)
            }
            .padding()
            .background{
                RoundedRectangle(cornerRadius: 10)
                    .fill(category.iconColor)
            }
            .shadow(color: .black.opacity(0.18), radius: 6, x: 0, y: 3)
        }
    }
}
