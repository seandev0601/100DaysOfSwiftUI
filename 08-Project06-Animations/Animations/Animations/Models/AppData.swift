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
    
    static let day33Topic: [AnimationView] = [
        AnimationView(name: "Animation Stack", view: AnyView(AnimationStack())),
        AnimationView(name: "Animation Gestures", view: AnyView(AnimationGestures())),
        AnimationView(name: "Animation Transition", view: AnyView(AnimationTransition())),
        AnimationView(name: "Custom Transition", view: AnyView(CustomTransition()))
    ]
    
    static let day34Topic: [AnimationView] = [
        AnimationView(name: "Animation Challenge", view: AnyView(AnimationChallenge()))
    ]
}
