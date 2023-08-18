//
//  AddActivityView.swift
//  HabitTracker
//
//  Created by Po Hsiang Chao on 2023/8/16.
//

import SwiftUI

struct AddActivityView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var activities: Activities
    
    @State private var title = ""
    @State private var description = ""
    @State private var selectIcon: SymbolIcon = .heart
    @State private var selectColor: AppColor = .red
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Title", text: $title)
                    TextField("Description", text: $description)
                }
                
                Section("Icon") {
                    HStack {
                        ForEach(SymbolIcon.allCases, id: \.self) { icon in
                            Image(systemName: icon.rawValue + (icon == selectIcon ? ".fill" : ""))
                                .imageScale(.large)
                                .foregroundStyle(selectColor.color)
                                .padding()
                                .onTapGesture {
                                    selectIcon = icon
                                }
                        }
                    }
                    
                }
                
                Section("Color") {
                    HStack {
                        ForEach(AppColor.allCases, id: \.self) { color in
                            Image(systemName: "circle" + (selectColor == color ? ".fill" : ""))
                                .imageScale(.large)
                                .foregroundStyle(color.color)
                                .padding()
                                .onTapGesture {
                                    selectColor = color
                                }
                            
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .background(Color.customBlue)
            .scrollContentBackground(.hidden)
            .navigationTitle("Add Activity")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        let activity = Activity(title: title, description: description, completions: [], iconName: selectIcon.rawValue, iconColor: selectColor.hexString)
                        activities.addActivity(activity)
                        
                        dismiss()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

struct AddActivityView_Previews: PreviewProvider {
    static var previews: some View {
        AddActivityView(activities: Activities())
    }
}
