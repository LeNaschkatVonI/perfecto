//
//  Shapes.swift
//  perfecto
//
//  Created by Максим Нуждин on 16.04.2021.
//

import SwiftUI

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
        anotherShape()
    }
}
