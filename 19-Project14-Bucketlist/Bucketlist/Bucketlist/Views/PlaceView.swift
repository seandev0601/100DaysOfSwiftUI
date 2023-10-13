//
//  PlaceDetailView.swift
//  Bucketlist
//
//  Created by Po Hsiang Chao on 2023/10/13.
//

import SwiftUI

struct PlaceView: View {
    @State var page: Page
    
    var body: some View {
        HStack {
            AsyncImage(url: page.imageUrl) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100, alignment: .center)
                    .clipped()
            } placeholder: {
                ProgressView()
                    .frame(width: 100, height: 100)
            }
            
            
            VStack(alignment: .leading) {
                Text(page.title)
                    .font(.headline)
                    .padding(.bottom, 2)
                Text(page.description)
                    .font(.caption)
                    .italic()
                Spacer()
            }
            .padding(.top, 10)
        }
        .frame(height: 100)
    }
}

struct PlaceDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let thumbnail = Thumbnail(source: "https://upload.wikimedia.org/wikipedia/commons/thumb/e/ea/Taipei_Skyline_2022.06.29.jpg/500px-Taipei_Skyline_2022.06.29.jpg", width: 500, height: 333)
        let page = Page(pageid: 10, title: "Taipei", thumbnail: thumbnail, terms: ["description":["skyscraper located in Xinyi District, Taipei, Taiwan"]])
        
        PlaceView(page: page)
    }
}
