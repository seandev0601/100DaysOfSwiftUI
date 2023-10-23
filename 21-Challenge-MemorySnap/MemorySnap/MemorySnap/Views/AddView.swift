//
//  AddUserView.swift
//  MemorySnap
//
//  Created by Po Hsiang Chao on 2023/10/21.
//

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var viewModel: ViewModel
    var onSave: (User) -> Void
    
    var body: some View {
        NavigationView {
            VStack {
                
                if let image = viewModel.inputImage {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: .infinity)
                        .frame(height: 400)
                        .cornerRadius(10)
                        .shadow(radius: 4)
                }
                
                TextField("Name", text: $viewModel.name)
                    .foregroundColor(.primary)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.gray.opacity(0.3))
                    .cornerRadius(10)
                    .padding()
                Spacer()
                
            }
            .background(
                LinearGradient(gradient: Gradient(colors: [.secondary, .white]), startPoint: .top, endPoint: .bottom)
            )
            .navigationTitle("Add")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
    
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        if let newUser = viewModel.save() {
                            onSave(newUser)
                        }
                        dismiss()
                    }
                    .disabled(viewModel.disable)
                }
            }
        }
    }
    
    init(image: UIImage?, onSave: @escaping (User) -> Void) {
        _viewModel = StateObject(wrappedValue:ViewModel(inputImage: image))
        self.onSave = onSave
    }
}

#Preview {
    AddView(image: UIImage(resource: .example)) { user in
        
    }
}
