//
//  WizardView.swift
//  CoreDataProject
//
//  Created by Po Hsiang Chao on 2023/9/3.
//

import SwiftUI

struct WizardView: View {
    @Environment(\.managedObjectContext) var moc
    
    @FetchRequest(sortDescriptors: []) var wizards: FetchedResults<Wizard>
    
    @State private var wizardName = ""
    @State private var showingError = false
    @State private var errorMessage = ""
    
    var body: some View {
        VStack {
            TextField("Wizard name:", text: $wizardName)
                .padding()
                .border(.black)
            
            HStack {
                
                Spacer()
                
                Button("Add") {
                    if wizardName.isEmpty {
                        errorMessage = "Please enter name."
                        showingError = true
                    } else {
                        let wizard = Wizard(context: self.moc)
                        wizard.name = wizardName
                        wizardName = ""
                    }
                }
                .foregroundColor(.white)
                .padding()
                .background(.blue)
                .clipShape(Capsule())

                
                Button("save") {
                    if moc.hasChanges {
                        self.save()
                    } else {
                        errorMessage = "You didn't add any data."
                        showingError = true
                    }
                }
                .foregroundColor(.white)
                .padding()
                .background(.red)
                .clipShape(Capsule())
            }
            
            List(wizards, id: \.self) { wizard in
                Text(wizard.name ?? "Unknown")
            }

            
        }
        .padding()
        .navigationTitle("Wizards")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Fault" ,isPresented: $showingError) {
            Button("OK") { }
        } message: {
            Text("\(errorMessage)")
        }
    }
    
    func save() {
        do {
            try self.moc.save()
        } catch {
            errorMessage = error.localizedDescription
            showingError = true
            print(error.localizedDescription)
        }
    }
}

struct WizardView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            WizardView()
        }
    }
}
