//
//  AppData.swift
//  Drawing
//
//  Created by Po Hsiang Chao on 2023/8/7.
//

import Foundation
import SwiftUI

struct AppData {
    static let day43Topic: [DrawView] = [
        DrawView(name: "Creating custom paths", view: AnyView(CustomPaths())),
        DrawView(name: "Creating custom shapes", view: AnyView(CustomShape())),
        DrawView(name: "Adding strokeBorder() support with InsettableShape", view: AnyView(CustomInsettableShape()))
    ]
    
    static let day44Topic: [DrawView] = [
        DrawView(name: "Transforming shapes using CGAffineTransform", view: AnyView(CustomFlower())),
        DrawView(name: "Creative borders and fills using ImagePaint", view: AnyView(CustomImagePaint())),
        DrawView(name: "Enabling high-performance Metal rendering with drawingGroup()", view: AnyView(CustomColorCircle()))
    ]
    
    static let day45Topic: [DrawView] = [
        DrawView(name: "Special effects: blurs, blending, saturation()", view: AnyView(CustomViewRender())),
        DrawView(name: "Animating simple shapes with animatableData", view: AnyView(CustomTrapezoidAnimation())),
        DrawView(name: "Animating complex shapes with AnimatablePair", view: AnyView(CustomAnimatablePair())),
        DrawView(name: "Creating a spirograph", view: AnyView(CustomSpirograph()))
    ]
    
    static let day46Topic: [DrawView] = [
        DrawView(name: "Custom Arrow", view: AnyView(CustomArrow())),
        DrawView(name: "Custom ColorCyclingRectangle", view: AnyView(CustomColorRectangle()))
    ]
}
