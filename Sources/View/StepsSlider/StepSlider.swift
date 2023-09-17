//
//  File.swift
//  
//
//  Created by Ayoub on 7/9/2023.
//

import Foundation
import SwiftUI


@available(iOS 15.0, *)
public struct StepSlider<Content: View, Thumbnail: View>: View {
    
    @StateObject private var model = Model()
    
    let width: CGFloat
    let height: CGFloat
    let stepCount: Int
    let content: () -> Content
    let thumbnail: () -> Thumbnail
    let didComplete: (Int) -> Void
    let onSliding: (Int) -> Void
    
    public init(width: CGFloat, height: CGFloat, stepCount: Int, thumbnail: @escaping () -> Thumbnail, content: @escaping () -> Content, onSliding: @escaping (Int) -> Void, didComplete: @escaping (Int) -> Void) {
        self.width = width
        self.height = height
        self.stepCount = stepCount
        self.content = content
        self.thumbnail = thumbnail
        self.didComplete = didComplete
        self.onSliding = onSliding
    }
    
    public var body: some View {
        Capsule()
            .fill(.clear)
            .frame(width: width, height: height)
            .clipped()
            .overlay {
                ZStack {
                    content()
                    Shimmer(width: width, height: height, status: model.shimmerStatus)
                    thumbnail()
                        .frame(width: height, height: height)
                        .position(x: model.dragPoint.x, y: model.dragPoint.y)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    model.updateDragPosition(value: value, onSliding: onSliding, width: width, height: height)
                                }
                                .onEnded { value in
                                    model.endDraging(value: value, didComplete: didComplete, width: width, height: height)
                                }
                        )
                }
            }
            .onAppear {
                self.model.setUp(width: width, height: height, stepCount: stepCount)
            }
    }
}
