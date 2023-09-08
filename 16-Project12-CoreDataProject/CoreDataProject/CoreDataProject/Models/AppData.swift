//
//  AppData.swift
//  CoreDataProject
//
//  Created by Po Hsiang Chao on 2023/9/3.
//

import Foundation
import SwiftUI

struct AppData {
    static let day57Topic: [CoreDataView] = [
        CoreDataView(name: "Core Data Exercise - save(), constraints", view: AnyView(WizardView()))
    ]
    
    static let day58Topic: [CoreDataView] = [
        CoreDataView(name: "Filtering @FetchRequest using NSPredicate", view: AnyView(ShipView())),
        CoreDataView(name: "Dynamically filtering @FetchRequest with SwiftUI", view: AnyView(SingerView())),
        CoreDataView(name: "One-to-many relationships with Core Data, SwiftUI, and @FetchRequest", view: AnyView(CountryCandyView()))
    ]
}
