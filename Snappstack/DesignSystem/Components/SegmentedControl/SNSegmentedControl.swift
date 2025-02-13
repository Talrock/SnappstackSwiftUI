//
//  SNSegmentedControl.swift
//  Snappstack
//
//  Created by Mostafizur Rahman on 3/2/25.
//

import SwiftUI

public struct SNSegmentedControl: View {
    
    public let segments: [Segment]
    @Binding var activeSegment: String
    
    let style: SegmentControlStyler
    let leftAligned: Bool
    
    var segmentTapped:((Segment) -> Void)?
    
    public init(segments: [Segment],
                activeSegment: Binding<String>,
                leftAligned: Bool = (UIDevice.current.userInterfaceIdiom == .pad),
                style: SegmentControlStyler,
                segmentTapped: ((Segment) -> Void)? = nil) {
        
        self.segments = segments
        self._activeSegment = activeSegment
        self.style = style
        self.leftAligned = leftAligned
        self.segmentTapped = segmentTapped
    }
    
    public var body: some View {
        HStack {
            Grid(horizontalSpacing: leftAligned ? SpacingTokens.xxs : SpacingTokens.sm) {
                GridRow {
                    ForEach(segments) {
                        SegmentView(
                            segment: $0,
                            style: style,
                            activeSegment: $activeSegment,
                            scrollViewProxy: nil,
                            segmentTapped: segmentTapped
                        )
                    }
                }
            }
            .padding(SpacingTokens.xxxs)
            .background(style.backgroundColor)
            .clipShape(.capsule)

            if leftAligned {
                Spacer()
            }
        }
        .padding(SpacingTokens.screenEdge)
    }
}

public struct SNScrollSegmentedControl: View {
    
    public let segments: [Segment]
    var spacing: CGFloat = SpacingTokens.sm
    var scrollable: Bool
    @Binding var activeSegment: String
    
    let style: SegmentControlStyler
    
    var segmentTapped:((Segment) -> Void)?
    
    public init(segments: [Segment],
                spacing: CGFloat = SpacingTokens.sm,
                scrollable: Bool = true,
                activeSegment: Binding<String>,
                style: SegmentControlStyler,
                segmentTapped: ((Segment) -> Void)? = nil) {
        
        self.segments = segments
        self.spacing = spacing
        self.scrollable = scrollable
        self._activeSegment = activeSegment
        self.style = style
        self.segmentTapped = segmentTapped
    }
    
    public var body: some View {
        if scrollable {
            Group {
                ScrollViewReader { scrollViewProxy in
                    ScrollView(.horizontal, showsIndicators: false) {
                        getStackSegmentedControl(scrollViewProxy: scrollViewProxy)
                    }
                }
            }.clipShape(.capsule)
        }
        else {
            getStackSegmentedControl(scrollViewProxy: nil)
                .background(style.backgroundColor)
                .clipShape(.capsule)
        }
    }
    
    private func getStackSegmentedControl(scrollViewProxy: ScrollViewProxy?) -> some View {
        StackSegmentedControl(
            spacing: spacing,
            segments: segments,
            style: style,
            activeSegment: $activeSegment,
            scrollViewProxy: scrollViewProxy,
            segmentTapped: self.segmentTapped
        )
    }
}

extension SNScrollSegmentedControl {
    public mutating func update(activeSegment newActiveSegment: String) {
        
        if segments.contains(where: { $0.title == newActiveSegment }) {
            activeSegment = newActiveSegment
        }
    }
    
    public mutating func update(activeSegmentIdx newSegmentIdx: Int) {
        if newSegmentIdx < segments.count {
            activeSegment = segments[newSegmentIdx].title
        }
    }
}

private struct StackSegmentedControl: View {
    
    let spacing: CGFloat
    let segments: [Segment]
    let style: SegmentControlStyler
    
    @Binding var activeSegment: String
    var scrollViewProxy: ScrollViewProxy?
    
    var segmentTapped:((Segment) -> Void)?
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(segments) { segment in
                SegmentView(
                    segment: segment,
                    style: style,
                    activeSegment: $activeSegment,
                    scrollViewProxy: scrollViewProxy,
                    segmentTapped: segmentTapped
                )
                .id(segment.id)
                .hoverEffect()
            }
        }
        .padding(.top, style.parentPadding.top)
        .padding(.horizontal, style.parentPadding.horizontal)
        .padding(.bottom, style.parentPadding.bottom)
        .onAppear {
            if let activeSegment = self.segments.first(where: { $0.title == self.activeSegment }) {
                scrollViewProxy?.scrollTo(activeSegment.id)
            }
        }

    }
}
