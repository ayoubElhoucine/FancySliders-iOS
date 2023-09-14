//
//  File.swift
//  
//
//  Created by Ayoub on 13/9/2023.
//

import Foundation
import SwiftUI


extension StepSlider {
    class Model: ObservableObject {
        
        private var _stepItemList = [StepItem]()
        var stepItemList: [StepItem] { get { return _stepItemList } }
        
        @Published private var _dragPoint = CGPoint(x: 0, y: 0)
        var dragPoint: CGPoint { get { return _dragPoint } }
        
        @Published private var _shimmerStatus: Bool = true
        var shimmerStatus: Bool { get { return _shimmerStatus } }
        
        func setUp(width: CGFloat, height: CGFloat, stepCount: Int) {
            _dragPoint = CGPoint(x: height/2, y: height/2)
            let range = width/CGFloat(stepCount - 1)
            for i in 0...stepCount - 1 {
                var x: CGFloat = range * CGFloat(i)
                if x == 0 { x = height/2 }
                if x == width { x = width - height/2 }
                _stepItemList.append(
                    StepItem(
                        value: i,
                        minX: (range * CGFloat(i)) - range/2,
                        maxX: (range * CGFloat(i)) + range/2,
                        x: x
                    )
                )
            }
        }
        
        func updateDragPosition(value: DragGesture.Value, width: CGFloat, height: CGFloat) {
            if shimmerStatus { _shimmerStatus = false }
            if value.location.x < width - height/2 && value.location.x > height/2 {
                _dragPoint.x = value.location.x
            }
        }
        
        func endDraging(value: DragGesture.Value, didComplete: (Int) -> Void, width: CGFloat, height: CGFloat) {
            withAnimation {
                let item = self.getStepItem(value: value.location.x)
                if let x = item?.x { self._dragPoint.x = x }
                if let value = item?.value { didComplete(value) }
            }
        }
        
        struct StepItem {
            let value: Int
            let minX: CGFloat
            let maxX: CGFloat
            let x: CGFloat
        }
        
        func getStepItem(value: CGFloat) -> StepItem? {
            for item in stepItemList {
                if value > item.minX && value < item.maxX {
                    return item
                }
            }
            return nil
        }
    }
}
