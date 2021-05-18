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
            .foregroundColor(Color("TextColor"))
            .frame(width: Constants.General.roundRectViewWidth, height: Constants.General.roundRectViewHeight)
            .overlay(
                Circle()
                    .strokeBorder(Color("ButtonStrokeColor"),lineWidth: Constants.General.strokeWidth, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
            )
    }
}

struct RoundedTextView: View {
    
    var text: String
    var body: some View {
        
        Text(text)
            .bold()
            .font(.title2)
            .foregroundColor(Color("rowViewColor"))
            .frame(width: Constants.General.roundRectViewWidth, height: Constants.General.roundRectViewHeight)
            .overlay(
                Circle()
                    .strokeBorder(Color("ButtonStrokeColor"),lineWidth: Constants.General.strokeWidth, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
            )
    }
}

struct RoundButtonFilled: View {
    
    var systemName: String
    var body: some View {
        Image(systemName: systemName)
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .frame(width: Constants.General.roundRectViewWidth, height: Constants.General.roundRectViewHeight)
            .foregroundColor(Color("TextColor"))
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
            RoundedTextView(text: "5")
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
