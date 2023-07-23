//
//  AnimationView.swift
//  Animations
//
//  Created by Po Hsiang Chao on 2023/7/23.
//

import Foundation
import SwiftUI

struct AnimationView: Identifiable {
    let id = UUID()
    let name: String
    let view: AnyView
}
