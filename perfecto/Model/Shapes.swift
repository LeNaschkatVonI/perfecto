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
