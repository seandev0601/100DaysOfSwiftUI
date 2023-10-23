//
//  HomeView.swift
//  MemorySnap
//
//  Created by Po Hsiang Chao on 2023/10/21.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                if viewModel.isEmpty {
                    tipView
                } else {
                    listView
                }
                
                addButton
            }
            .background(
                LinearGradient(gradient: Gradient(colors: [.green, .white]), startPoint: .top, endPoint: .bottomLeading)
            )
            .scrollContentBackground(.hidden)
            .navigationTitle("Memory Snap")
            .sheet(isPresented: $viewModel.showingImagePicker) {
                ImagePicker(image: $viewModel.inputImage)
            }
            .onChange(of: viewModel.inputImage) { newValue in
                viewModel.showingAddView = true
            }
            .sheet(isPresented: $viewModel.showingAddView) {
                AddView(image: viewModel.inputImage) { newUser in
                    viewModel.add(user: newUser)
                }
            }
        }
    }
}

extension HomeView {
    
    var tipView: some View {
        Text("Click the plus button to add new friend or new view.")
            .font(.title)
            .foregroundColor(.secondary)
            .padding()
    }
    
    var listView: some View {
        List {
            ForEach(viewModel.users) { user in
                NavigationLink {
                    DetailView(user: user)
                } label: {
                    HStack(spacing: 15) {
                        user.image?
                            .resizable()
                            .scaledToFill()
                            .frame(width: 60, height: 60, alignment: .center)
                            .clipShape(Circle())
                        Text(user.name)
                            .font(.title)
                            .bold()
                            .foregroundColor(.primary)
                    }
                }
            }
        }
    }
    
    var addButton: some View {
        VStack {
            Spacer()
            
            HStack {
                Spacer()
                
                Button {
                    viewModel.showingImagePicker = true
                } label: {
                    Image(systemName: "plus")
                        .padding()
                        .background(.black.opacity(0.75))
                        .foregroundColor(.white)
                        .font(.title)
                        .clipShape(Circle())
                        .padding(.trailing)
                }
            }
        }
        .padding()
    }
}

#Preview {
    HomeView()
}
