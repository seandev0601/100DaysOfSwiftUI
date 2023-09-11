//
//  ChallengeView.swift
//  CoreDataProject
//
//  Created by Po Hsiang Chao on 2023/9/11.
//

import SwiftUI

struct ChallengeView: View {
    @Environment(\.managedObjectContext) var moc
    
    @State private var filterKey = "firstName"
    let filters = ["firstName", "lastName"]
    @State private var nameFilter = ""
    
    @State private var predicate: Predicate = .beginsWith
    
    @State private var sortDescriptors: [SortDescriptor<Singer>] = []
    @State private var showingOrderAlert = false
    
    var body: some View {
        VStack {
            
            VStack(spacing: 20) {
                Section("Filter") {
                    Picker("Filter name", selection: $filterKey) {
                        ForEach(filters, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    Picker("Filter constrain", selection: $predicate) {
                        ForEach(Predicate.allCases, id: \.self) {
                            Text($0.value)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                HStack {
                    Text("Search name: ")
                    TextField("Search...", text: $nameFilter)
                        .padding(5)
                        .border(.black)
                }
                
                Button("Add Examples") {
                    addExample(firstName: "Taylor", lastName: "Swift")
                    addExample(firstName: "Ed", lastName: "Sheeran")
                    addExample(firstName: "Adele", lastName: "Adkins")
                    addExample(firstName: "Alan", lastName: "Walker")
                    addExample(firstName: "Maroon", lastName: "5")
                    addExample(firstName: "Linkin", lastName: "Park")
                    
                    try? moc.save()
                }
            }
            .padding()
            
            // list of matching singers
            FilteredList(filterKey: filterKey,
                         predicate: predicate,
                         filterValue: nameFilter,
                         sortDescriptors: sortDescriptors) { (singer: Singer) in
                Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
            }
            
            
        }
        .navigationTitle("Singer")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            Button {
                showingOrderAlert = true
            } label: {
                Label("Order", systemImage: "list.bullet")
            }
            .alert("Order by", isPresented: $showingOrderAlert) {
                Button("First Name") {
                    sortDescriptors.removeAll()
                    sortDescriptors.append(SortDescriptor(\.firstName))
                }
                
                Button("Last Name") {
                    sortDescriptors.removeAll()
                    sortDescriptors.append(SortDescriptor(\.lastName))
                }
            }
        }
    }
    
    func addExample(firstName: String, lastName: String) {
        let singer = Singer(context: moc)
        singer.firstName = firstName
        singer.lastName = lastName
    }
}

struct ChallengeView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeView()
    }
}
