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

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: SpacingTokens.md) {
//                SNSegmentedControl(
//                    segments: [
//                        Segment(title: "Accounts"),
//                        Segment(title: "Cards"),
//                        Segment(title: "Liked")
//                    ],
//                    activeSegment: $selectedSegment,
//                    leftAligned: true,
//                    style: SegmentControlStyler(
//                        style: .capsule,
//                        font: Font.system(size: 16, weight: .semibold),
//                        textColor: SegmentControlStylerColor(active: Color.white, inactive: Color.gray),
//                        activeBarColor: Color.blue
//                    ),
//                    segmentTapped: nil
//                )
//                
//                SNSegmentedControl(
//                    segments: [
//                        Segment(title: "Accounts"),
//                        Segment(title: "Cards"),
//                        Segment(title: "Liked")
//                    ],
//                    activeSegment: $selectedSegment,
//                    leftAligned: false,
//                    style: SegmentControlStyler(
//                        style: .capsule,
//                        font: Font.system(size: 16, weight: .semibold),
//                        textColor: SegmentControlStylerColor(active: Color.white, inactive: Color.gray),
//                        activeBarColor: Color.blue
//                    ),
//                    segmentTapped: nil
//                )
                
                SNScrollSegmentedControl(
                    segments: [
                        Segment(title: "Accounts"),
                        Segment(title: "Cards")
                    ],
                    scrollable: false,
                    activeSegment: $selectedSegment,
                    style: SegmentControlStyler(
                        font: Font.system(size: 18, weight: .bold),
                        textColor: SegmentControlStylerColor(active: Color.black, inactive: Color.gray),
                        activeBarColor: Color.blue
                    )
                )
                
                SNScrollSegmentedControl(
                    segments: [
                        Segment(title: "Accounts"),
                        Segment(title: "Cards"),
                        Segment(title: "Liked")
                    ],
                    spacing: 0,
                    activeSegment: $selectedSegment,
                    style: SegmentControlStyler(
                        style: .capsule,
                        font: Font.system(size: 15, weight: .semibold),
                        textColor: SegmentControlStylerColor(active: Color.white, inactive: Color.gray),
                        activeBarColor: Color.blue)
                )
                
                SNScrollSegmentedControl(
                    segments: [
                        Segment(title: "Accounts"),
                        Segment(title: "Cards"),
                        Segment(title: "Liked")
                    ],
                    activeSegment: $selectedSegment,
                    style: SegmentControlStyler(
                        font: Font.system(size: 15, weight: .semibold),
                        textColor: SegmentControlStylerColor(active: Color.black, inactive: Color.gray),
                        activeBarColor: Color.blue)
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
                        textColor: SegmentControlStylerColor(active: Color.black, inactive: Color.gray),
                        activeBarColor: Color.blue)
                )
               
            }
        }
    }
}

struct SegmentedControlView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView()
    }
}
