//
//  AppData.swift
//  Animations
//
//  Created by Po Hsiang Chao on 2023/7/23.
//

import Foundation
import SwiftUI

struct AppData {
    static let day32Topic: [AnimationView] = [
        AnimationView(name: "Animations", view: AnyView(Animations())),
        AnimationView(name: "Custom Animation", view: AnyView(CustomAnimation())),
        AnimationView(name: "Animatiing Bindings", view: AnyView(AnimatingBindings())),
        AnimationView(name: "Animation 3DEffect", view: AnyView(Animation3DEffect()))
    ]
}
