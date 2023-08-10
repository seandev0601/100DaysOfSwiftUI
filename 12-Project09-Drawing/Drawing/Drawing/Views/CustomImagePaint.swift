//
//  CustomImagePaint.swift
//  Drawing
//
//  Created by Po Hsiang Chao on 2023/8/10.
//

import SwiftUI

struct CustomImagePaint: View {
    
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .frame(width: 150, height: 150)
                .background(.red)
            HStack {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                    .frame(width: 150, height: 150)
                    .border(.red, width: 20)
                
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                    .frame(width: 150, height: 150)
                    .background(Image("Example").resizable())
            }
            
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .frame(width: 150, height: 150)
                .border(ImagePaint(image: Image("Example"), scale: 0.05), width: 30)
            HStack {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                    .frame(width: 150, height: 150)
                    .border(ImagePaint(image: Image("Example"), sourceRect: CGRect(x: 0, y: 0.25, width: 1, height: 0.5), scale: 0.1), width: 30)
                
                Capsule()
                    .strokeBorder(ImagePaint(image: Image("Example"), scale: 0.05), lineWidth: 20)
                    .frame(width: 200, height: 100)
            }
            
        }
        
    }
}

struct CustomImagePaint_Previews: PreviewProvider {
    static var previews: some View {
        CustomImagePaint()
    }
}
