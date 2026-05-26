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
        Button{
        } label: {
            HStack{
                VStack (alignment : .leading){
                    Image(systemName: category.iconName)
                        .foregroundStyle(.white)
                        .frame(width: 32, height: 32)
                        .background{
                            Circle()
                                .fill(category.iconColor)
                        }
                    Spacer()
                    Text(category.cardTitle)
                }
                
                Spacer()
                
                VStack {
                    Text("\(category.reminderCount)")
                        .foregroundStyle(.black)
                        .fontWeight(.bold)
                        .font(Font.system(size: 24))
                    Spacer()
                }
            }
        }
        .padding()
        .background{
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
        }
            
    }
}
