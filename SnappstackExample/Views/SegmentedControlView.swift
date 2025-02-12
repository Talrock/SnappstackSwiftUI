//
//  SegmentedControlView.swift
//  SnappstackExample
//
//  Created by Mostafizur Rahman on 11/2/25.
//

import SwiftUI
import Snappstack

struct SegmentedControlView: View {
    @State private var selectedSegment: String = "Accounts"
    @State private var selectedSegment1: String = "Ascending"

    var body: some View {
        ScrollView {
            VStack(spacing: SpacingTokens.lg) {
                SNSegmentedControl(
                    segments: [
                        Segment(title: "Ascending"),
                        Segment(title: "Descending")
                    ],
                    activeSegment: $selectedSegment1,
                    leftAligned: false,
                    style: SegmentControlStyler(
                        font: Font.system(size: 15, weight: .semibold),
                        textColor: SegmentControlStylerColor(active: ColorTokens.textPrimary, inactive: ColorTokens.gray3),
                        activeBarColor: ColorTokens.textPrimary,
                        backgroundColor: ColorTokens.fill0
                    )
                )
                
                SNSegmentedControl(
                    segments: [
                        Segment(title: "Ascending"),
                        Segment(title: "Descending")
                    ],
                    activeSegment: $selectedSegment1,
                    leftAligned: false,
                    style: SegmentControlStyler(
                        style: .capsule,
                        font: Font.system(size: 15, weight: .semibold),
                        textColor: SegmentControlStylerColor(active: ColorTokens.textPrimary, inactive: ColorTokens.gray3),
                        activeBarColor: ColorTokens.gray0,
                        backgroundColor: ColorTokens.gray1
                    )
                )
                
                SNSegmentedControl(
                    segments: [
                        Segment(title: "Accounts"),
                        Segment(title: "Cards"),
                        Segment(title: "Liked")
                    ],
                    activeSegment: $selectedSegment,
                    leftAligned: false,
                    style: SegmentControlStyler(
                        style: .capsule,
                        font: Font.system(size: 15, weight: .semibold),
                        textColor: SegmentControlStylerColor(active: ColorTokens.textPrimary, inactive: ColorTokens.gray3),
                        activeBarColor: ColorTokens.gray0,
                        backgroundColor: ColorTokens.gray1
                    )
                )
                
                SNScrollSegmentedControl(
                    segments: [
                        Segment(title: "Accounts"),
                        Segment(title: "Cards"),
                        Segment(title: "Liked"),
                        Segment(title: "Stocks")
                    ],
                    spacing: 0,
                    activeSegment: $selectedSegment,
                    style: SegmentControlStyler(
                        style: .capsule,
                        font: Font.system(size: 15, weight: .semibold),
                        textColor: SegmentControlStylerColor(active: ColorTokens.gray0, inactive: ColorTokens.gray3),
                        activeBarColor: ColorTokens.textPrimary,
                        backgroundColor: ColorTokens.fill0
                    )
                )
                
                SNScrollSegmentedControl(
                    segments: [
                        Segment(title: "Accounts"),
                        Segment(title: "Cards"),
                        Segment(title: "Liked"),
                        Segment(title: "Stocks")
                    ],
                    activeSegment: $selectedSegment,
                    style: SegmentControlStyler(
                        font: Font.system(size: 15, weight: .semibold),
                        textColor: SegmentControlStylerColor(active: ColorTokens.textPrimary, inactive: ColorTokens.gray3),
                        activeBarColor: ColorTokens.textPrimary,
                        backgroundColor: ColorTokens.fill0
                    )
                )
                
                SNScrollSegmentedControl(
                    segments: [
                        Segment(title: "Accounts"),
                        Segment(title: "Cards"),
                        Segment(title: "Liked"),
                        Segment(title: "Stocks"),
                        Segment(title: "Savings"),
                        Segment(title: "Investments"),
                    ],
                    activeSegment: $selectedSegment,
                    style: SegmentControlStyler(
                        font: Font.system(size: 15, weight: .semibold),
                        textColor: SegmentControlStylerColor(active: ColorTokens.textPrimary, inactive: ColorTokens.gray3),
                        activeBarColor: ColorTokens.textPrimary,
                        backgroundColor: ColorTokens.fill0
                    )
                )
               
            }
        }
    }
}

struct SegmentedControlView_Previews: PreviewProvider {
    static var previews: some View {
        SegmentedControlView()
    }
}
