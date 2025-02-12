//
//  SegmentView.swift
//  Snappstack
//
//  Created by Mostafizur Rahman on 3/2/25.
//

import SwiftUI

extension UnderlineSegmentView {
    public enum UnderlinePosition {
        case top
        case bottom
    }
}

internal struct SegmentView: View {
    
    let segment: Segment
    let style: SegmentControlStyler
    
    @Binding var activeSegment: String
    var scrollViewProxy: ScrollViewProxy?
    
    var segmentTapped:((Segment) -> Void)?
    
    private func isActiveSegment(currentSegment: Segment) -> Bool {
        (currentSegment.title == activeSegment)
    }
    
    var body: some View {
        Button {
            
            withAnimation {
                
                activeSegment = segment.title
                segmentTapped?(segment)
                
                if let scrollViewProxy {
                    scrollViewProxy.scrollTo(segment.id)
                }
            }
        } label: {
            
            switch self.style.style {
            case .underline(_), .overline(_):
                UnderlineSegmentView(
                    segment: segment,
                    style: style,
                    activeSegment: $activeSegment
                )
                
            case .capsule:
                
                Text(.init("\(style.titleSpacerText)\(segment.title)\(style.titleSpacerText)"))
                    .font(isActiveSegment(currentSegment: segment) ? style.font.active : style.font.inactive)
                    .foregroundColor((segment.title == activeSegment) ? style.textColor.active : style.textColor.inactive)
                    .padding(.horizontal, SpacingTokens.xs)
                    .padding(.vertical, SpacingTokens.xxs)
                    .background(isActiveSegment(currentSegment: segment) ? style.activeBarColor : Color.clear)
                    .clipShape(.capsule)
                
            }
        }
        .buttonStyle(.plain)
        .animation(.easeOut(duration: 0.35), value: activeSegment)
    }
}

internal struct UnderlineSegmentView: View {
    
    let segment: Segment
    let style: SegmentControlStyler
    
    @Binding var activeSegment: String
    
    private var isActiveSegment: Bool {
        activeSegment == segment.title
    }
    
    init(segment: Segment,
         style: SegmentControlStyler,
         activeSegment: Binding<String>) {
        
        self.segment           = segment
        self.style             = style
        self._activeSegment    = activeSegment
    }
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            switch style.style {
            case .overline(let bottomPadding):
                underlineBarView
                    .padding(.bottom, bottomPadding)
                
            default:
                EmptyView()
                    .frame(width: 0, height: 0)
            }
            
            Text(.init("\(style.titleSpacerText)\(segment.title)\(style.titleSpacerText)"))
                .font(isActiveSegment ? style.font.active : style.font.inactive)
                .foregroundColor(isActiveSegment ? style.textColor.active : style.textColor.inactive)
            
            switch style.style {
            case .underline(let topPadding):
                underlineBarView
                    .padding(.top, topPadding)
                
            default:
                EmptyView()
                    .frame(width: 0, height: 0)
            }
        }
        .transition(.opacity)
        .animation(.linear(duration: 0.25), value: activeSegment)
    }
    
    private var underlineBarView: some View {
        style.activeBarColor
            .cornerRadius(style.activeBarWidth / 2)
            .frame(height: style.activeBarWidth)
            .opacity(isActiveSegment ? OpacityTokens.opacity100 : OpacityTokens.opacity0)
    }
}
