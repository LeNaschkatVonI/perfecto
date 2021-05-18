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
        .background(
            RingsView()
        )
    }
}

struct TopView: View {
    
    @Binding var game: Game
    @State private var sheetIsVisible = false
    
    var body: some View {
        HStack {
            Button(action: {
                game.restart()
            }) {
                RoundButtonStroke(systemName: "arrow.counterclockwise")
            }
            Spacer()
            Button(action: {
                sheetIsVisible.toggle()
            }) {
                RoundButtonStroke(systemName: "list.dash")
            }.sheet(isPresented: $sheetIsVisible, content: {
                leaderBoardView()
            })
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
                RoundedRectangle(cornerRadius: Constants.General.roundedCornerRadius)
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

struct RingsView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            Color("Tint")
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            ForEach(1..<6) { ring in
                let size = CGFloat(ring) * 100
                let darkOpacity = 0.3 - 0.05 * Double(ring)
                let lightOpacity = 0.9 - 0.1 * Double(ring)
                let opacity = colorScheme == .dark ? darkOpacity : lightOpacity
                Circle()
                    .stroke(lineWidth: 20)
                    .fill(RadialGradient(gradient: Gradient(colors: [.gray.opacity(opacity), Color("TextColor").opacity(0)]), center: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, startRadius: 100, endRadius: 300))
                    .frame(width: size, height: size)
                
            }
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
