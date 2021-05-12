//
//  BackgroundView.swift
//  perfecto
//
//  Created by Максим Нуждин on 12.05.2021.
//

import SwiftUI

struct BackgroundView: View {
    
    @Binding var game: Game
    
    var body: some View {
        VStack {
            TopView(game: $game)
            Spacer()
            BottomView(game: $game)
        }.padding()
        .background(Color("Tint")
                        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/))
        
    }
}

struct TopView: View {
    
    @Binding var game: Game
    
    var body: some View {
        HStack {
            RoundButtonStroke(systemName: "arrow.counterclockwise")
            Spacer()
            RoundButtonStroke(systemName: "list.dash")
        }
    }
}

struct gameStats: View {
    var title: String
    var text: String
    
    var body: some View {
        Text("\(title) \n \(text)")
            .foregroundColor(Color("TextColor"))
            .bold()
            .kerning(-0.2)
            .padding()
            .multilineTextAlignment(.center)
            .overlay(
                RoundedRectangle(cornerRadius: 25)
                    .strokeBorder(Color("ButtonStrokeColor"),lineWidth: 3, antialiased: true))
    }
}

struct BottomView: View {
    
    @Binding var game: Game
    
    var body: some View {
        HStack {
            gameStats(title: "Score", text: String(game.score))
            Spacer()
            gameStats(title: "Percentage", text: String(format: "%.1f", game.percentage))
            Spacer()
            gameStats(title: "Round", text: String(game.round))
        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView(game: .constant(Game()))
        BackgroundView(game: .constant(Game()))
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}
