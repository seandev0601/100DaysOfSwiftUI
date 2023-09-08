//
//  CountryCandyView.swift
//  CoreDataProject
//
//  Created by Po Hsiang Chao on 2023/9/8.
//

import SwiftUI

struct CountryCandyView: View {
    @Environment(\.managedObjectContext) var moc
    
    @FetchRequest(sortDescriptors: []) var countries: FetchedResults<Country>
    
    var body: some View {
        VStack {
            List {
                ForEach(countries, id:\.self) { country in
                    Section(country.wrappedFullName) {
                        ForEach(country.candyArray, id:\.self) { candy in
                            Text(candy.wrappedName)
                        }
                    }
                }
            }
            
            Button("Add Examples") {
                addCandy(name: "Mars", countryShortName: "UK", countryFullName: "United Kingdom")
                addCandy(name: "KitKat", countryShortName: "UK", countryFullName: "United Kingdom")
                addCandy(name: "Twix", countryShortName: "UK", countryFullName: "United Kingdom")
                addCandy(name: "Toblerone", countryShortName: "CH", countryFullName: "Switzer land")
                
                try? moc.save()
            }
        }
        .navigationTitle("Candy")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func addCandy(name: String, countryShortName: String, countryFullName: String) {
        let candy = Candy(context: moc)
        candy.name = name
        candy.origin = Country(context: moc)
        candy.origin?.shortName = countryShortName
        candy.origin?.fullName = countryFullName
    }
}

struct CountryCandyView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CountryCandyView()
        }
    }
}
