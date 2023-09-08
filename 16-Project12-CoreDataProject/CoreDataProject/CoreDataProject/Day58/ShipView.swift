//
//  ShipView.swift
//  CoreDataProject
//
//  Created by Po Hsiang Chao on 2023/9/5.
//

import SwiftUI

struct ShipView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [], predicate: NSPredicate(format: "name < %@", "F")) var ships: FetchedResults<Ship>
    
    var body: some View {
        VStack {
            List(ships, id: \.self) { ship in
                Text(ship.name ?? "Unknown name")
            }
            
            Button("Add Examples") {
                addExamples(name: "Enterprise", universe: "Star Trek")
                addExamples(name: "Defiant", universe: "Star Trek")
                addExamples(name: "Millennium Falcon", universe: "Star Wars")
                addExamples(name: "Executor", universe: "Star Wars")
                
                try? moc.save()
            }
        }
        .navigationTitle("Ship")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func addExamples(name: String, universe: String) {
        let ship = Ship(context: moc)
        ship.name = name
        ship.universe = universe
    }
}

struct ShipView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ShipView()
        }
    }
}
