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
}
