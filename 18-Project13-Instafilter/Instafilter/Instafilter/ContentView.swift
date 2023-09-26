//
//  ContentView.swift
//  Instafilter
//
//  Created by Po Hsiang Chao on 2023/9/17.
//

import SwiftUI

struct ContentView: View {
    @State private var showingConfirmation = false
    @State private var backgroundColor = Color.white

    var body: some View {
        Day63PractiseView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
