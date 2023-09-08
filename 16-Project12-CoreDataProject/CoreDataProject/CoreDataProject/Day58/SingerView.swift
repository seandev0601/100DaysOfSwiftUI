//
//  SingerView.swift
//  CoreDataProject
//
//  Created by Po Hsiang Chao on 2023/9/8.
//

import CoreData
import SwiftUI

struct SingerView: View {
    @Environment(\.managedObjectContext) var moc
    @State private var lastNameFilter = "A"
    
    var body: some View {
        VStack {
            // list of matching singers
            FilteredList(filterKey: "lastName", filterValue: lastNameFilter) { (singer: Singer) in
                Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
            }
            
            Button("Add Examples") {
                addExample(firstName: "Taylor", lastName: "Swift")
                addExample(firstName: "Ed", lastName: "Sheeran")
                addExample(firstName: "Adele", lastName: "Adkins")
                
                try? moc.save()
            }
            
            Button("Show A") {
                lastNameFilter = "A"
            }
            
            Button("Show S") {
                lastNameFilter = "S"
            }
        }
        .navigationTitle("Singer")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func addExample(firstName: String, lastName: String) {
        let singer = Singer(context: moc)
        singer.firstName = firstName
        singer.lastName = lastName
    }
}

struct SingerView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SingerView()
        }
    }
}
