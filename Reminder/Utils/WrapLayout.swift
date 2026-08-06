//
//  WrapLayout.swift
//  Reminder
//
//  Created by Nithya Vasudevan on 06.08.26.
//


import SwiftUI

struct WrapLayout : Layout {
    
    var spacing : CGFloat = 4
    var lineSpacing : CGFloat = 4
    
    
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        let maxWidth = proposal.width ?? .infinity
        
        var x : CGFloat = 0
        var y : CGFloat = 0
        var lineHeight : CGFloat = 0
        
        for subview in subviews {
            let size = subview.sizeThatFits(.unspecified)
            
            if x > 0 && x + size.width > maxWidth {
                y += lineHeight + lineSpacing
                x = 0
                lineHeight = 0
            }
            
            x += size.width + spacing
            lineHeight = max(lineHeight, size.height)
        }
        
        return CGSize(
            width: maxWidth,
            height: y + lineHeight
        )
    }
    
    func placeSubviews(
        in bounds: CGRect,
        proposal: ProposedViewSize,
        subviews: Subviews,
        cache: inout ()
    ) {
        var x = bounds.minX
        var y = bounds.minY
        var lineHeight: CGFloat = 0
        
        for subview in subviews {
            let size = subview.sizeThatFits(.unspecified)
            
            if x > bounds.minX && x + size.width > bounds.maxX {
                y += lineHeight + lineSpacing
                x = bounds.minX
                lineHeight = 0
            }
            
            subview.place(
                at: CGPoint(x: x, y: y),
                proposal: ProposedViewSize(size)
            )
            
            x += size.width + spacing
            lineHeight = max(lineHeight, size.height)
        }
    }
}
