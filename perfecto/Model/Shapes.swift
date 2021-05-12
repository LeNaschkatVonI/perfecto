//
//  Shapes.swift
//  perfecto
//
//  Created by Максим Нуждин on 16.04.2021.
//

import SwiftUI

struct infoTextShape: View {
    
    var info: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .frame(height: 80)
            .opacity(0.9)
            .overlay(Text(info)
                        .foregroundColor(.picoPink)
                        .multilineTextAlignment(.center))
}
}

struct anotherShape: View {
    var body: some View {
        Capsule()
            .strokeBorder(Color.white, lineWidth: 3, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
            .overlay(Text("Hit me".uppercased())
                        .foregroundColor(.white)
                        .bold()
                        .font(.title3)
                        .padding())
    }
}

struct previewProvider: PreviewProvider {
    
    static var previews: some View {
        infoTextShape(info: "11")
        anotherShape()
    }
}
