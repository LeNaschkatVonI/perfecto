//
//  RoundViews.swift
//  perfecto
//
//  Created by Максим Нуждин on 12.05.2021.
//

import SwiftUI

struct RoundButtonStroke: View {
    
    var systemName: String
    var body: some View {
        Image(systemName: systemName)
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .foregroundColor(Color("ButtonColorFilled"))
            .frame(width: 56, height: 56)
            .overlay(
                Circle()
                    .strokeBorder(Color("ButtonStrokeColor"),lineWidth: 3.0, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
            )
    }
}


struct RoundButtonFilled: View {
    
    var systemName: String
    var body: some View {
        Image(systemName: systemName)
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .frame(width: 56, height: 56)
            .foregroundColor(Color("ButtonColorFilled"))
            .background(
                Circle()
                    .fill(Color("ButtonBackgroundColorFilled"))
            )
    }
}

struct PreviewView: View {
    
    var body: some View {
        VStack {
            RoundButtonStroke(systemName: "list.bullet")
            RoundButtonFilled(systemName: "list.bullet")
        }
    }
}

struct RoundViews_Previews: PreviewProvider {
    static var previews: some View {
        PreviewView()
        PreviewView().preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        PreviewView()
            .previewLayout(.fixed(width: 560, height: 320))
        PreviewView()
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
            .previewLayout(.fixed(width: 560, height: 320))
    }
}
